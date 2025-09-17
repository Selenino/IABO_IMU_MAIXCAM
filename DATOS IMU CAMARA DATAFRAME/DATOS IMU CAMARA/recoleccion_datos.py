from maix import ext_dev, time

# Listar opciones disponibles en tu firmware
print("Acc scales:", dir(ext_dev.imu.AccScale))
print("Acc ODRs:", dir(ext_dev.imu.AccOdr))
print("Gyro scales:", dir(ext_dev.imu.GyroScale))
print("Gyro ODRs:", dir(ext_dev.imu.GyroOdr))

QMI8658_I2CBUS_NUM = 4

# Configura aquí usando solo valores que aparezcan impresos arriba
imu = ext_dev.qmi8658.QMI8658(
    QMI8658_I2CBUS_NUM,
    mode=ext_dev.imu.Mode.DUAL,
    acc_scale=ext_dev.imu.AccScale.ACC_SCALE_8G,         # ajusta según lo que exista
    acc_odr=ext_dev.imu.AccOdr.ACC_ODR_250,              # ajusta según lo que exista
    gyro_scale=ext_dev.imu.GyroScale.GYRO_SCALE_2048DPS, # ajusta según lo que exista
    gyro_odr=ext_dev.imu.GyroOdr.GYRO_ODR_250            # ajusta según lo que exista
)

filename = "/root/puñito_3.csv"

with open(filename, "w") as f:
    f.write("time,acc_x,acc_y,acc_z,gyro_x,gyro_y,gyro_z,temp\n")

    start = time.ticks_ms()
    duration = 30000  # ms

    while (time.ticks_ms() - start) < duration:
        data = imu.read()
        timestamp = time.ticks_ms() - start
        f.write(f"{timestamp},{data[0]},{data[1]},{data[2]},{data[3]},{data[4]},{data[5]},{data[6]}\n")

        print(f"t={timestamp}ms acc=({data[0]}, {data[1]}, {data[2]}) gyro=({data[3]}, {data[4]}, {data[5]}) temp={data[6]}")

print(f"Datos guardados en {filename}")
