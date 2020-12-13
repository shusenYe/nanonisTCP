function varargout =  TCPQuery(TCPobject, command, outList, varargin)
% TCPQuery can conduct a single query with nanonis
% TCPobject is a tcp class object
% command is command string, such as 'Bias.Get'
% outList is a string of all output argument type
% such as 'single single int32 1d'
% varargin is all input arguments.
% type of varargin is IMORTANT, int32 single uin16 are not same

% make header
    header = char(command);
    header = uint8([header zeros(1, 40 - numel(header))]);
    header(38) = uint8(1);
    bytes_in = 0;
    body = uint8(zeros(1,100));        
    index = 1;    

% make query information body
    for i=1:numel(varargin)        
        temp = varargin{i};
        if ischar(temp)
            bytes_in = bytes_in + numel(temp);
            body(index:bytes_in) = uint8(temp);            
        else            
            temp = temp(end : -1 : 1);
            bytes_in = bytes_in + whos('temp').bytes;        
            body(index:bytes_in) = flip(typecast(temp, 'uint8'));
        end
        index = bytes_in + 1;        
    end
    header(33:36) = flip(typecast(int32(bytes_in), 'uint8'));
    TCPobject.read();
    message = [header body(1:bytes_in)];            
% write in TCP    
    TCPobject.write(message);

% wait for header of reply
    while TCPobject.BytesAvailable < 40            
    end
    header = TCPobject.read(40);
    bytes_body = typecast(flip(header(33:36)), 'int32');
% wait for body of reply    
    while TCPobject.BytesAvailable < bytes_body
    end
% make reply    
    response = TCPobject.read;
    varargout = hex2response(response, outList);        
end

function response = hex2response(data, outList)
    if isempty(outList)        
        response = {data};
        checkNanonisTCPerror(data, 1);
        return
    end
    if ~iscell(outList)
        outList = strsplit(outList);
    end
    outList = lower(outList);        

    index = 1;
    response = cell(1, numel(outList));    
    for i=1:numel(outList)        
        [response{i}, index] = readOneOutput(data, index, outList{i});        
    end
    response{end + 1} = data;
end

function [output, index] = readOneOutput(data, index, outType)    
    if outType == "string"
        nChar = typecast(flip(data(index:index + 4 - 1)), 'int32');
        index = index + 4;
        output = char(data(index:index + nChar - 1));
        index = index + nChar;        
        return
    end
    if outType == "1dstring"           
        nOut = double(typecast(flip(data(index + 4:index + 8 - 1)), 'int32'));        
        index = index + 8;
        output = cell(1, nOut);
        for i=1:nOut
            nChar = double(typecast(flip(data(index:index + 4 - 1)), 'int32'));
            output{i} = char(data(index + 4:index + 4 + nChar - 1));
            index = index + 4 + nChar;
        end
        return
    end
    if outType(1:2) == "1d"
        nOut = typecast(flip(data(index:index + 4 - 1)), 'int32');
        index = index + 4;
        output = zeros(1, nOut);
        len = type2bytes(outType(3:end));
        for i=1:nOut            
            output(i) = typecast(flip(data(index:index + len - 1)), outType(3:end));
            index = index + len;
        end
        return
    end
    if outType(1:2) == "2d"
        nRow = typecast(flip(data(index:index + 4 - 1)), 'int32');        
        nCol = typecast(flip(data(index + 4:index + 8 - 1)), 'int32');
        index = index + 8;                
        len = 4;    % only single float in 2D Array (TCPProtocol_SPM.pdf)        
        output = flip(typecast(flip(data(index:index + len * nRow * nCol - 1)), 'single'));
        output = reshape(output, [nCol nRow])';
        return
    end        
    len = type2bytes(outType);
    output = typecast(flip(data(index:index + len - 1)), outType);
    index = index + len;
end

function bytes = type2bytes(typename)
    switch typename
        case "single"
            bytes = 4;
        case "double"
            bytes = 8;
        case "uint16"
            bytes = 2;
        case "uint32"
            bytes = 4;
        case "int32"
            bytes = 4;
    end
end

