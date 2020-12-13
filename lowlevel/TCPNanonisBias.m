classdef TCPNanonisBias < handle
% TCPNanonisBias: Bias Module in Nanonis
    
    properties
        tcpobj = [];        
    end
    
    methods
        %% inital
        function obj = TCPNanonisBias(tcp)
            obj.tcpobj = tcp;
        end
        
        %% command
        function varargout = Set(obj, bias)
            %set bias
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'Bias.Set', '', single(bias));
        end
        
        function varargout = Get(obj)            
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'Bias.Get', 'single');            
        end
        
        function varargout = RangeGet(obj)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'Bias.RangeGet', '1dstring uint16');
        end
        
        function varargout = RangeSet(obj, rangeIdx)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'Bias.RangeSet', '', uint16(rangeIdx));
        end
        
        function varargout = CalibrSet(obj, calibration, offset)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'Bias.CalibrSet', '', single(calibration), single(offset));
        end
        
        function varargout = CalibrGet(obj)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'Bias.CalibrGet', 'single single');
        end
        
        function varargout = Pulse(obj, waitUnitl, width, value, Zhold, abousRelative)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'Bias.Pulse', '', uint32(waitUnitl), single(width), single(value), uint16(Zhold), uint16(abousRelative));
        end

        
    end
end
    