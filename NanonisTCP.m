 classdef NanonisTCP< handle
 % Developed By Shusen Ye
 % China, Tsinghua Univ, Department of Physics
 % For Nanonis Control
     properties
        tcpobj = [];
        ID = 6501;
        
        Bias = [];
        BiasSwp = [];
        BiasSpectr = [];
        Current = [];
        ZCtrl = [];
        SafeTip = [];
        AutoApproach = [];
        ZSpectr = [];
        Pattern = [];
        Piezo = [];
        Scan = [];
        FolMe = [];
        TipRec = [];
        GenSwp = [];
        Motor = [];
        LockIn = [];
        Signals = [];
        DigLines = [];
        Util = [];
        UserIn = [];
        UserOut = [];
                
        success = false;
        
    end
    
    methods
        % connect to nanonis
        function obj = NanonisTCP(id)
            if nargin == 1
                obj.ID = id;
            end
            obj.tcpobj = tcpclient('localhost', obj.ID);            
            
            obj.Bias            = TCPNanonisBias(obj.tcpobj);
            obj.BiasSwp         = TCPNanonisBiasSwp(obj.tcpobj);
            obj.BiasSpectr      = TCPNanonisBiasSpectr(obj.tcpobj);
            obj.Current         = TCPNanonisCurrent(obj.tcpobj);
            obj.ZCtrl           = TCPNanonisZCtrl(obj.tcpobj);
            obj.SafeTip         = TCPNanonisSafeTip(obj.tcpobj);
            obj.AutoApproach    = TCPNanonisAutoApproach(obj.tcpobj);
            obj.ZSpectr         = TCPNanonisZSpectr(obj.tcpobj);
            obj.Pattern         = TCPNanonisPattern(obj.tcpobj);
            obj.Piezo           = TCPNanonisPiezo(obj.tcpobj);
            obj.Scan            = TCPNanonisScan(obj.tcpobj);
            obj.FolMe           = TCPNanonisFolMe(obj.tcpobj);
            obj.TipRec          = TCPNanonisTipRec(obj.tcpobj);
            obj.GenSwp          = TCPNanonisGenSwp(obj.tcpobj);
            obj.Motor           = TCPNanonisMotor(obj.tcpobj);
            obj.DigLines        = TCPNanonisDigLines(obj.tcpobj);
            obj.LockIn          = TCPNanonisLockIn(obj.tcpobj);
            obj.Signals         = TCPNanonisSignals(obj.tcpobj);
            obj.Util            = TCPNanonisUtil(obj.tcpobj);
            obj.UserIn          = TCPNanonisUserIn(obj.tcpobj);
            obj.UserOut         = TCPNanonisUserOut(obj.tcpobj);
            
            pause(1);
            
            % Bias.Get()
            obj.tcpobj.write(uint8([66 105 97 115 46 71 101 116 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0]));            
            tryTimes = 100;
            for i=1:tryTimes
                temp = obj.tcpobj.read;
                if ~isempty(temp)
                    break
                end
                pause(0.02);
            end
            if numel(temp) ~= 52
                error('Failing To Connect To Nanonis, Maybe, Another Connection Has Existed.');                
            else
                disp('[NanonisTCP] Connect To Nanonis Succesful!')
                obj.success = true;
            end
        end
        
        function varargout = Request(obj, command, outList, varargin)            
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, command, outList, varargin{:});
        end
        
        function delete(obj)
            delete(obj.tcpobj);
        end
    end
        
 end