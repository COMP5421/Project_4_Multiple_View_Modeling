function recsurf = surfReconstruct(normal,scale)

[m,n,~] = size(normal);
normal=imgaussfilt(normal);
slant = zeros(m,n);
tilt = zeros(m,n);

for i = 1:m
    for j = 1:n
        normalT = squeeze(normal(m+1-i,j,:));
        slant(i,j) = acos(normalT(3));
        tilt(i,j) = sign(normalT(2)) * acos(normalT(1));
    end
end

recsurf = shapeletsurf(slant, tilt, 8, 1, 2, 'slanttilt');
recsurf=recsurf/scale;
[x, y] = meshgrid(1:n, 1:m);
figure;

surf(x,y,recsurf,'FaceColor','green','EdgeColor','none');
camlight left;
lighting phong;
axis equal;
axis vis3d;
axis off;

end