-- ========================================
-- CREACIÓN Y USO DE LA BASE DE DATOS
-- ========================================
CREATE DATABASE citas_medicasbd;
USE citas_medicasbd;

-- ========================================
-- CONSULTAS BÁSICAS DE TABLAS PRINCIPALES
-- ========================================

-- Ver todos los doctores
SELECT * FROM doctor;

-- Ver todos los pacientes
SELECT * FROM patient;

-- Ver todas las reservas/citas
SELECT * FROM reserva;

-- ========================================
-- CONSULTAS DE FILTRO POR IDENTIFICADOR
-- ========================================

-- Ver datos de un doctor específico (por ID)
SELECT * FROM doctor WHERE id = 8;

-- Ver datos de un paciente específico (por ID)
SELECT * FROM patient WHERE id = 1;

-- ========================================
-- CONSULTAS PARA CONTAR REGISTROS
-- ========================================

-- Contar el total de pacientes
SELECT COUNT(*) FROM patient;

-- Contar total de citas atendidas por cada doctor
SELECT doctor_id, COUNT(*) AS total_atendidas
FROM reserva
WHERE status = 'ATENDIDA'
GROUP BY doctor_id;

-- Contar el número de citas por cada estado
SELECT status, COUNT(*) FROM reserva GROUP BY status;

-- ========================================
-- CONSULTAS DE ESTADO O FECHA
-- ========================================

-- Ver citas pendientes por reprogramación
SELECT * FROM reserva WHERE status = 'PENDIENTE_REPROGRAMACION';

-- Ver citas canceladas y mostrar motivo de cancelación
SELECT id, patient_id, doctor_id, status, motivo_cancelacion 
FROM reserva 
WHERE status = 'CANCELADA';

-- Ver todas las citas canceladas
SELECT * FROM reserva WHERE status = 'CANCELADA';

-- Ver las citas cuya fecha es hoy
SELECT * FROM reserva WHERE DATE(date_time) = CURDATE();

-- Ver citas entre dos fechas específicas
SELECT * FROM reserva WHERE date_time BETWEEN '2025-11-01' AND '2025-11-30';

-- ========================================
-- CONSULTAS DE PRUEBA Y DEBUG
-- ========================================

-- Ver todas las filas de una tabla (útil para verificar estructura y contenido)
SELECT * FROM doctors; -- si tienes otra tabla llamada "doctors"

-- ========================================
-- INSERCIÓN DE USUARIO ADMINISTRADOR (opcional)
-- ========================================

-- Agregar usuario administrador a la tabla de doctores
INSERT INTO doctor (email, password, first_name, last_name, dni, phone, area_medica, activo)
VALUES ('administrador@medico.com', '12345678', 'Admin', 'Principal', '99999999', '000000000', 'Todas', 1);

-- ========================================
-- ELIMINACIÓN COMPLETA DE LA BASE DE DATOS
-- ========================================

-- BORRA la base de datos por completo (¡ten cuidado, borra todo!)
DROP DATABASE citas_medicasbd;
