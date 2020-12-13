classdef TCPNanonisZCtrl < handle
    properties
        tcpobj = [];        
    end
    
    methods
        %% inital
        function obj = TCPNanonisZCtrl(tcp)
            obj.tcpobj = tcp;
        end
        
        %% command        
        function varargout = ZPosGet(obj)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'ZCtrl.ZPosGet', 'single');
        end 
        
        function varargout = ZPosSet(obj, zPosition)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'ZCtrl.ZPosSet', '', single(zPosition));
        end 
        
        function varargout = OnOffSet(obj, zCtrlStatus)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'ZCtrl.OnOffSet', '', uint32(zCtrlStatus));
        end 
        
        function varargout = OnOffGet(obj)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'ZCtrl.OnOffGet', 'uint32');
        end 
        
        function varargout = SetpntSet(obj, setpoint)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'ZCtrl.SetpntSet', '', single(setpoint));
        end 
        
        function varargout = SetpntGet(obj)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'ZCtrl.SetpntGet', 'single');
        end 
                        
        function varargout = GainSet(obj, PGain, timeCosnt, IGain)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'ZCtrl.GainSet', '', ...
                single(PGain), single(timeCosnt), single(IGain));
        end 
        
        function varargout = GainGet(obj)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'ZCtrl.GainGet', 'single single single');
        end 
                
        function varargout = SwitchOffDelaySet(obj, delay)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'ZCtrl.SwitchOffDelaySet', '', single(delay));
        end 
        
        function varargout = SwitchOffDelayGet(obj)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'ZCtrl.SwitchOffDelayGet', 'single');
        end 
        
        function varargout = TipLiftGet(obj)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'ZCtrl.TipLiftGet', 'single');
        end 
        
        function varargout = TipLiftSet(obj, tipLift)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'ZCtrl.TipLiftSet', '', single(tipLift));
        end 
        
        function varargout = Home(obj)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'ZCtrl.Home', '');
        end         
                                
        function varargout = HomePropsSet(obj, relOrAbs, homePos)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'ZCtrl.HomePropsSet', '', ...
                uint16(relOrAbs), single(homePos));
        end 
        
        function varargout = HomePropsGet(obj)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'ZCtrl.HomePropsGet', 'uint16 single');
        end
        
        function varargout = ActiveCtrlSet(obj, zCtrlIdx)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'ZCtrl.ActiveCtrlSet', '', int32(zCtrlIdx));
        end
        
        function varargout = CtrlListGet(obj)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'ZCtrl.CtrlListGet', '1dstring int32');
        end  
        
        function varargout = Withdraw(obj, waitUnitlFin, timeout)
            if ~exist('waitUnitlFin', 'var')
                waitUnitlFin = 1;
            end
            if ~exist('timeout', 'var')
                timeout = -1;
            end
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'ZCtrl.WithDraw', '',...
                uint32(waitUnitlFin), int32(timeout));
        end
        
        function varargout = WithdrawRateSet(obj, slewRate)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'ZCtrl.WithdrawRateSet', '', single(slewRate));
        end
        
        function varargout = WithdrawRateGet(obj)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'ZCtrl.WithdrawRateGet', 'single');
        end
        
        function varargout = LimitsEnabledSet(obj, limitZStatus)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'ZCtrl.LimitsEnabledSet', '', uint32(limitZStatus));
        end
        
        function varargout = LimitsEnabledGet(obj)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'ZCtrl.LimitsEnabledGet', 'uint32');
        end  
        
        function varargout = LimitsSet(obj, zHigh, zLow)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'ZCtrl.LimitsSet', '', single(zHigh), single(zLow));
        end
        
        function varargout = LimitsGet(obj)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'ZCtrl.LimitsGet', 'single single');
        end  

    end
end
    