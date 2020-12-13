=========================================================================
NanonisTCP class Description
=========================================================================
Control your Scanning Probe Microscopy(Nanonis) in Matlab.

Based on Nanonis TCP interface
Usual Module in the Manual, 'TCPProtocol_SPM.pdf', has been realized in this this class.
        Bias
        BiasSwp
        BiasSpectr
        Current
        ZCtrl
        SafeTip
        AutoApproach
        ZSpectr
        Pattern
        Piezo
        Scan
        FolMe
        TipRec
        GenSwp
        Motor
        LockIn
        Signals
        DigLines
        Util
        UserIn
        UserOut

Below Modules might be included in future versions.

        LockinFreqSwp
        DataLog


All methods can be found in the Manual.
Note: length of string and array arguments(input or output) is NOT needed.

lowlevel:
varargout = obj.Request(command, outputType, varargin)
command is a string of command
outputType is a string like '1dsingle 1dsingle uint32'
varargin is input argument of command

Example 1

nanonis = NanonisTCP();
[preampname, preampchn] = nanonis.Current.GainsGet();

Result:

preampname =

    {'HS 10^5'}    {'HS 10^6'}    {'HS 10^7'}    {'HS 10^8'}    {'HS 10^9'}    {'HS 10^10'}    {'HS 10^11'} ...


    {'LN 10^3'}    {'LN 10^4'}    {'LN 10^5'}    {'LN 10^6'}    {'LN 10^7'}    {'LN 10^8'}    {'LN 10^9'}

preampchn =

  uint16

   13

It means 'LowNoise 10^9' has been chosen.

Example 2

nanonis = NanonisTCP();
nanonis.BiasSpectr.Open();
[chnName, data, para] = nanonis.BiasSpectr.Start(1,'test');

It means 'GetData' is True, basename is 'test'

Result
chnName =
	    {'Bias calc (V)'}    {'Current (A)'}

data = [2 * 256]  (nChn*nSld)

para =
   -2.0000    2.0000         0         0    0.0000         0    0.0002    0.0001    1.0000       NaN

=========================================================================
Existed Bug

FolMe.XYPosGet and DigLines.TTLValGet are problematic.
This may be Specs's fault.

=========================================================================
20200718 By ShusenYe, Tsinghua Univ, China
Any comments are welcomed to this mail yess19@mails.tsinghua.edu.cn
