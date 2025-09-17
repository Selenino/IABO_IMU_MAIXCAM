% Load the data from the CSV file
filename = 'basket_3.csv';
data = readtable(filename);

% Define the starting index for trimming
start_idx = 210;   % puedes cambiar este valor

% Extract the time and sensor data (recortados)
time   = data{start_idx:end, 1};
acc_x  = data{start_idx:end, 2};
acc_y  = data{start_idx:end, 3};
acc_z  = data{start_idx:end, 4};
gyro_x = data{start_idx:end, 5};
gyro_y = data{start_idx:end, 6};
gyro_z = data{start_idx:end, 7};

% Crear tabla con los datos recortados
data_recortado = table(time, acc_x, acc_y, acc_z, gyro_x, gyro_y, gyro_z);

% Generar nuevo nombre de archivo con sufijo _recortado
[~, name, ext] = fileparts(filename);
new_filename = strcat(name, '_recortado', ext);

% Guardar archivo recortado
writetable(data_recortado, new_filename);

fprintf('Archivo recortado guardado como: %s\n', new_filename);

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
title('Accelerations and Gyroscopes over Time (Recortado)');
legend('show');
grid on;
hold off;
