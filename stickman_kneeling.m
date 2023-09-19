f = figure('Visible', 'on');

standing_pos_x = 0.2;
standing_pos_y = 0.4;

% Define the stickman's body parts
headRadius = 0.1;
headPosition = [standing_pos_x - headRadius, standing_pos_y - headRadius, 2 * headRadius, 2 * headRadius];
bodyX = [standing_pos_x, standing_pos_x];
bodyY = [standing_pos_y - headRadius - 0.2, standing_pos_y - headRadius];
leftArmX = [standing_pos_x, standing_pos_x + 0.1];
leftArmY = [standing_pos_y - headRadius, standing_pos_y - headRadius - 0.1];
rightArmX1 = [standing_pos_x, standing_pos_x + 0.05];
rightArmY1 = [standing_pos_y - headRadius, standing_pos_y - headRadius - 0.15];
rightArmX2 = [standing_pos_x + 0.05, standing_pos_x + 0.1];
rightArmY2 = [standing_pos_y - headRadius - 0.15, standing_pos_y - headRadius - 0.15];
leftHatX = [standing_pos_x, standing_pos_x-0.1]; 
leftHatY = [standing_pos_y+0.25, standing_pos_y];
rightHatX = [standing_pos_x, standing_pos_x+0.1];
rightHatY = [standing_pos_y+0.25, standing_pos_y];
leftLegX = [standing_pos_x, standing_pos_x-0.2];
leftLegY = [standing_pos_y-0.3, standing_pos_y-0.55];
rightLegX1 = [standing_pos_x, standing_pos_x+0.07];
rightLegY1 = [standing_pos_y-0.3, standing_pos_y-0.3];
rightLegX2 = [standing_pos_x+0.07, standing_pos_x+0.1];
rightLegY2 = [standing_pos_y-0.3, standing_pos_y-0.55];

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

% Set axis limits and aspect ratio
xlim([0 3])
ylim([0 3])

% Turn off axis labels
axis off;

drawnow;