function [coeffs, delta, deltaDelta, loc] = myMFCC(audioIn, fs, varargin)
% myMFCC Extract mfcc, log energy, delta, and delta-delta of audio signal
%   audioIn -- Input Signal | vector | matrix | 3-D array
%   fs -- Sample Rate in Hz | positive scalar
%   Name, Value -- Name-Value Pair Arguments
%   'WindowLength' -- Number of Samples in Analysis Window | positive scalar integer
%   'OverlapLength' -- Number of Overlapping Samples Between Adjascent Windows
%   'NumCoeffs' -- Number of Coefficients Returned
%   'BandEdges' -- Band Edges of Filter Bank (Hz) | row vector
%   'FFTLength' -- Number of Bins for Calculating DFT | positive scalar integer
%   'Rectification' -- Type of non-linear rectification | 'cubic-root' | 'log'
%   'DeltaWindowLength' -- Number of Coefficients for calculating delta and delta-delta | odd integer greater than 2
%   'LogEnergy' -- Specify How the Log Energy is Shown | 'replace' | 'ignore'
    
    arg_size = size(varargin);
    if (mod(arg_size, 2) == 1)
        error('Name-Value Pair Arguments, missing information');
    end
    wL = 'windowLength';
    oL = 'overlapLength';
    nC = 'numCoeffs';
    bE = 'bandEdges';
    fft_length = 'FFTLength';
    rectification = 'rectification';
    dWL = 'deltaWindowLength';
    lE = 'logEnergy';
    validScalar = @(x) isnumeric(x);
    validDWL = @(x) isnumeric(x) && isscalar(x) && ((x == 2) || (mod(x,2) == 1));
    defaultWL = round(fs*0.03);
    defaultOL = round(fs*0.02);
    defaultNC = 13;
    defaultRect = 'log';
    defaultDWL = 2;
    defaultLE = 'append';
    defaultBE = [0:fs/2];
    p = inputParser;
    addRequired(p, 'audioIn');
    addRequired(p, 'fs');
    addOptional(p, wL, defaultWL, validScalar);
    addOptional(p, oL, defaultOL, validScalar);
    addOptional(p, nC, defaultNC, validScalar);
    addOptional(p, bE, defaultBE, @(x) any(validateattributes(x, 'vector')));
    addOptional(p, fft_length, defaultWL, validScalar);
    addOptional(p, rectification, defaultRect);
    addOptional(p, dWL, defaultDWL, validDWL);
    addOptional(p, lE, defaultLE);
    parse(p, audioIn, fs, varargin{:});
    audioIn = p.Results.audioIn;
    fs = p.Results.fs;
    windowL = p.Results.windowLength;
    overlapL = p.Results.overlapLength;
    numC = p.Results.numCoeffs;
    bandE = p.Results.bandEdges;
    fftL = p.Results.FFTLength;
    rect = p.Results.rectification;
    deltaWindowL = p.Results.deltaWindowLength;
    logE = p.Results.logEnergy;
    
    %disp(audioIn);
    disp(fs);
    disp(windowL);
    disp(overlapL);
    disp(numC);
    disp(bandE);
    disp(fftL);
    disp(rect);
    disp(deltaWindowL);
    disp(logE);
end