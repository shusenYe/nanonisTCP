classdef TCPNanonisCurrent < handle
    properties
        tcpobj = [];        
    end
    
    methods
        %% inital
        function obj = TCPNanonisCurrent(tcp)
            obj.tcpobj = tcp;
        end
        
        %% command        
        function varargout = Get(obj)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'Current.Get', 'single');
        end 
        
        function varargout = l00Get(obj)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'Current.100Get', 'single');
        end 
        
        function varargout = BEEMGet(obj)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'Current.BEEMGet', 'single');
        end 
        
        function varargout = GainSet(obj, gainIdx)        
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'Current.GainSet', '', uint16(gainIdx));
        end 
        
        function varargout = GainsGet(obj)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'Current.GainsGet', '1dstring uint16');
        end 
        
        function varargout = CalibrSet(obj, calibration, offset)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'Current.CalibrSet', '', double(calibration), double(offset));
        end 
        
        function varargout = CalibrGet(obj)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'Current.CalibrGet', 'double double');
        end 
        
    end
end
    