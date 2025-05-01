-- -----CREACIÓN DE TABLAS-------
CREATE TABLE roles (
  id_rol INT AUTO_INCREMENT PRIMARY KEY,
  descripcion VARCHAR(101),
  estado CHAR(2),
  reg_fecha DATETIME DEFAULT CURRENT_TIMESTAMP,
  reg_usuario VARCHAR(151),
  act_fecha DATETIME NULL,
  act_usuario VARCHAR(150),
  eli_fecha DATETIME NULL,
  eli_usuario VARCHAR(150)
);

CREATE TABLE usuarios (
  id_usuario INT PRIMARY KEY AUTO_INCREMENT,
  rol_id INT,
  nombre VARCHAR(101) UNIQUE NOT NULL,
  email VARCHAR(101) UNIQUE NOT NULL,
  clave VARCHAR(256) NOT NULL,
  clave_segura VARCHAR(256),
  estado CHAR(2),
  reg_fecha DATETIME DEFAULT CURRENT_TIMESTAMP,
  reg_usuario VARCHAR(151),
  act_fecha DATETIME NULL,
  act_usuario VARCHAR(151),
  eli_fecha DATETIME NULL,
  eli_usuario VARCHAR(151),
  FOREIGN KEY (rol_id) REFERENCES roles(id_rol)
);

CREATE TABLE especies (
  id_especie INT PRIMARY KEY AUTO_INCREMENT,
  descripcion VARCHAR(100),
  estado CHAR(1),
  reg_fecha DATETIME DEFAULT CURRENT_TIMESTAMP,
  reg_usuario VARCHAR(150),
  act_fecha DATETIME NULL,
  act_usuario VARCHAR(150),
  eli_fecha DATETIME NULL,
  eli_usuario VARCHAR(150)
);

CREATE TABLE razas (
  id_raza INT PRIMARY KEY AUTO_INCREMENT,
  especie_id INT,
  nombre_raza VARCHAR(100),
  estado CHAR(1),
  reg_fecha DATETIME DEFAULT CURRENT_TIMESTAMP,
  reg_usuario VARCHAR(150),
  act_fecha DATETIME NULL,
  act_usuario VARCHAR(150),
  eli_fecha DATETIME NULL,
  eli_usuario VARCHAR(150),
  FOREIGN KEY (especie_id) REFERENCES especies(id_especie)
);

CREATE TABLE mascotas (
  id_mascota INT PRIMARY KEY AUTO_INCREMENT,
  cliente_id INT,
  nombre VARCHAR(150),
  especie_id INT,
  raza_id INT,
  fecha_nacimiento DATE,
  edad INT,
  sexo VARCHAR(10),
  peso_kg FLOAT,
  color_pelaje VARCHAR(150),
  estado CHAR(1),
  reg_fecha DATETIME DEFAULT CURRENT_TIMESTAMP,
  reg_usuario VARCHAR(150),
  act_fecha DATETIME NULL,
  act_usuario VARCHAR(150),
  eli_fecha DATETIME NULL,
  eli_usuario VARCHAR(150),
  FOREIGN KEY (cliente_id) REFERENCES usuarios(id_usuario),
  FOREIGN KEY (especie_id) REFERENCES especies(id_especie),
  FOREIGN KEY (raza_id) REFERENCES razas(id_raza)
);

CREATE TABLE vinculaciones_mascotas (
  id_vinculacion INT PRIMARY KEY AUTO_INCREMENT,
  mascota_id INT,
  codigo_vinculacion VARCHAR(150),
  cliente_id INT,
  estado VARCHAR(20),
  fecha_vinculacion DATETIME DEFAULT CURRENT_TIMESTAMP,
  reg_fecha DATETIME DEFAULT CURRENT_TIMESTAMP,
  reg_usuario VARCHAR(150),
  act_fecha DATETIME NULL,
  act_usuario VARCHAR(150),
  eli_fecha DATETIME NULL,
  eli_usuario VARCHAR(150),
  FOREIGN KEY (mascota_id) REFERENCES mascotas(id_mascota),
  FOREIGN KEY (cliente_id) REFERENCES usuarios(id_usuario)
);

