classdef TCPNanonisMotor < handle
    properties
        tcpobj = [];        
    end
    
    methods
        %% inital
        function obj = TCPNanonisMotor(tcp)
            obj.tcpobj = tcp;
        end
        
        %% command
        function varargout = StartMove(obj, direction, nSteps, group, waitUntilFinished)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'Motor.StartMove', '', ...
                uint32(direction), uint16(nSteps), uint32(group), uint32(waitUntilFinished));
        end
        
        function varargout = StartClosedLoop(obj, AbsOrRel, targetX, targetY, targetZ, waitUntilFinished)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'Motor.StartClosedLoop', '', ...
                uint32(AbsOrRel), double(targetX), double(targetY), double(targetZ), uint32(waitUntilFinished));
        end
        
        function varargout = StopMove(obj)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'Motor.StopMove', '');
        end
        
        function varargout = PosGet(obj)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'Motor.PosGet', 'double double double');
        end
        
        function varargout = StepCounterGet(obj, resetX, resetY, resetZ)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'Motor.StepCounterGet', 'int32 int32 int32',...
                uint32(resetX), uint32(resetY), uint32(resetZ));
        end
        
        function varargout = FreqAmpSet(obj, frequency, amplitude)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'Motor.FreqAmpSet', '', ...
                single(frequency), single(amplitude));
        end
        
        function varargout = FreqAmpGet(obj)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'Motor.FreqAmpGet', 'single single');
        end
        
    end
end
    