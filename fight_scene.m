clear;
f = figure('Visible', 'on');
myvideo = VideoWriter('fightscene'); %create the video file
open(myvideo);
standing_pos_x = 0.2;
standing_pos_y = 0.5;
frame_rate = 0.03;

% Define the stickman's body parts
headRadius = 0.1;
headPosition = [standing_pos_x - headRadius, standing_pos_y - headRadius, 2 * headRadius, 2 * headRadius];
bodyX = [standing_pos_x, standing_pos_x];
bodyY = [standing_pos_y - headRadius - 0.2, standing_pos_y - headRadius];
leftArmX = [standing_pos_x, standing_pos_x - 0.1];
leftArmY = [standing_pos_y - headRadius, standing_pos_y - headRadius - 0.15];
rightArmX1 = [standing_pos_x, standing_pos_x + 0.05];
rightArmY1 = [standing_pos_y - headRadius, standing_pos_y - headRadius - 0.15];
rightArmX2 = [standing_pos_x + 0.05, standing_pos_x + 0.1];
rightArmY2 = [standing_pos_y - headRadius - 0.15, standing_pos_y - headRadius - 0.15];
leftHatX = [standing_pos_x, standing_pos_x-0.1]; 
leftHatY = [standing_pos_y+0.25, standing_pos_y];
rightHatX = [standing_pos_x, standing_pos_x+0.1];
rightHatY = [standing_pos_y+0.25, standing_pos_y];
leftLegX = [standing_pos_x, standing_pos_x-0.1];
leftLegY = [standing_pos_y-0.3, standing_pos_y-0.55];
rightLegX = [standing_pos_x, standing_pos_x+0.1];
rightLegY = [standing_pos_y-0.3, standing_pos_y-0.55];

% Define the giant body

% Define the width and height of the block man's body, head, arm, and leg
body_x = 3;
body_width = 0.2;
body_height = 0.5;
head_size = 0.2;
arm_length = 0.1;
leg_length = 0.2;

% Define the body matrix (rectangle)
body = [body_x, 0.1; 
        body_x, body_height; 
        body_x-body_width, body_height; 
        body_x-body_width, 0.1; 
        body_x, 0.1];

% Define the head matrix (square)
head = [body_x-body_width, body_height + 0.05,;
        body_x, body_height+0.05;
        body_x, body_height+0.05 + head_size;
        body_x-body_width, body_height+0.05 + head_size;
        body_x-body_width, body_height + 0.05,;];

% Define the left arm matrix (rectangle)
arm = [body_x-body_width/2, body_height-0.1;
       body_x-body_width*2, body_height-0.1; 
       body_x-body_width*2, body_height-0.2; 
       body_x-body_width/2, body_height-0.2;];

% Define the leg matrix (octagon)
octagon_side = 0.15;
octagon_x = body_x - body_width / 2;
octagon_y = 0;

octagon = [octagon_x - octagon_side, octagon_y;
            octagon_x - octagon_side / sqrt(2), octagon_y + octagon_side / sqrt(2);
            octagon_x, octagon_y + octagon_side;
            octagon_x + octagon_side / sqrt(2), octagon_y + octagon_side / sqrt(2);
            octagon_x + octagon_side, octagon_y;
            octagon_x + octagon_side / sqrt(2), octagon_y - octagon_side / sqrt(2);
            octagon_x, octagon_y - octagon_side;
            octagon_x - octagon_side / sqrt(2), octagon_y - octagon_side / sqrt(2);
            octagon_x - octagon_side, octagon_y];

% Define the initial irregular 8-sided polygon
polygon = [0.25, 0.25;   % Vertex 1
           0.5, 0.25;   % Vertex 2
           0.625, 0.375; % Vertex 3
           0.5, 0.5;   % Vertex 4
           0.375, 0.625; % Vertex 5
           0.25, 0.5;   % Vertex 6
           0.125, 0.375; % Vertex 7
           0.25, 0.25];  % Vertex 8

% Set axis limits and aspect ratio
xlim([0 3])
ylim([0 3])

% Turn off axis labels
axis off;

