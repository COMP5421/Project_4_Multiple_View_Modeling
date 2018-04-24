path = 'data02/';
lambda = 0.5;
sigma = 0.6;
[resampled_img,light_dir] = uniformResample(path);
ini_normal = getInitialNormal(resampled_img, light_dir);
ref_normal = refineNormal(ini_normal,lambda,sigma);
recSurf=surfReconstruct(ref_normal,2);