classdef TCPNanonisBiasSwp < handle
    properties
        tcpobj = [];        
    end
    
    methods
        %% inital
        function obj = TCPNanonisBiasSwp(tcp)
            obj.tcpobj = tcp;
        end
        
        %% command        
        function varargout = Open(obj)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'BiasSwp.Open', '');
        end
        
        function varargout = Start(obj, getdata, direction, ZCtrl, name, resetbias)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'BiasSwp.Start', '1dstring 2dsingle', ...
                uint32(getdata), int32(direction), int32(ZCtrl), int32(numel(char(name))), char(name), uint32(resetbias));
        end                
        
        function varargout = PropsSet(obj, numberStep, period, autosave, savediag)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'BiasSwp.PropsSet', '', uint16(numberStep), uint16(period), uint16(autosave), uint16(savediag));
        end
        
        function varargout = LimitsSet(obj, lowerlimit, upperlimit)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'BiasSwp.LimitsSet', '', single(lowerlimit), single(upperlimit));
        end          
        
    end
end
    