% Wave motion
for j = 1:2
    % Loop to perform waving
    for i = 1:10 % Perform the wave motion for 180 degrees
        
        % Update the stickman's appearance
        clf; % Clear the figure
        rectangle('Position', headPosition, 'Curvature', [1, 1], 'EdgeColor', 'b', 'LineWidth', 2);
        line(bodyX, bodyY, 'Color', 'b', 'LineWidth', 2);
        line(leftArmX, leftArmY, 'Color', 'b', 'LineWidth', 2);
        line(rightArmX1, rightArmY1, 'Color', 'b', 'LineWidth', 2);
        line(rightArmX2, rightArmY2, 'Color', 'b', 'LineWidth', 2);
        line(leftHatX, leftHatY, 'Color', 'b', 'LineWidth', 2); 
        line(rightHatX, rightHatY, 'Color', 'b', 'LineWidth', 2); 
        line(leftLegX, leftLegY, 'Color', 'b', 'LineWidth', 2); 
        line(rightLegX, rightLegY, 'Color', 'b', 'LineWidth', 2); 
    
        % Apply waving motion to the right arm
        rightArmX2 = [standing_pos_x + 0.05, standing_pos_x + 0.1];
        rightArmY2 = [standing_pos_y - headRadius - 0.15, standing_pos_y - headRadius - 0.15 + i*0.01];
    
        % Set axis limits and aspect ratio
        xlim([0 3])
        ylim([0 3])
    
        % Turn off axis labels
        axis off;
    
        % Pause for a short time to control animation speed
        frame = getframe(gcf);
        writeVideo(myvideo,frame);
        pause(frame_rate);
    
        % Update the figure
        drawnow;
    end
    
    % Loop to perform waving
    for i = 1:10 % Perform the wave motion for 180 degrees
        
        % Update the stickman's appearance
        clf; % Clear the figure
        rectangle('Position', headPosition, 'Curvature', [1, 1], 'EdgeColor', 'b', 'LineWidth', 2);
        line(bodyX, bodyY, 'Color', 'b', 'LineWidth', 2);
        line(leftArmX, leftArmY, 'Color', 'b', 'LineWidth', 2);
        line(rightArmX1, rightArmY1, 'Color', 'b', 'LineWidth', 2);
        line(rightArmX2, rightArmY2, 'Color', 'b', 'LineWidth', 2);
        line(leftHatX, leftHatY, 'Color', 'b', 'LineWidth', 2); 
        line(rightHatX, rightHatY, 'Color', 'b', 'LineWidth', 2); 
        line(leftLegX, leftLegY, 'Color', 'b', 'LineWidth', 2); 
        line(rightLegX, rightLegY, 'Color', 'b', 'LineWidth', 2); 
    
        % Apply waving motion to the right arm
        rightArmX2 = [standing_pos_x + 0.05, standing_pos_x + 0.1];
        rightArmY2 = [standing_pos_y - headRadius - 0.15, standing_pos_y - headRadius - 0.15 - i*0.01];
    
        % Set axis limits and aspect ratio
        xlim([0 3])
        ylim([0 3])
    
        % Turn off axis labels
        axis off;
    
        % Pause for a short time to control animation speed
        frame = getframe(gcf);
        writeVideo(myvideo,frame);
        pause(frame_rate);
    
        % Update the figure
        drawnow;
    end
end 

