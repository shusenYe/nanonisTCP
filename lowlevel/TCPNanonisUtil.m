classdef TCPNanonisUtil < handle
    properties
        tcpobj = [];        
    end
    
    methods
        %% inital
        function obj = TCPNanonisUtil(tcp)
            obj.tcpobj = tcp;
        end
        
        %% command
        function varargout = SessionPathGet(obj)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'Util.SessionPathGet', 'string');
        end

        function varargout = SettingsLoad(obj, filePath, loadSessionSetting)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'Util.SettingsLoad', '', ...
                int32(numel(char(filePath))), char(filePath), uint32(loadSessionSetting));
        end
        
        function varargout = SettingsSave(obj, filePath, saveSessionSetting)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'Util.SettingsSave', '', ...
                int32(numel(char(filePath))), char(filePath), uint32(saveSessionSetting));
        end
        
        function varargout = LayoutSave(obj, filePath, saveLayoutSetting)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'Util.LayoutSave', '', ...
                int32(numel(char(filePath))), char(filePath), uint32(saveLayoutSetting));
        end
        
        function varargout = LayoutLoad(obj, filePath, loadLayoutSetting)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'Util.LayoutLoad', '', ...
                int32(numel(char(filePath))), char(filePath), uint32(loadLayoutSetting));
        end
        
        function varargout = Lock(obj)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'Util.Lock', '');
        end
        
        function varargout = UnLock(obj)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'Util.UnLock', '');
        end
        
        function varargout = RTFreqGet(obj)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'Util.RTFreqGet', 'single');
        end
        
        function varargout = RTFreqSet(obj, RTFreq)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'Util.RTFreqSet', '', single(RTFreq));
        end
        
        function varargout = AcqPeriodGet(obj)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'Util.AcqPeriodGet', 'single');
        end
        
        function varargout = AcqPeriodSet(obj, acqPeriod)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'Util.AcqPeriodSet', '', single(acqPeriod));
        end
        
        function varargout = RTOversamplGet(obj)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'Util.RTOversamplGet', 'int32');
        end
        
        function varargout = RTOversamplSet(obj, RTOversampl)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'Util.RTOversamplSet', '', int32(RTOversampl));
        end
        
    end
end
    