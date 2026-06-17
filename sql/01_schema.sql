-- Practicas 7, 8 y 9 - Operaciones del Algebra Relacional
-- Dominio: Sistema universitario
-- Compatible con PostgreSQL 15+

DROP TABLE IF EXISTS inscripcion CASCADE;
DROP TABLE IF EXISTS grupo CASCADE;
DROP TABLE IF EXISTS aula CASCADE;
DROP TABLE IF EXISTS curso CASCADE;
DROP TABLE IF EXISTS estudiante CASCADE;
DROP TABLE IF EXISTS profesor CASCADE;
DROP TABLE IF EXISTS carrera CASCADE;
DROP TABLE IF EXISTS departamento CASCADE;

CREATE TABLE departamento (
    id_departamento INTEGER PRIMARY KEY,
    nombre VARCHAR(80) NOT NULL UNIQUE,
    edificio VARCHAR(30) NOT NULL,
    telefono VARCHAR(20) NOT NULL
);

CREATE TABLE carrera (
    id_carrera INTEGER PRIMARY KEY,
    nombre VARCHAR(120) NOT NULL UNIQUE,
    nivel VARCHAR(40) NOT NULL,
    creditos_totales INTEGER NOT NULL CHECK (creditos_totales > 0),
    id_departamento INTEGER NOT NULL REFERENCES departamento(id_departamento)
);

CREATE TABLE profesor (
    id_profesor INTEGER PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    correo VARCHAR(120) NOT NULL UNIQUE,
    grado VARCHAR(40) NOT NULL,
    salario NUMERIC(10,2) NOT NULL CHECK (salario > 0),
    id_departamento INTEGER NOT NULL REFERENCES departamento(id_departamento),
    id_supervisor INTEGER NULL REFERENCES profesor(id_profesor)
);

CREATE TABLE estudiante (
    id_estudiante INTEGER PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    correo VARCHAR(120) NOT NULL UNIQUE,
    edad INTEGER NOT NULL CHECK (edad BETWEEN 16 AND 80),
    semestre INTEGER NOT NULL CHECK (semestre BETWEEN 1 AND 12),
    promedio NUMERIC(4,2) NOT NULL CHECK (promedio BETWEEN 0 AND 10),
    id_carrera INTEGER NOT NULL REFERENCES carrera(id_carrera),
    id_tutor INTEGER NULL REFERENCES profesor(id_profesor)
);

CREATE TABLE curso (
    id_curso INTEGER PRIMARY KEY,
    nombre VARCHAR(120) NOT NULL UNIQUE,
    creditos INTEGER NOT NULL CHECK (creditos > 0),
    tipo VARCHAR(20) NOT NULL CHECK (tipo IN ('Obligatorio','Optativo')),
    area VARCHAR(60) NOT NULL,
    id_departamento INTEGER NOT NULL REFERENCES departamento(id_departamento)
);

CREATE TABLE aula (
    id_aula INTEGER PRIMARY KEY,
    clave VARCHAR(20) NOT NULL UNIQUE,
    edificio VARCHAR(30) NOT NULL,
    capacidad INTEGER NOT NULL CHECK (capacidad > 0),
    tipo VARCHAR(40) NOT NULL,
    tiene_proyector BOOLEAN NOT NULL
);

CREATE TABLE grupo (
    id_grupo INTEGER PRIMARY KEY,
    id_curso INTEGER NOT NULL REFERENCES curso(id_curso),
    id_profesor INTEGER NOT NULL REFERENCES profesor(id_profesor),
    id_aula INTEGER NOT NULL REFERENCES aula(id_aula),
    periodo VARCHAR(20) NOT NULL,
    cupo INTEGER NOT NULL CHECK (cupo > 0),
    horario VARCHAR(60) NOT NULL
);

CREATE TABLE inscripcion (
    id_inscripcion INTEGER PRIMARY KEY,
    id_estudiante INTEGER NOT NULL REFERENCES estudiante(id_estudiante),
    id_grupo INTEGER NOT NULL REFERENCES grupo(id_grupo),
    fecha DATE NOT NULL,
    calificacion NUMERIC(4,2) NULL CHECK (calificacion BETWEEN 0 AND 10),
    estado VARCHAR(20) NOT NULL CHECK (estado IN ('Inscrito','Aprobado','Reprobado','Baja')),
    UNIQUE(id_estudiante, id_grupo)
);
