classdef TCPNanonisAutoApproach < handle
    properties
        tcpobj = [];        
    end
    
    methods
        %% inital
        function obj = TCPNanonisAutoApproach(tcp)
            obj.tcpobj = tcp;
        end
        
        %% command        
        function varargout = OnOffSet(obj, OnOrOff)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'AutoApproach.OnOffSet', '', uint16(OnOrOff));
        end
        
        function varargout = OnOffGet(obj)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'AutoApproach.OnOffGet', 'uint16');
        end  
        
    end
end
    