% Load the data from the Excel file
data = readtable('puñito_2.csv');

% Extract the time and sensor data
time = data{:, 1};
acc_x = data{:, 2};
acc_y = data{:, 3};
acc_z = data{:, 4};
gyro_x = data{:, 5};
gyro_y = data{:, 6};
gyro_z = data{:, 7};

% Create a figure for the plot
figure;

% Plot accelerations
hold on;
plot(time, acc_x, 'DisplayName', 'Accel X', 'LineWidth', 1.5);
plot(time, acc_y, 'DisplayName', 'Accel Y', 'LineWidth', 1.5);
plot(time, acc_z, 'DisplayName', 'Accel Z', 'LineWidth', 1.5);

% Plot gyroscopes
plot(time, gyro_x, 'DisplayName', 'Gyro X', 'LineWidth', 1.5);
plot(time, gyro_y, 'DisplayName', 'Gyro Y', 'LineWidth', 1.5);
plot(time, gyro_z, 'DisplayName', 'Gyro Z', 'LineWidth', 1.5);

% Customize the plot
xlabel('Time');
ylabel('Sensor Values');
title('Accelerations and Gyroscopes over Time');
legend('show');
grid on;
hold off;