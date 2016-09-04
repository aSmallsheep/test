function pooledFeatures = cnnPool(poolDim, convolvedFeatures)
%cnnPool Pools the given convolved features
%
% Parameters:
%  poolDim - dimension of pooling region
%  convolvedFeatures - convolved features to pool (as given by cnnConvolve)
%                      convolvedFeatures(featureNum, imageNum, imageRow, imageCol)
%
% Returns:
%  pooledFeatures - matrix of pooled features in the form
%                   pooledFeatures(featureNum, imageNum, poolRow, poolCol)
%     

numImages = size(convolvedFeatures, 2);
numFeatures = size(convolvedFeatures, 1);
convolvedDim = size(convolvedFeatures, 3);

pooledFeatures = zeros(numFeatures, numImages, floor(convolvedDim / poolDim), floor(convolvedDim / poolDim));

% -------------------- YOUR CODE HERE --------------------
% Instructions:
%   Now pool the convolved features in regions of poolDim x poolDim,
%   to obtain the 
%   numFeatures x numImages x (convolvedDim/poolDim) x (convolvedDim/poolDim) 
%   matrix pooledFeatures, such that
%   pooledFeatures(featureNum, imageNum, poolRow, poolCol) is the 
%   value of the featureNum feature for the imageNum image pooled over the
%   corresponding (poolRow, poolCol) pooling region 
%   (see http://ufldl/wiki/index.php/Pooling )
%   
%   Use mean pooling here.
% -------------------- YOUR CODE HERE --------------------
numBlocks = floor(convolvedDim/poolDim);             %每个维度总共分成多少块（57/19）,这里对于不同维数的数据，poolDim要选择能刚好除尽的？
for featureNum = 1:numFeatures
    for imageNum=1:numImages
        for poolRow = 1:numBlocks
            for poolCol = 1:numBlocks
                features = convolvedFeatures(featureNum,imageNum,(poolRow-1)*poolDim+1:poolRow*poolDim,(poolCol-1)*poolDim+1:poolCol*poolDim);
                pooledFeatures(featureNum,imageNum,poolRow,poolCol) = mean(features(:));
            end
        end
    end
end
end

