path = 'data02/';
[resampled_images,light_direction] = uniformResampling(path);
initial_normal = getInitialNormal(resampled_images,light_direction);
surf = shapeFromNormal(initial_normal,2);
refined_normal = refineNormal(initial_normal,0.5,0.6);
surf = shapeFromNormal(refined_normal,2);