function images = loadMNISTImages(filename)
%loadMNISTImages returns a 28x28x[number of MNIST images] matrix containing
%the raw MNIST images

fp = fopen(filename, 'rb');%�Զ�����ʽ���ļ���b������������ָ�����С��
assert(fp ~= -1, ['Could not open ', filename, '']);
%assert��matlab�Ķ��Ժ���  ��������  ��1�����㣻��ӡ2


%fread��ȡ�ļ� 
magic = fread(fp, 1, 'int32', 0, 'ieee-be');
assert(magic == 2051, ['Bad magic number in ', filename, '']);

numImages = fread(fp, 1, 'int32', 0, 'ieee-be');
numRows = fread(fp, 1, 'int32', 0, 'ieee-be');
numCols = fread(fp, 1, 'int32', 0, 'ieee-be');

images = fread(fp, inf, 'unsigned char');
images = reshape(images, numCols, numRows, numImages);
%��ʵ��������m*n��ת�ã�permuteʵ�ֵ���m*n*p��ά�����ת������
images = permute(images,[2 1 3]);

%�����Դ�����ʾ�����е�ͼƬ��
% for  i=1:10
%     figure(i),imshow(images(:,:,i))
% end
fclose(fp);

% Reshape to #pixels x #examples
images = reshape(images, size(images, 1) * size(images, 2), size(images, 3));
% Convert to double and rescale to [0,1]
images = double(images) / 255;

end
