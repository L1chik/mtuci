im = imread("xleb.png");
im_noise = imnoise(im, 'salt & pepper', 0.1);
copy_im_noise = im_noise; %������ ����� �����������, ����� ����� ������ Invalid handle.
im_noise_hist = histogram(im_noise);
saveas(im_noise_hist, 'LAB5_hist', 'png');

%% ��������� �����������
object1 = imread("object1.png");
copy_o1 = object1;
image_o1 = (im*0.5) + object1;
imwrite(image_o1, "image_o1.png");


%% ��������� ������� � ������� �����������
scale1_image_o1 = imresize(image_o1, 2, "nearest");
imwrite(scale1_image_o1, "image_o1nearest.png");
scale2_image_o1 = imresize(image_o1, 0.5, "bicubic");
imwrite(scale2_image_o1, "image_o1bicubic.png");

% imshow(scale1_image_o1)
% imshow(scale2_image_o1)
object2 = imread("object2.png");
object3 = imread("object3.png");
im_o123 = (im_noise*0.5) + object1 + object2 + object3;
imwrite(im_o123, "im_noise2.png");
% im_noise2 = imnoise(im_o123, "salt & pepper", 0.1);
% imshow(im_o123)
im_noise2fliplr = fliplr(im_o123);
% imshow(im_noise2fliplr)
imwrite(im_noise2fliplr, "im_noise2fliplr.png")
im_noise2flipud = flipud(im_o123);
% imshow(im_noise2flipud)
imwrite(im_noise2flipud, "im_noise2flipud.png");

im_rotate = imrotate(im_o123, -45); % �� ������� ������� - ������������� �������� ����, ������ - �������������
% imshow(im_rotate)
imwrite(im_rotate, "im_rotate.png");
im_rotate2 = imrotate(im_o123, 45);
imwrite(im_rotate2, "im_rotate2.png")

%% ������������, �������
bg = imread("nebula_blender_v1.png");
bg_crop = imcrop(bg,[1325 3213 800-1 800-1]);
% imshow(bg_crop)
bg_cropl = bg_crop * 0.25;
bg_new = bg_cropl + object2 + object3;
bg_noise = imnoise(bg_new, "salt & pepper", 0.005);
imwrite(bg_noise, "bg_noise.png");

% Z = imcomplement(bg_crop); %������ ��������� �������� �����������
bg_negative = imadjust(bg_crop, [0 1], [1 0]); %������ ��������� �������� �����������
% imshow(Z)
imwrite(bg_negative, "bg_negative.png");

bg_new2 = bg_cropl + object1;
bg_noise2 = imnoise(bg_new2, "salt & pepper", 0.005);
imwrite(bg_noise2, "bg_noise2.png");

im_subtract = imsubtract(bg_noise, bg_noise2); % �������� bg_noise �� bg_noise2
% imshow(im_subtract)
imwrite(im_subtract, "im_subtract.png");