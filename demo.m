%% Demo code for FCN Tracker
clear;clc;

%% Tracking
data_dir = fullfile('data', 'Car4');
image_dir = fullfile(data_dir, 'img');
image_list = dir(fullfile(image_dir, '*.jpg'));
image_list = arrayfun(@(x) fullfile(image_dir, x.name), image_list,...
    'UniformOutput', false);
gts = dlmread(fullfile(data_dir, 'groundtruth_rect.txt'));
% from [x1, y1, w, h] to [x1, y1, x2, y2]
init_box = [gts(1,1), gts(1,2), gts(1,1)+gts(1,3), gts(1,2)+gts(1,4)];
boxes = fcn_tracker([{init_box}, image_list' 0]);

%% Visualization
for i=1:length(image_list)
    box = boxes(i,1:4);
    box = [box(1), box(2), box(3) - box(1), box(4) - box(2)];
    imshow(imread(image_list{i})); hold on;
    rectangle('Position', box, 'EdgeColor', 'r', 'LineWidth', 3); hold off;
    waitforbuttonpress;
end