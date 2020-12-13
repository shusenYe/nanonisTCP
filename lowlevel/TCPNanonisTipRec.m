classdef TCPNanonisTipRec < handle
    properties
        tcpobj = [];        
    end
    
    methods
        %% inital
        function obj = TCPNanonisTipRec(tcp)
            obj.tcpobj = tcp;
        end
        
        %% command
        function varargout = BufferSizeSet(obj, bufferSize)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'TipRec.BufferSizeSet', '', int32(bufferSize));
        end
        
        function varargout = BufferSizeGet(obj)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'TipRec.BufferSizeGet', 'int32');
        end
        
        function varargout = BufferClear(obj)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'TipRec.BufferClear', '');
        end
        
        function varargout = DataGet(obj)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'TipRec.DataGet', '1dint32, 2dsingle');
        end
        
        function varargout = DataSave(obj, clearBuffer, basename)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'TipRec.DataGet', '', ...
                uint32(clearBuffer), int32(numel(char(basename))), char(basename));
        end        
        
    end
end
    