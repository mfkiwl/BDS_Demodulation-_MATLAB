function [ sampledCATable ] = makeCaTable( settings )
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here

%计算一个周期的C/A码总的采样点数
samplesPerCode = round(settings.samplingFreq /(settings.codeFreqBasis / settings.codeLength));
%输出的采样C/A码后点
sampledCATable = zeros(37, samplesPerCode);

%采样一次的时间长度
ts = 1 / settings.samplingFreq;

%一个码片的时间长度
tc = 1 / settings.codeFreqBasis;

%PRN = 37原因：37颗卫星
for PRN = 1 : 37
    
    %产生C/A码
    CACode = generateCAcode(PRN);
    
    %-----数字化C/A码-----
    
    %产生采样C/A码的位置坐标
    codeValueIndex = ceil((ts / tc) * (1 : samplesPerCode));
    
    %最后一个采样点所采的位置一定是C/A最后一个值
    codeValueIndex(end) = settings.codeLength;
    
    sampledCATable(PRN, :) =  CACode(codeValueIndex);
end
    
end

