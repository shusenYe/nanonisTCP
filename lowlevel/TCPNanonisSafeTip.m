classdef TCPNanonisSafeTip < handle
    properties
        tcpobj = [];        
    end
    
    methods
        %% inital
        function obj = TCPNanonisSafeTip(tcp)
            obj.tcpobj = tcp;
        end
        
        %% command        
        function varargout = OnOffSet(obj, safeTipStatus)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'SafeTip.OnOffSet', '', uint16(safeTipStatus));
        end
        
        function varargout = OnOffGet(obj)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'SafeTip.OnOffGet', 'uint16');
        end  
        
        function varargout = SignalGet(obj)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'SafeTip.SignalGet', 'single');
        end 
        
        function varargout = PropsSet(obj, autoRecovey, autoPauseScan, threshold)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'SafeTip.PropsSet', '', uint16(autoRecovey), uint16(autoPauseScan), single(threshold));
        end
        
        function varargout = PropsGet(obj)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'SafeTip.PropsGet', 'uint16 uint16 single');
        end          
        
    end
end
    