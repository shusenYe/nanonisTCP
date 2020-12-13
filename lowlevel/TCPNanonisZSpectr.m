classdef TCPNanonisZSpectr < handle
    properties
        tcpobj = [];        
    end
    
    methods
        %% inital
        function obj = TCPNanonisZSpectr(tcp)
            obj.tcpobj = tcp;
        end
        
        %% command        
        function varargout = Open(obj)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'ZSpectr.Open', '');
        end
        
        function varargout = Start(obj, getData, savename)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'ZSpectr.Start', '1dstring 2dsingle 1dsingle', uint32(getData), int32(numel(char(savename))), char(savename));
        end
        
        function varargout = Stop(obj)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'ZSpectr.Stop');
        end
        
        function varargout = StatusGet(obj)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'ZSpectr.StatusGet', 'uint32');
        end
        
        function varargout = ChsSet(obj, chnIdx)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'ZSpectr.ChsSet', '', int32(numel(chnIdx)), int32(chnIdx));
        end
        
        function varargout = ChsGet(obj)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'ZSpectr.ChsGet', '1dint32');
        end
        
        function varargout = PropsSet(obj, backSweep, nPoints, nSwpeeps, autosave, showdiag, saveall)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'ZSpectr.PropsSet', '', ...
                uint16(backSweep), int32(nPoints), uint16(nSwpeeps), uint16(autosave), uint16(showdiag), uint16(saveall));
        end
        
        function varargout = PropsGet(obj)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'ZSpectr.PropsGet', 'uint16 int32 1dstring 1dstring 1dstring uint16 uint16');
        end
        
        function varargout = AdvPropsSet(obj)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'ZSpectr.AdvPropsSet', 'single uint16 uint16 uint16');
        end
        
        function varargout = AdvPropsGet(obj, ForBackdelay, recordZ, lockinRun, resetZ)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'ZSpectr.AdvPropsGet', '', single(ForBackdelay), uint16(recordZ), uint16(lockinRun), uint16(resetZ));
        end
        
        function varargout = RangeSet(obj, zOffset, zSweepDistance)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'ZSpectr.RangeSet', '', single(zOffset), single(zSweepDistance));
        end
        
        function varargout = RangeGet(obj)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'ZSpectr.RangeGet', 'single single');
        end
               
        function varargout = TimingSet(obj, zAvgTime, initialSettlingTime, maxSlewRate, settlingTime, integTime, endSettlingTime, zCtrlTime)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'ZSpectr.TimingSet', '', ...
                single(zAvgTime), single(initialSettlingTime), single(maxSlewRate), ...
                single(settlingTime), single(integTime), single(endSettlingTime), single(zCtrlTime));
        end
        
        function varargout = TimingGet(obj)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'ZSpectr.TimingGet', 'single single single single single single single');
        end
        
        function varargout = RetractDelaySet(obj, retractDelay)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'ZSpectr.RetractDelaySet', '', single(retractDelay));
        end
        
        function varargout = RetractDelayGet(obj)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'ZSpectr.RetractDelayGet', 'single');
        end
        
        function varargout = RetractSet(obj, enable, threshold, signalIdx, comparsion)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'ZSpectr.RetractSet', '', ...
                uint16(enable), single(threshold), int32(signalIdx), int16(comparsion));
        end
        
        function varargout = RetractGet(obj)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'ZSpectr.RetractGet', 'uint16 single int32 uint16');
        end
        
        function varargout = Retract2ndSet(obj, secCondition, thresold, signalIdx, comparsion)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'ZSpectr.Retract2ndSet', '', ...
                int32(secCondition), single(thresold), int32(signalIdx), uint16(comparsion));
        end
        
        function varargout = Retract2ndGet(obj)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'ZSpectr.Retract2ndGet', 'int32 single int32 uint16');
        end

        
    end
end
    