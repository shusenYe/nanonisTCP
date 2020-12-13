classdef TCPNanonisUserIn< handle
% TCPNanonisUserIn: UserIn Module in Nanonis
    
    properties
        tcpobj = [];        
    end
    
    methods
        %% inital
        function obj = TCPNanonisUserIn(tcp)
            obj.tcpobj = tcp;
        end
        
        %% command
        function varargout = CalibrSet(inputIdx, calibrPerVolt, offset)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'UserIn.CalibrSet', '', int32(inputIdx), single(calibrPerVolt), single(offset));
        end
        
    end
end
    