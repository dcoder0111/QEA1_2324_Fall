% Create a figure
f = figure('Visible', 'on');

% Set aspect ratio to be equal
axis equal;

% Define the width and height of the block man's body, head, arm, and leg
body_x = 2;
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

% Plot the body, head, arm, and leg
plot(body(:, 1), body(:, 2), 'r', 'LineWidth', 2);
hold on;
plot(head(:, 1), head(:, 2), 'r', 'LineWidth', 2);
plot(arm(:, 1), arm(:, 2), 'g', 'LineWidth', 2);
plot(octagon(:, 1), octagon(:, 2), 'm', 'LineWidth', 2);


% Set axis limits and aspect ratio
axis([0 body_height + 0.1 0 body_width + 0.1]);

% Keep the figure open
