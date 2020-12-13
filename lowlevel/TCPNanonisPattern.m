classdef TCPNanonisPattern < handle
    properties
        tcpobj = [];        
    end
    
    methods
        %% inital
        function obj = TCPNanonisPattern(tcp)
            obj.tcpobj = tcp;
        end
        
        %% command
        function varargout = ExpOpen(obj)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'Pattern.ExpOpen', '');
        end
        
        function varargout = ExpStart(obj, pattern)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'Pattern.ExpStart', '', uint16(pattern));
        end
        
        function varargout = ExpPause(obj, PauseOrResume)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'Pattern.ExpPause', '', uint32(PauseOrResume));
        end
        
        function varargout = ExpStop(obj)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'Pattern.Stop', '');
        end
                
        function varargout = ExpStatusGet(obj, status)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'Pattern.ExpStatusGet', '', uint32(status));
        end
        
        function varargout = GridSet(obj, setActive, nPointsX, nPointsY, scanFrame, centerX, centerY, width, height, angle)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'Pattern.GridSet', '', ...
                uint32(setActive), int32(nPointsX), int32(nPointsY), uint32(scanFrame), ...
                single(centerX), single(centerY), single(width), single(height), single(angle));
        end
        
        function varargout = GridGet(obj)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'Pattern.GridGet', 'int32 int32 single single single single single');
        end
        
        function varargout = LineSet(obj, setActive, nPoints, scanFrame, points1X, points1Y, points2X, points2Y)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'Pattern.LineSet', '',...
                uint32(setActive), int32(nPoints), uint32(scanFrame),...
                single(points1X), single(points1Y), single(points2X), single(points2Y));
        end
        
        function varargout = LineGet(obj)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'Pattern.LineGet', 'int32 single single single single single');
        end
        
        function varargout = CloudSet(obj, setActive, xCoord, yCoord)                        
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'Pattern.CloudSet', '',...
                uint32(setActive), int32(numel(xCoord)), single(xCoord), single(yCoord));
        end
        
        function varargout = CloudGet(obj)
            [n, response] = TCPQuery(obj.tcpobj, 'Pattern.CloudGet', 'int32');
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
            varargout{3} = response;            
            checkNanonisTCPError(response, index);
        end
        
        function varargout = PropsSet(obj, selectedExp, basename, extVIPath, preMeasureDelay, saveScanChn)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'Pattern.PropsSet', '',...
                int32(numel(char(selectedExp))), char(selectedExp), ...
                int32(numel(char(basename))), char(basename), ...
                int32(numel(char(extVIPath))), char(extVIPath), ...
                single(preMeasureDelay), uint32(saveScanChn));
        end
        
        function varargout = PropsGet(obj)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'Pattern.PropsGet', '1dstring string string single uint32');
        end
        
    end
end
    