classdef TCPNanonisUserOut < handle
% TCPNanonisUserOut: UserOut Module in Nanonis
    
    properties
        tcpobj = [];        
    end
    
    methods
        %% inital
        function obj = TCPNanonisUserOut(tcp)
            obj.tcpobj = tcp;
        end
        
        %% command
        function varargout = ModeSet(obj, outputIdx, outputMode)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'UserOut.ModeSet', '', int32(outputIdx), single(outputMode));
        end
        
        function varargout = ModeGet(obj, outputIdx)            
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'UserOut.ModeGet', 'uint16', int32(outputIdx));            
        end
        
        function varargout = MonitorChSet(obj, outputIdx, moinitorChnIdx)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'UserOut.MonitorChSet', '', int32(outputIdx), int32(moinitorChnIdx));
        end
        
        function varargout = MonitorChGet(obj, outputIdx)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'UserOut.MonitorChGet', 'int32', int32(outputIdx));
        end
        
        function varargout = ValSet(obj, outputIdx, outputVal)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'UserOut.ValSet', '', int32(outputIdx), single(outputVal));
        end
        
        function varargout = CalibrSet(obj, outputIdx, calibrPreVolt, offsetInPhysUnit)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'UserOut.CalibrSet', '', int32(outputIdx), single(calibrPreVolt), single(offsetInPhysUnit));
        end
        
        function varargout = CalcSignalNameSet(obj, outputIdx, calSignalName)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'UserOut.CalcSignalNameSet', '', int32(outputIdx), int32(numel(char(calSignalName))), char(calSignalName));
        end
        
        function varargout = CalcSignalNameGet(obj, outputIdx)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'UserOut.CalcSignalNameGet', 'string', int32(outputIdx));
        end
        
        function varargout = LimitsSet(obj, outputIdx, upperLim, lowerLim)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'UserOut.LimitsSet', '', int32(outputIdx), single(upperLim), single(lowerLim));
        end
        
        function varargout = LimitsGet(obj, outputIdx)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'UserOut.LimitsGet', 'single single', int32(outputIdx));
        end
    end
end
    
