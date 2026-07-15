-- Datos de ejemplo: Reservas SJO Airport
-- Compatible con MySQL/MariaDB

CREATE TABLE IF NOT EXISTS reservas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    fecha_reserva DATE NOT NULL,
    hora_reserva TIME,
    cliente_nombre VARCHAR(100),
    categoria VARCHAR(50),
    duracion_dias INT,
    no_show BOOLEAN DEFAULT FALSE,
    aerolinea VARCHAR(50),
    vuelo_llegada VARCHAR(10),
    terminal VARCHAR(10),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO reservas (fecha_reserva, hora_reserva, cliente_nombre, categoria, duracion_dias, no_show, aerolinea, vuelo_llegada, terminal) VALUES
('2026-07-01', '08:30:00', 'Carlos Méndez', 'Premium', 3, FALSE, 'American', 'AA1234', 'N'),
('2026-07-01', '09:15:00', 'María Rodríguez', 'Estandar', 5, FALSE, 'United', 'UA567', 'M'),
('2026-07-01', '10:00:00', 'Juan Pérez', 'Estandar', 2, TRUE, 'Delta', 'DL891', 'N'),
('2026-07-01', '11:30:00', 'Ana Castillo', 'Premium', 7, FALSE, 'Iberia', 'IB345', 'M'),
('2026-07-01', '14:00:00', 'Pedro Solís', 'Estandar', 1, FALSE, 'Copa', 'CM678', 'N'),
('2026-07-01', '16:45:00', 'Laura Vega', 'Estandar', 4, FALSE, 'Avianca', 'AV901', 'M'),
('2026-07-01', '18:20:00', 'Roberto Mora', 'Premium', 6, TRUE, 'Delta', 'DL234', 'N'),
('2026-07-02', '07:45:00', 'Sofía Aguilar', 'Estandar', 2, FALSE, 'American', 'AA567', 'N'),
('2026-07-02', '09:00:00', 'Diego Rojas', 'Premium', 3, FALSE, 'United', 'UA890', 'M'),
('2026-07-02', '10:30:00', 'Elena Campos', 'Estandar', 4, TRUE, 'Copa', 'CM123', 'N'),
('2026-07-02', '12:00:00', 'Andrés Navarro', 'Estandar', 1, FALSE, 'Avianca', 'AV456', 'M'),
('2026-07-02', '13:30:00', 'Mónica Herrera', 'Premium', 5, FALSE, 'Iberia', 'IB789', 'N'),
('2026-07-02', '15:00:00', 'Luis Chacón', 'Estandar', 3, FALSE, 'Delta', 'DL012', 'M'),
('2026-07-02', '17:30:00', 'Raquel Brenes', 'Estandar', 2, FALSE, 'American', 'AA345', 'N'),
('2026-07-03', '08:00:00', 'José Quirós', 'Premium', 4, FALSE, 'Copa', 'CM678', 'M'),
('2026-07-03', '09:45:00', 'Diana Vargas', 'Estandar', 3, TRUE, 'United', 'UA901', 'N'),
('2026-07-03', '11:15:00', 'Fernando Arias', 'Estandar', 6, FALSE, 'Avianca', 'AV234', 'M'),
('2026-07-03', '13:00:00', 'Cristina Ureña', 'Premium', 2, FALSE, 'Delta', 'DL567', 'N'),
('2026-07-03', '14:45:00', 'Mario Sandí', 'Estandar', 5, FALSE, 'American', 'AA890', 'M'),
('2026-07-03', '16:30:00', 'Patricia Granados', 'Estandar', 1, TRUE, 'Iberia', 'IB123', 'N');

CREATE TABLE IF NOT EXISTS vuelos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    aerolinea VARCHAR(50),
    numero_vuelo VARCHAR(10),
    origen VARCHAR(3),
    destino VARCHAR(3),
    hora_llegada TIME,
    terminal VARCHAR(10),
    fecha DATE,
    pasajeros INT,
    carga_kg DECIMAL(10,2)
);

INSERT INTO vuelos (aerolinea, numero_vuelo, origen, destino, hora_llegada, terminal, fecha, pasajeros, carga_kg) VALUES
('American', 'AA1234', 'MIA', 'SJO', '08:15:00', 'N', '2026-07-01', 180, 2500.00),
('United', 'UA567', 'IAH', 'SJO', '09:00:00', 'M', '2026-07-01', 200, 3200.50),
('Delta', 'DL891', 'ATL', 'SJO', '10:30:00', 'N', '2026-07-01', 165, 1800.00),
('Copa', 'CM678', 'PTY', 'SJO', '13:45:00', 'M', '2026-07-01', 150, 1200.00),
('Avianca', 'AV901', 'BOG', 'SJO', '16:15:00', 'N', '2026-07-01', 175, 2100.00),
('Iberia', 'IB345', 'MAD', 'SJO', '18:00:00', 'M', '2026-07-01', 290, 8500.00),
('American', 'AA567', 'DFW', 'SJO', '07:30:00', 'N', '2026-07-02', 190, 2800.00),
('United', 'UA890', 'EWR', 'SJO', '08:45:00', 'M', '2026-07-02', 170, 1900.00),
('Copa', 'CM123', 'PTY', 'SJO', '10:15:00', 'N', '2026-07-02', 155, 1300.00),
('Delta', 'DL012', 'LAX', 'SJO', '14:30:00', 'M', '2026-07-02', 210, 4500.00);
