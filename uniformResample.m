function [resampled_images, light_dir] = uniformResample(path)

[Lo,~] = icosphere(4);
f = textscan(fopen(strcat(path,'lightvec.txt')),'%f %f %f');
Li = [f{1} f{2} f{3}];

image_files = dir(fullfile(path,'*.bmp'));
num_images = length(image_files);
[m,n,~] = size(imread(fullfile(path,image_files(1).name)));
images = zeros(m,n,num_images);

for i = 1:num_images
    image_name = fullfile(path,image_files(i).name);
    temp = double(imread(image_name));
    images(:,:,i) = 0.299*temp(:,:,1) + 0.587*temp(:,:,2) + 0.114*temp(:,:,3);
end

index = nearestneighbour(Li', Lo');
resampled_images = zeros(m,n,0);
light_dir = zeros(0,3);

for i = 1:size(Lo,1)
    index2 = find(index==i);
    if ~isempty(index2)
        Io = zeros(m,n);
        numerator = 0;
        for j = 1:size(index2)
            numerator = numerator + Lo(i,:)*Li(index2(j),:)';
        end
        for j = 1:size(index2)
            Io = Io + (Lo(i,:)*Li(index2(j),:)'/numerator)*images(:,:,index2(j));
        end
        resampled_images(:,:,size(resampled_images,3)+1)=Io;
        light_dir = [light_dir; Lo(i,:)];
    end
end

end