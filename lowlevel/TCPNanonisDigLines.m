classdef TCPNanonisDigLines < handle
    properties
        tcpobj = [];        
    end
    
    methods
        %% inital
        function obj = TCPNanonisDigLines(tcp)
            obj.tcpobj = tcp;
        end
        
        %% command
        function varargout = PropsSet(obj, digitalLine, port, direction, polarity)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'DigLines.PropsSet', '', ...
                uint32(digitalLine), uint32(port), uint32(direction), uint32(polarity));
        end
        
        function varargout = OutStatusSet(obj, port, digitalLine, status)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'DigLines.OutStatusSet', '', ...
                uint32(port), uint32(digitalLine), uint32(status));
        end
        
        function varargout = TTLValGet(obj, port)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'DigLines.TTLValGet', '1dint32', ...
                uint32(port));
        end
        
        function varargout = Pulse(obj, port, digitalLines, width, pause, waitUnitlFinished)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'DigLines.OutStatusSet', '', ...
                uint32(port), int32(nueml(digitalLines)), int32(digitalLines), single(width), single(pause), uint32(waitUnitlFinished));
        end
    end
end
    