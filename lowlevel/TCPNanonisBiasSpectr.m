classdef TCPNanonisBiasSpectr < handle
    properties
        tcpobj = [];        
    end
    
    methods
        %% inital
        function obj = TCPNanonisBiasSpectr(tcp)
            obj.tcpobj = tcp;
        end
        
        %% command        
        function varargout = Open(obj)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'BiasSpectr.Open', '');
        end
        
        function varargout = Start(obj, getdata, name)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'BiasSpectr.Start', '1dstring 2dsingle 1dsingle', uint32(getdata), int32(numel(char(name))), char(name));
        end
        
        function varargout = Stop(obj)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'BiasqSpectr.Stop', '');
        end
        
        function varargout = StatusGet(obj)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'BiasSpectr.StatusGet', 'uint32');
        end
        
        function varargout = ChsSet(obj, chnIdx)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'BiasSpectr.ChsSet', '', int32(numel(chnIdx)), int32(chnIdx));
        end        
               
        function varargout = ChsGet(obj)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'BiasSpectr.ChsGet', '1dint32');
        end        
        
        function varargout = PropsSet(obj, saveall, numSweep, backward, nPoints, Zoffset, autosave, showdiag)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'BiasSpectr.PropsSet', '', ...
                uint16(saveall), int32(numSweep), uint16(backward), int32(nPoints), single(Zoffset), uint16(autosave), uint16(showdiag));
        end        
               
        function varargout = PropsGet(obj)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'BiasSpectr.PropsGet', 'uint16 int32 uint16 int32 1dstring 1dstring 1dstring');
        end 
        
        function varargout = AdvPropsGet(obj)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'BiasSpectr.AdvPropsGet', 'uint16 uint16 uint16 uint16');
        end        
        
        function varargout = AdvPropsSet(obj, resetBias, ZCtrl, recordZ, lockinRun)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'BiasSpectr.AdvPropsSet', '', uint16(resetBias), uint16(ZCtrl), uint16(recordZ), uint16(lockinRun));
        end 
        
        function varargout = LimitsSet(obj, startValue, endValue)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'BiasSpectr.LimitsSet', '', uint16(startValue), uint16(endValue));
        end 
        
        function varargout = LimitsGet(obj)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'BiasSpectr.LimitsGet', 'uint16 uint16');
        end 
        
        function varargout = TimingSet(obj, zAvg, zOffset, initialSett, maxSlewRate, settTime, integTime, endSett, ZCtrl)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'BiasSpectr.TimingSet', '', ...
                single(zAvg), single(zOffset), single(initialSett), single(maxSlewRate), ...
                single(settTime), single(integTime), single(endSett), single(ZCtrl));
        end
        
        function varargout = TimingGet(obj)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'BiasSpectr.TimingGet', 'single single single single single single single single');
        end 
        
        function varargout = TTLSyncGet(obj)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'BiasSpectr.TTLSyncGet', 'uint16 uint16 uint16 single single');
        end 
        
        function varargout = TTLSyncSet(obj, enable, line, polarity, timeToON, onDuration)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'BiasSpectr.TTLSyncSet', '', ...
                uint16(enable), uint16(line), uint16(polarity), single(timeToON), single(onDuration));
        end 
                
        function varargout = AltZCtrlGet(obj)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'BiasSpectr.AltZCtrlGet', 'uint16 single single');
        end 
        
        function varargout = AltZCtrlSet(obj, altSetpoint, setpoint, settlingTime)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'BiasSpectr.AltZCtrlSet', '', uint16(altSetpoint), single(setpoint), single(settlingTime));
        end                  
                
        function varargout = MLSLockinPerSegSet(obj, lockinPerSeg)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'BiasSpectr.MLSLockinPerSegSet', '', uint32(lockinPerSeg));
        end 
        
        function varargout = MLSLockinPerSegGet(obj)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'BiasSpectr.MLSLockinPerSegGet', 'uint32');
        end 
        
        function varargout = MLSModeSet(obj, sweepModeStr)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'BiasSpectr.MLSModeSet', '', int32(numel(char(sweepModeStr))), char(sweepModeStr));
        end 
        
        function varargout = MLSModeGet(obj)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'BiasSpectr.MLSModeGet', 'string');
        end 
        
        function varargout = MLSValsSet(obj, numSeg, biasStart, biasEnd, initalSettling, settlingTime, integTime, steps, lockinRun)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'BiasSpectr.MLSValsSet', '', ...
                int32(numSeg), single(biasStart), single(biasEnd), single(initalSettling), single(settlingTime), single(integTime), int32(steps), int32(lockinRun));
        end
        
        function varargout = MLSValsGet(obj)
            [n, response] = TCPQuery(obj.tcpobj, 'BiasSpectr.MLSValsGet', 'int32');            
            index = 5;
            temp = zeros(1,n);            
            for i=1:n
                temp(i) = typecast(flip(response(index:index + 3)), 'single');
                index = index + 4;
            end
            varargout{1} = temp;            
            for i=1:n
                temp(i) = typecast(flip(response(index:index + 3)), 'single');
                index = index + 4;
            end
            varargout{2} = temp;
            for i=1:n
                temp(i) = typecast(flip(response(index:index + 3)), 'single');
                index = index + 4;
            end
            varargout{3} = temp;
            for i=1:n
                temp(i) = typecast(flip(response(index:index + 3)), 'single');
                index = index + 4;
            end
            varargout{4} = temp;
            for i=1:n
                temp(i) = typecast(flip(response(index:index + 3)), 'single');
                index = index + 4;
            end
            varargout{5} = temp;
            for i=1:n
                temp(i) = typecast(flip(response(index:index + 3)), 'int32');
                index = index + 4;
            end
            varargout{6} = temp;
            for i=1:n
                temp(i) = typecast(flip(response(index:index + 3)), 'uint32');
                index = index + 4;
            end
            varargout{7} = temp;
            varargout{8} = response;
            checkNanonisTCPError(response, index);
        end

    end
end
    