classdef TCPNanonisPiezo < handle
    properties
        tcpobj = [];        
    end
    
    methods
        %% inital
        function obj = TCPNanonisPiezo(tcp)
            obj.tcpobj = tcp;
        end
        
        %% command
        function varargout = TiltSet(obj, tiltX, tiltY)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'Piezo.TiltSet', '', single(tiltX), single(tiltY));
        end
        
        function varargout = TiltGet(obj)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'Piezo.TiltGet', 'single single');
        end
        
        function varargout = RangeSet(obj, rangeX, rangeY, rangeZ)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'Piezo.RangeSet', '', ...
                single(rangeX), single(rangeY), single(rangeZ));
        end
        
        function varargout = RangeGet(obj)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'Piezo.RangeGet', 'single single single');
        end
        
        function varargout = SensSet(obj, calibrX, calibrY, calibrZ)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'Piezo.SensSet', '', single(calibrX), single(calibrY), single(calibrZ));
        end
        
        function varargout = SensGet(obj)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'Piezo.SensGet', 'single single single');
        end
        
        function varargout = DriftCompSet(obj, compensation, VX, VY, VZ)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'Piezo.DriftCompSet', '', uint32(compensation), single(VX), single(VY), single(VZ));
        end
        
        function varargout = DriftCompGet(obj)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'Piezo.DriftCompGet', 'uint32 single single single uint32 uint32 uint32');
        end
        
        function varargout = CalibrGet(obj)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'Piezo.CalibrGet', 'single single single');
        end
        
        function varargout = HVAInfoGet(obj)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'Piezo.HVAInfoGet', 'single single single single uint32 uint32 uint32');
        end
        
        function varargout = HVAStatusLEDGet(obj)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'Piezo.HVAStatusLEDGet', 'uint32 uint32 uint32 uint32');
        end

    end
end
    