path = 'data02\';
[resampled_img, light_dir] = uniformResample(path);
ini_normal = getInitialNormal(resampled_img, light_dir);