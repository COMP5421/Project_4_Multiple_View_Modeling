path = 'data08/';
[resampled_images,light_direction] = uniformResampling(path);
initial_normal = getInitialNormal(resampled_images,light_direction);
%surf = shapeFromNormal(initial_normal,2,I);
refined_normal = refineNormal(initial_normal,0.5,0.65);
surf = shapeFromNormal(refined_normal,6,I);

%some parameters
%           lambda   sigma   scale   pointer
% data02      0.5     0.6     2        641
% data04      0.5     0.6     6        
% data05      0.5     0.6     4        
% data06      0.5     0.8     4        
% data07      0.5     0.4     8        
% data08      0.5     0.4     6        950
% data09      0.4     0.6     4        
% data09      0.5     0.6     4    
image_files = dir(fullfile(path,'*.bmp'));
I = imread(fullfile(path,image_files(950).name));
I = flip(I,1);