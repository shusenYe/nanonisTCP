function checkNanonisTCPerror(response, index)
% check Nanonis reply error
if response(index + 3) > 0
    errorIdx = typecast(flip(response(index + 4:index + 7)), 'int32');
    errorText = char(response(index + 8:end));
    error('Nanonis ERROR CODE: %d \nNanonis ERROR TEXT: %s', errorIdx, errorText);    
end
end