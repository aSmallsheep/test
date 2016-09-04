function images = loadMNISTImages(filename)
%loadMNISTImages returns a 28x28x[number of MNIST images] matrix containing
%the raw MNIST images

fp = fopen(filename, 'rb');%以读的形式打开文件，b参数的作用是指定大端小端
assert(fp ~= -1, ['Could not open ', filename, '']);
%assert，matlab的断言函数  两个参数  ：1，满足；打印2


%fread读取文件 
magic = fread(fp, 1, 'int32', 0, 'ieee-be');
assert(magic == 2051, ['Bad magic number in ', filename, '']);

numImages = fread(fp, 1, 'int32', 0, 'ieee-be');
numRows = fread(fp, 1, 'int32', 0, 'ieee-be');
numCols = fread(fp, 1, 'int32', 0, 'ieee-be');

images = fread(fp, inf, 'unsigned char');
images = reshape(images, numCols, numRows, numImages);
%其实，类似于m*n的转置，permute实现的是m*n*p三维矩阵的转置问题
images = permute(images,[2 1 3]);

%可以以此来显示数据中的图片。
% for  i=1:10
%     figure(i),imshow(images(:,:,i))
% end
fclose(fp);

% Reshape to #pixels x #examples
images = reshape(images, size(images, 1) * size(images, 2), size(images, 3));
% Convert to double and rescale to [0,1]
images = double(images) / 255;

end
