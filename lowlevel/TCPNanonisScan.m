classdef TCPNanonisScan < handle
    properties
        tcpobj = [];        
    end
    
    methods
        %% inital
        function obj = TCPNanonisScan(tcp)
            obj.tcpobj = tcp;
        end
        
        %% command
        function varargout = Action(obj, scanAction, scanDirection)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'Scan.Action', '', uint16(scanAction), uint32(scanDirection));
        end
        
        function varargout = StatusGet(obj)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'Scan.StatusGet', 'uint32');
        end
        
        function varargout = WaitEndOfScan(obj, timeout)
            pause(1);   % experience
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'Scan.WaitEndOfScan', 'uint32 string', int32(timeout));
        end
        
        function varargout = FrameSet(obj, centerX, centerY, width, height, angle)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'Scan.FrameSet', '',...
                single(centerX), single(centerY), single(width), single(height), single(angle));
        end
        
        function varargout = FrameGet(obj)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'Scan.FrameGet', 'single single single single single');
        end
        
        function varargout = BufferSet(obj, chnIdx, pixels, lines)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'Scan.BufferSet', '',...
                int32(numel(chnIdx)), int32(chnIdx), int32(pixels), int32(lines));
        end
        
        function varargout = BufferGet(obj)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'Scan.BufferGet', '1dint32 int32 int32');
        end
        
        function varargout = PropsSet(obj, continScan, BouncyScan, autosave, seriesName, comment)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'Scan.PropsSet', '',...
                uint32(continScan), uint32(BouncyScan), uint32(autosave), int32(numel(char(seriesName))), ...
                char(seriesName), int32(numel(char(comment))), char(comment));
        end
        
        function varargout = PropsGet(obj)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'Scan.PropsGet', 'uint32 uint32 uint32 string string');
        end
        
        function varargout = SpeedSet(obj, forLinearSpeed, backLinearSpeed, forTimePerLine, backTimePerLine, keepConst, speedRaito)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'Scan.SpeedSet', '',...
                single(forLinearSpeed), single(backLinearSpeed), single(forTimePerLine),...
                single(backTimePerLine), uint16(keepConst), single(speedRaito));
        end
        
        function varargout = SpeedGet(obj)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'Scan.SpeedGet', 'single single single single uint16 single');
        end
        
        function varargout = FrameDataGrab(obj, chnIdx, dataDirc)
            [varargout{1:nargout}] = TCPQuery(obj.tcpobj, 'Scan.FrameDataGrab', ...
                'string 2dsingle uint32', uint32(chnIdx), uint32(dataDirc));
        end
        
    end
end
    