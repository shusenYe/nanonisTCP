classdef TCPNanonisFolMe < handle
    properties
        tcpobj = [];        
    end
    
    methods
        %% inital
        function obj = TCPNanonisFolMe(tcp)
            obj.tcpobj = tcp;
        end
        
        %% command
        function varargout = XYPosSet(obj, x, y, waitForMove)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'FolMe.XYPosSet', '',...
                double(x), double(y), uint32(waitForMove));
        end
        
        function varargout = XYPosGet(obj, waitForNewest)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'FolMe.XYPosGet', 'double double', uint32(waitForNewest));
        end
        
        function varargout = SpeedSet(obj, speed, customSpeed)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'FolMe.SpeedSet', '',...
                single(speed), uint32(customSpeed));
        end
        
        function varargout = SpeedGet(obj)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'FolMe.SpeedGet', 'single uint32');
        end
       
        function varargout = OversamplGet(obj)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'FolMe.OversamplGet', 'int32 single');
        end
        
        function varargout = OversamplSet(obj, overSampling)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'FolMe.OversamplSet', '', int32(overSampling));
        end
        
        function varargout = Stop(obj)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'FolMe.Stop', '');
        end
        
    end
end
    