CREATE TABLE contactos (
  id_contacto INT PRIMARY KEY AUTO_INCREMENT,
  usuario_id INT,
  nombre VARCHAR(100),
  apellido VARCHAR(100),
  telefono VARCHAR(10),
  email VARCHAR(100),
  direccion VARCHAR(255),
  estado CHAR(1),
  reg_fecha DATETIME DEFAULT CURRENT_TIMESTAMP,
  reg_usuario VARCHAR(150),
  act_fecha DATETIME NULL,
  act_usuario VARCHAR(150),
  eli_fecha DATETIME NULL,
  eli_usuario VARCHAR(150),
  FOREIGN KEY (usuario_id) REFERENCES usuarios(id_usuario)
);

CREATE TABLE notificaciones (
  id_notificacion INT PRIMARY KEY AUTO_INCREMENT,
  usuario_id INT,
  mensaje TEXT NOT NULL,
  correo_veterinaria VARCHAR(100),
  correo_cliente VARCHAR(100),
  reg_fecha DATETIME DEFAULT CURRENT_TIMESTAMP,
  reg_usuario VARCHAR(150),
  act_fecha DATETIME NULL,
  act_usuario VARCHAR(150),
  eli_fecha DATETIME NULL,
  eli_usuario VARCHAR(150),
  FOREIGN KEY (usuario_id) REFERENCES usuarios(id_usuario)
);

CREATE TABLE servicios (
  id_servicio INT PRIMARY KEY AUTO_INCREMENT,
  descripcion VARCHAR(150),
  estado CHAR(1),
  reg_fecha DATETIME DEFAULT CURRENT_TIMESTAMP,
  reg_usuario VARCHAR(150),
  act_fecha DATETIME NULL,
  act_usuario VARCHAR(150),
  eli_fecha DATETIME NULL,
  eli_usuario VARCHAR(150)
);

CREATE TABLE subservicios (
  id_subservicio INT PRIMARY KEY AUTO_INCREMENT,
  servicio_id INT,
  especie_id INT,
  descripcion VARCHAR(150),
  estado CHAR(1),
  reg_fecha DATETIME DEFAULT CURRENT_TIMESTAMP,
  reg_usuario VARCHAR(150),
  act_fecha DATETIME NULL,
  act_usuario VARCHAR(150),
  eli_fecha DATETIME NULL,
  eli_usuario VARCHAR(150),
  FOREIGN KEY (servicio_id) REFERENCES servicios(id_servicio),
  FOREIGN KEY (especie_id) REFERENCES especies(id_especie)
);

CREATE TABLE estado_cita (
  id_estado_cita INT PRIMARY KEY AUTO_INCREMENT,
  detalle VARCHAR(50),
  estado CHAR(1)
);

CREATE TABLE citas (
  id_cita INT PRIMARY KEY AUTO_INCREMENT,
  cliente_id INT,
  mascota_id INT,
  veterinario_id INT,
  servicio_id INT,
  fecha_hora DATETIME,
  estado_cita_id INT,
  estado CHAR(1),
  reg_fecha DATETIME DEFAULT CURRENT_TIMESTAMP,
  reg_usuario VARCHAR(150),
  act_fecha DATETIME NULL,
  act_usuario VARCHAR(150),
  eli_fecha DATETIME NULL,
  eli_usuario VARCHAR(150),
  FOREIGN KEY (cliente_id) REFERENCES usuarios(id_usuario),
  FOREIGN KEY (mascota_id) REFERENCES mascotas(id_mascota),
  FOREIGN KEY (veterinario_id) REFERENCES usuarios(id_usuario),
  FOREIGN KEY (servicio_id) REFERENCES servicios(id_servicio),
  FOREIGN KEY (estado_cita_id) REFERENCES estado_cita(id_estado_cita)
);

