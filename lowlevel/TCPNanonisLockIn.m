classdef TCPNanonisLockIn < handle
    properties
        tcpobj = [];        
    end
    
    methods
        %% inital
        function obj = TCPNanonisLockIn(tcp)
            obj.tcpobj = tcp;
        end
        
        %% command
                function varargout = ModOnOffSet(obj, iModu, lockinONOFF)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'LockIn.ModOnOffSet', '', int32(iModu), uint32(lockinONOFF));
        end
        
        function varargout = ModOnOffGet(obj, iModu)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'LockIn.ModOnOffGet', 'uint32', int32(iModu));
        end
        
        function varargout = ModSignalSet(obj, iModu, signalIdx)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'LockIn.ModSignalSet', '', int32(iModu), int32(signalIdx));
        end
        
        function varargout = ModSignalGet(obj, iModu)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'LockIn.ModSignalGet', 'int32', int32(iModu));
        end
        
        function varargout = ModPhasRegSet(obj, iModu, phaseRegIdx)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'LockIn.ModPhasRegSet', '', int32(iModu), int32(phaseRegIdx));
        end
        
        function varargout = ModPhasRegGet(obj, iModu)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'LockIn.ModPhasRegGet', 'int32', int32(iModu));
        end
        
        function varargout = ModHarmonicSet(obj, iModu, harmonic)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'LockIn.ModHarmonicSet', '', int32(iModu), int32(harmonic));
        end
        
        function varargout = ModHarmonicGet(obj, iModu)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'LockIn.ModHarmonicGet', 'int32', int32(iModu));
        end
        
        function varargout = ModPhasSet(obj, iModu, phase)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'LockIn.ModPhasSet', '', int32(iModu), single(phase));
        end
        
        function varargout = ModPhasGet(obj, iModu)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'LockIn.ModPhasGet', 'single', int32(iModu));
        end
        
        function varargout = ModAmpSet(obj, iModu, amplitude)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'LockIn.ModAmpSet', '', int32(iModu), single(amplitude));
        end
        
        function varargout = ModAmpGet(obj, iModu)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'LockIn.ModAmpGet', 'single', int32(iModu));
        end
        
        function varargout = ModPhasFreqSet(obj, iModu, frequency)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'LockIn.ModPhasFreqSet', '', int32(iModu), double(frequency));
        end
        
        function varargout = ModPhasFreqGet(obj, iModu)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'LockIn.ModPhasFreqGet', 'double', int32(iModu));
        end
                
        function varargout = DemodSignalSet(obj, iDemod, demoSigIdx)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'LockIn.DemodSignalSet', '', int32(iDemod), int32(demoSigIdx));
        end
        
        function varargout = DemodSignalGet(obj, iDemod)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'LockIn.DemodSignalGet', 'int32', int32(iDemod));
        end
        
        function varargout = DemodHarmonicSet(obj, iDemod, harmonic)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'LockIn.DemodHarmonicSet', '', int32(iDemod), int32(harmonic));
        end
        
        function varargout = DemodHarmonicGet(obj, iDemod)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'LockIn.DemodHarmonicGet', 'int32', int32(iDemod));
        end
        
        function varargout = DemodHPFilterSet(obj, iDemod, HPFilterOrder, HPCutOffFreq)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'LockIn.DemodHPFilterSet', '', ...
                int32(iDemod), int32(HPFilterOrder), single(HPCutOffFreq));
        end
        
        function varargout = DemodHPFilterGet(obj, iDemod)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'LockIn.DemodHPFilterGet', 'int32 single', int32(iDemod));
        end
        
        function varargout = DemodLPFilterSet(obj, iDemod, LPFilterOrder, LPCutOffFreq)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'LockIn.DemodLPFilterSet', '', ...
                int32(iDemod), int32(LPFilterOrder), single(LPCutOffFreq));
        end
        
        function varargout = DemodLPFilterGet(obj, iDemod)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'LockIn.DemodLPFilterGet', 'int32 single', int32(iDemod));
        end
        
        function varargout = DemodPhasRegSet(obj, iDemod, phaseRegIdx)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'LockIn.DemodPhasRegSet', '', int32(iDemod), int32(phaseRegIdx));
        end
        
        function varargout = DemodPhasRegGet(obj, iDemod)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'LockIn.DemodPhasRegGet', 'int32', int32(iDemod));
        end
        
        function varargout = DemodPhasSet(obj, iDemod, phase)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'LockIn.DemodPhasSet', '', int32(iDemod), single(phase));
        end
        
        function varargout = DemodPhasGet(obj, iDemod)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'LockIn.DemodPhasGet', 'single', int32(iDemod));
        end
        
        function varargout = DemodSyncFilterSet(obj, iDemod, syncFilter)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'LockIn.DemodSyncFilterSet', '', int32(iDemod), uint32(syncFilter));
        end
        
        function varargout = DemodSyncFilterGet(obj, iDemod)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'LockIn.DemodSyncFilterGet', 'uint32', int32(iDemod));
        end

        function varargout = DemodRTSignalsSet(obj, iDemod, RTsignals)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'LockIn.DemodRTSignalsSet', '', int32(iDemod), uint32(RTsignals));
        end
        
        function varargout = DemodRTSignalsGet(obj, iDemod)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'LockIn.DemodRTSignalsGet', 'uint32', int32(iDemod));
        end
        
    end
end
    