classdef TCPNanonisSignals < handle
    properties
        tcpobj = [];        
    end
    
    methods
        %% inital
        function obj = TCPNanonisSignals(tcp)
            obj.tcpobj = tcp;
        end
        
        %% command
        function varargout = NamesGet(obj)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'Signals.NamesGet', '1dstring');
        end
        
        function varargout = InSlotSet(obj, slot, signalIdx)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'Signals.InSlotSet', '', int32(slot), int32(signalIdx));
        end
        
        function varargout = InSlotsGet(obj)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'Signals.InSlotsGet', '1dstring 1dint32');
        end
        
        function varargout = CalibrGet(obj, signalIdx)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'Signals.CalibrGet', 'single single', int32(signalIdx));
        end
        
        function varargout = RangeGet(obj, signalIdx)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'Signals.RangeGet', 'single single', int32(signalIdx));
        end
        
        function varargout = ValGet(obj, signalIdx, waitForNewest)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'Signals.ValGet', 'single', int32(signalIdx), uint32(waitForNewest));
        end
        
        function varargout = ValsGet(obj, signalIdxs, waitForNewest)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'Signals.ValsGet', '1dsingle', ...
                int32(numel(signalIdxs)), int32(signalIdxs), uint32(waitForNewest));
        end
        
        function varargout = MeasNamesGet(obj)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'Signals.MeasNamesGet', '1dstring');
        end
        
        function varargout = AddRTGet(obj)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'Signals.AddRTGet', '1dstring string string');
        end
        
        function varargout = AddRTSet(obj, addSignal1, addSignal2)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'Signals.AddRTSet', '', int32(addSignal1), int32(addSignal2));
        end

    end
end
    