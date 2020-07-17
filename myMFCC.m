function [coeffs, delta, deltadelta, loc]  = myMFCC(audioIn, fs)
%   myMFCC(audioIn, fs)
%       This method returns the coefficients of a signal

if (isreal(audioIn))
    itsreal = 'real';
else:
    itsreal = 'complex';
end
windowLength = round(fs * 0.3);
overlapLength = round(fs * 0.2);
hopLength = windowLength - overlapLength;
numCoeffs = 13;
bandEdges = cepstralFeatureExtractor.getDefaultBandEdges();
FFTLength = round(fs * 0.3);
rectification = 'log';
deltaWindowLength = 2;
logEnergy = 'append';

end


