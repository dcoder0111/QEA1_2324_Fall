% Define the initial irregular 8-sided polygon
polygon = [0.25, 0.25;   % Vertex 1
           0.5, 0.25;   % Vertex 2
           0.625, 0.375; % Vertex 3
           0.5, 0.5;   % Vertex 4
           0.375, 0.625; % Vertex 5
           0.25, 0.5;   % Vertex 6
           0.125, 0.375; % Vertex 7
           0.25, 0.25];  % Vertex 8

% Create a figure
f = figure('Visible', 'on');

% Plot the initial polygon
plot(polygon(:, 1), polygon(:, 2), 'b', 'LineWidth', 2);
hold on;

% Define a transformation matrix for scaling and translation
T = [1.5, 0, 0.1;  % Scale x by 1.5 and translate x by 2.5 units
     0, 1.5, 0];  % Scale y by 1.5

% Apply the transformation to the polygon
transformed_polygon = (T * [polygon'; ones(1, size(polygon, 1))])';

% Plot the transformed polygon
plot(transformed_polygon(:, 1), transformed_polygon(:, 2), 'r', 'LineWidth', 2);

% Define a rotation angle (e.g., 15 degrees)
rotation_angle = -15;

% Convert the rotation angle to radians
theta = deg2rad(rotation_angle);

% Define a rotation matrix
R = [cos(theta), -sin(theta);
     sin(theta), cos(theta)];

% Apply the rotation matrix to the transformed polygon
rotated_polygon = (R * transformed_polygon(:, 1:2)')';
transformed_rotated_polygon = (T * [rotated_polygon'; ones(1, size(polygon, 1))])';
% Plot the rotated polygon
plot(transformed_rotated_polygon(:, 1), transformed_rotated_polygon(:, 2), 'g', 'LineWidth', 2);

% Set axis limits and aspect ratio
axis equal;
axis([0 7 0 4]);

% Keep the figure open
