classdef TCPNanonisGenSwp < handle
    properties
        tcpobj = [];        
    end
    
    methods
        %% inital
        function obj = TCPNanonisGenSwp(tcp)
            obj.tcpobj = tcp;
        end
        
        %% command
        function varargout = AcqChsSet(obj, chnIdx)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'GenSwp.AcqChsSet', '',int32(numel(chnIdx)), chnIdx);
        end
        
        function varargout = AcqChsGet(obj)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'GenSwp.AcqChsGet', '1dint32');
        end
           
        function varargout = swpSignalSet(obj, chnName)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'GenSwp.SwpSignalSet', '', int32(numel(char(chnName))), char(chnName));
        end
        
        function varargout = swpSignalGet(obj)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'GenSwp.SwpSignalGet', 'string 1dstring');
        end
           
        function varargout = LimitsGet(obj)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'GenSwp.LimitsGet', 'single single');
        end
        
        function varargout = LimitsSet(obj, lowerLimit, upperLimit)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'GenSwp.LimitsSet', '', single(lowerLimit), single(upperLimit));
        end
        
        function varargout = PropsSet(obj, initialSettling, maxSlewRate, nSteps, period, autosave, savediag, settlingTime)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'GenSwp.PropsSet', '', ...
                single(initialSettling), single(maxSlewRate), int32(nSteps), uint16(period), uint32(autosave), uint32(savediag), single(settlingTime));
        end
        
        function varargout = PropsGet(obj)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'GenSwp.PropsGet', 'single single int32 uint16 uint32 uint32 single');
        end
        
        function varargout = Start(obj, getData, sweepDir, basename, resetSignal)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'GenSwp.Start', '1dstring 2dsingle',...
                uint32(getData), uint32(sweepDir), int32(numel(char(basename))), char(basename), uint32(resetSignal));
        end
        
        function varargout = Stop(obj)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'GenSwp.Stop', '');
        end
        
        function varargout = Open(obj)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'GenSwp.Open', '');
        end
        
    end
end
    