% Look up + monster appear
for i = 1:10
    % Look up
    % Update the stickman's appearance
        clf; % Clear the figure
        hold on;
        rectangle('Position', headPosition, 'Curvature', [1, 1], 'EdgeColor', 'b', 'LineWidth', 2);
        line(bodyX, bodyY, 'Color', 'b', 'LineWidth', 2);
        line(leftArmX, leftArmY, 'Color', 'b', 'LineWidth', 2);
        line(rightArmX1, rightArmY1, 'Color', 'b', 'LineWidth', 2);
        line(rightArmX2, rightArmY2, 'Color', 'b', 'LineWidth', 2);
        line(leftHatX, leftHatY, 'Color', 'b', 'LineWidth', 2); 
        line(rightHatX, rightHatY, 'Color', 'b', 'LineWidth', 2); 
        line(leftLegX, leftLegY, 'Color', 'b', 'LineWidth', 2); 
        line(rightLegX, rightLegY, 'Color', 'b', 'LineWidth', 2); 
    
        % Apply moving motion to hat
        leftHatX = [standing_pos_x-i*0.01, standing_pos_x-0.1]; 
        leftHatY = [standing_pos_y+0.25-i*0.005, standing_pos_y-0.005*i];
        rightHatX = [standing_pos_x-i*0.01, standing_pos_x+0.1];
        rightHatY = [standing_pos_y+0.25-i*0.005, standing_pos_y+i*0.005];
        
        % Giant moving to the left
        % Define a transformation matrix for scaling and translation
        T = [1.05, 0, -0.2;  % Scale x by 1.2 and translate x by 1 units
             0, 1.05, 0];  % Scale y by 1.2
        % giant

        plot(body(:, 1), body(:, 2), 'r', 'LineWidth', 2);
        plot(head(:, 1), head(:, 2), 'r', 'LineWidth', 2);
        plot(arm(:, 1), arm(:, 2), 'r', 'LineWidth', 2);
        plot(octagon(:, 1), octagon(:, 2), 'r', 'LineWidth', 2);
        
        body = (T * [body'; ones(1, size(body, 1))])';
        head = (T * [head'; ones(1, size(head, 1))])';
        arm = (T * [arm'; ones(1, size(arm, 1))])';
        octagon = (T * [octagon'; ones(1, size(octagon, 1))])';

        % Set axis limits and aspect ratio
        xlim([0 3])
        ylim([0 3])
    
        % Turn off axis labels
        axis off;
    
        % Pause for a short time to control animation speed
        frame = getframe(gcf);
        writeVideo(myvideo,frame);
        pause(frame_rate);
    
        % Update the figure
        drawnow;
end
clf;
% kneeling stickman
rightArmX1 = [standing_pos_x, standing_pos_x + 0.05];
rightArmY1 = [standing_pos_y - headRadius, standing_pos_y - headRadius - 0.15];
rightArmX2 = [standing_pos_x + 0.05, standing_pos_x + 0.1];
rightArmY2 = [standing_pos_y - headRadius - 0.15, standing_pos_y - headRadius - 0.15];
leftArmX = [standing_pos_x, standing_pos_x + 0.1];
leftArmY = [standing_pos_y - headRadius, standing_pos_y - headRadius - 0.1];
leftLegX = [standing_pos_x, standing_pos_x-0.2];
leftLegY = [standing_pos_y-0.3, standing_pos_y-0.55];
rightLegX1 = [standing_pos_x, standing_pos_x+0.07];
rightLegY1 = [standing_pos_y-0.3, standing_pos_y-0.3];
rightLegX2 = [standing_pos_x+0.07, standing_pos_x+0.1];
rightLegY2 = [standing_pos_y-0.3, standing_pos_y-0.55];

% plot stickman kneeling
hold on;
rectangle('Position', headPosition, 'Curvature', [1, 1], 'EdgeColor', 'b', 'LineWidth', 2);
line(bodyX, bodyY, 'Color', 'b', 'LineWidth', 2);
line(leftArmX, leftArmY, 'Color', 'b', 'LineWidth', 2);
line(rightArmX1, rightArmY1, 'Color', 'b', 'LineWidth', 2);
line(rightArmX2, rightArmY2, 'Color', 'b', 'LineWidth', 2);
line(leftHatX, leftHatY, 'Color', 'b', 'LineWidth', 2); 
line(rightHatX, rightHatY, 'Color', 'b', 'LineWidth', 2); 
line(leftLegX, leftLegY, 'Color', 'b', 'LineWidth', 2); 
line(rightLegX1, rightLegY1, 'Color', 'b', 'LineWidth', 2); 
line(rightLegX2, rightLegY2, 'Color', 'b', 'LineWidth', 2);

% plot giant
plot(body(:, 1), body(:, 2), 'r', 'LineWidth', 2);
plot(head(:, 1), head(:, 2), 'r', 'LineWidth', 2);
plot(arm(:, 1), arm(:, 2), 'r', 'LineWidth', 2);
plot(octagon(:, 1), octagon(:, 2), 'r', 'LineWidth', 2);

% Set axis limits and aspect ratio
xlim([0 3])
ylim([0 3])

% Turn off axis labels
axis off;
frame = getframe(gcf);
writeVideo(myvideo,frame);
pause(1)

% shoot polygon item out to defeat giant
for i = 1:10
    clf;
    
    % Plot the initial polygon
    plot(polygon(:, 1), polygon(:, 2), 'g', 'LineWidth', 2);
    hold on;
    
    % Define a transformation matrix for scaling and translation
    T = [1.1, 0, 0.1;  % Scale x by 1.5 and translate x by 2.5 units
         0, 1.1, 0];  % Scale y by 1.5
    
    % Apply the transformation to the polygon
    polygon = (T * [polygon'; ones(1, size(polygon, 1))])';
    
    % Convert the rotation angle to radians
    theta = deg2rad(-i);
    
    % Define a rotation matrix
    R = [cos(theta), -sin(theta);
         sin(theta), cos(theta)];
    
    % Apply the rotation matrix to the transformed polygon
    polygon = (R * polygon(:, 1:2)')';
    polygon = (T * [polygon'; ones(1, size(polygon, 1))])';
    
    % kneeling stickman
    rightArmX1 = [standing_pos_x, standing_pos_x + 0.05];
    rightArmY1 = [standing_pos_y - headRadius, standing_pos_y - headRadius - 0.15];
    rightArmX2 = [standing_pos_x + 0.05, standing_pos_x + 0.1];
    rightArmY2 = [standing_pos_y - headRadius - 0.15, standing_pos_y - headRadius - 0.15];
    leftArmX = [standing_pos_x, standing_pos_x + 0.1];
    leftArmY = [standing_pos_y - headRadius, standing_pos_y - headRadius - 0.1];
    leftLegX = [standing_pos_x, standing_pos_x-0.2];
    leftLegY = [standing_pos_y-0.3, standing_pos_y-0.55];
    rightLegX1 = [standing_pos_x, standing_pos_x+0.07];
    rightLegY1 = [standing_pos_y-0.3, standing_pos_y-0.3];
    rightLegX2 = [standing_pos_x+0.07, standing_pos_x+0.1];
    rightLegY2 = [standing_pos_y-0.3, standing_pos_y-0.55];
    
    % plot stickman kneeling
    rectangle('Position', headPosition, 'Curvature', [1, 1], 'EdgeColor', 'b', 'LineWidth', 2);
    line(bodyX, bodyY, 'Color', 'b', 'LineWidth', 2);
    line(leftArmX, leftArmY, 'Color', 'b', 'LineWidth', 2);
    line(rightArmX1, rightArmY1, 'Color', 'b', 'LineWidth', 2);
    line(rightArmX2, rightArmY2, 'Color', 'b', 'LineWidth', 2);
    line(leftHatX, leftHatY, 'Color', 'b', 'LineWidth', 2); 
    line(rightHatX, rightHatY, 'Color', 'b', 'LineWidth', 2); 
    line(leftLegX, leftLegY, 'Color', 'b', 'LineWidth', 2); 
    line(rightLegX1, rightLegY1, 'Color', 'b', 'LineWidth', 2); 
    line(rightLegX2, rightLegY2, 'Color', 'b', 'LineWidth', 2);
    if i < 6
        % plot giant
        plot(body(:, 1), body(:, 2), 'r', 'LineWidth', 2);
        plot(head(:, 1), head(:, 2), 'r', 'LineWidth', 2);
        plot(arm(:, 1), arm(:, 2), 'r', 'LineWidth', 2);
        plot(octagon(:, 1), octagon(:, 2), 'r', 'LineWidth', 2);
    end    
    % Set axis limits and aspect ratio
    xlim([0 3])
    ylim([0 3])
    
    % Turn off axis labels
    axis off;
    frame = getframe(gcf);
    writeVideo(myvideo,frame);
    pause(frame_rate*2);
end

% Define the stickman's body parts
headRadius = 0.1;
headPosition = [standing_pos_x - headRadius, standing_pos_y - headRadius, 2 * headRadius, 2 * headRadius];
bodyX = [standing_pos_x, standing_pos_x];
bodyY = [standing_pos_y - headRadius - 0.2, standing_pos_y - headRadius];
leftArmX = [standing_pos_x, standing_pos_x - 0.1];
leftArmY = [standing_pos_y - headRadius, standing_pos_y - headRadius - 0.15];
rightArmX1 = [standing_pos_x, standing_pos_x + 0.05];
rightArmY1 = [standing_pos_y - headRadius, standing_pos_y - headRadius - 0.15];
rightArmX2 = [standing_pos_x + 0.05, standing_pos_x + 0.1];
rightArmY2 = [standing_pos_y - headRadius - 0.15, standing_pos_y - headRadius - 0.15];
leftHatX = [standing_pos_x, standing_pos_x-0.1]; 
leftHatY = [standing_pos_y+0.25, standing_pos_y];
rightHatX = [standing_pos_x, standing_pos_x+0.1];
rightHatY = [standing_pos_y+0.25, standing_pos_y];
leftLegX = [standing_pos_x, standing_pos_x-0.1];
leftLegY = [standing_pos_y-0.3, standing_pos_y-0.55];
rightLegX = [standing_pos_x, standing_pos_x+0.1];
rightLegY = [standing_pos_y-0.3, standing_pos_y-0.55];
% Wave motion
for j = 1:2
    % Loop to perform waving
    for i = 1:10 % Perform the wave motion for 180 degrees
        
        % Update the stickman's appearance
        clf; % Clear the figure
        rectangle('Position', headPosition, 'Curvature', [1, 1], 'EdgeColor', 'b', 'LineWidth', 2);
        line(bodyX, bodyY, 'Color', 'b', 'LineWidth', 2);
        line(leftArmX, leftArmY, 'Color', 'b', 'LineWidth', 2);
        line(rightArmX1, rightArmY1, 'Color', 'b', 'LineWidth', 2);
        line(rightArmX2, rightArmY2, 'Color', 'b', 'LineWidth', 2);
        line(leftHatX, leftHatY, 'Color', 'b', 'LineWidth', 2); 
        line(rightHatX, rightHatY, 'Color', 'b', 'LineWidth', 2); 
        line(leftLegX, leftLegY, 'Color', 'b', 'LineWidth', 2); 
        line(rightLegX, rightLegY, 'Color', 'b', 'LineWidth', 2); 
    
        % Apply waving motion to the right arm
        rightArmX2 = [standing_pos_x + 0.05, standing_pos_x + 0.1];
        rightArmY2 = [standing_pos_y - headRadius - 0.15, standing_pos_y - headRadius - 0.15 + i*0.01];
    
        % Set axis limits and aspect ratio
        xlim([0 3])
        ylim([0 3])
    
        % Turn off axis labels
        axis off;
    
        % Pause for a short time to control animation speed
        pause(frame_rate*2);
        frame = getframe(gcf);
        writeVideo(myvideo,frame);
    
        % Update the figure
        drawnow;
    end
    
    % Loop to perform waving
    for i = 1:10 % Perform the wave motion for 180 degrees
        
        % Update the stickman's appearance
        clf; % Clear the figure
        rectangle('Position', headPosition, 'Curvature', [1, 1], 'EdgeColor', 'b', 'LineWidth', 2);
        line(bodyX, bodyY, 'Color', 'b', 'LineWidth', 2);
        line(leftArmX, leftArmY, 'Color', 'b', 'LineWidth', 2);
        line(rightArmX1, rightArmY1, 'Color', 'b', 'LineWidth', 2);
        line(rightArmX2, rightArmY2, 'Color', 'b', 'LineWidth', 2);
        line(leftHatX, leftHatY, 'Color', 'b', 'LineWidth', 2); 
        line(rightHatX, rightHatY, 'Color', 'b', 'LineWidth', 2); 
        line(leftLegX, leftLegY, 'Color', 'b', 'LineWidth', 2); 
        line(rightLegX, rightLegY, 'Color', 'b', 'LineWidth', 2); 
    
        % Apply waving motion to the right arm
        rightArmX2 = [standing_pos_x + 0.05, standing_pos_x + 0.1];
        rightArmY2 = [standing_pos_y - headRadius - 0.15, standing_pos_y - headRadius - 0.15 - i*0.01];
    
        % Set axis limits and aspect ratio
        xlim([0 3])
        ylim([0 3])
    
        % Turn off axis labels
        axis off;
    
        % Pause for a short time to control animation speed
        frame = getframe(gcf);
        writeVideo(myvideo,frame);
        pause(frame_rate);
    
        % Update the figure
        drawnow;
    end
end 


% Close the figure
close(myvideo)
close(f);