function [Normal] = getInitialNormal(img, light_dir)
[m,n,num_images] = size(img);
image_ranks = zeros(m,n,num_images);

for i = 1:m
    for j = 1:n
        pixels = img(i,j,:);
        [~,I] = sort(pixels);
        image_ranks(i,j,I) = 1:num_images;
    end
end

L =0.7*num_images;
H = 0.9*num_images;
count = 0;
de_num = 0;

for i = 1:num_images
    image_rank = image_ranks(:,:,i);
    image_rank = image_rank(image_rank>L);
    if mean(image_rank)<H && size(image_rank,1)>count
        count = length(image_rank);
        de_num = i;
    end
end

deno_img = img(:,:,de_num);
img(:,:,de_num) = [];
deno_light = light_dir(de_num,:);
light_dir(de_num,:) = [];

Normal = zeros(m,n,3);

for i = 1:m
    for j = 1:n
        Ii = reshape((img(i,j,:)),[num_images-1,1]);
        Ik = deno_img(i,j);
        A = Ii*deno_light-Ik*light_dir;
        [~,~,v] = svd(A,0);
        x = v(:,end);
        if x(3)<0
            x = -x;
        end
        Normal(i,j,:) = x;
    end
end

end