-- 03_consultas_basicas.sql
-- Ejecutar despues de 01_schema.sql y 02_data.sql

-- S1. Condicion simple con igualdad: estudiantes de la carrera ISC
SELECT id_estudiante, nombre, semestre, promedio FROM estudiante WHERE id_carrera = 1 ORDER BY id_estudiante;

-- S2. Condicion con desigualdad: cursos que no son optativos
SELECT id_curso, nombre, tipo FROM curso WHERE tipo <> 'Optativo' ORDER BY id_curso;

-- S3. Comparacion: profesores con salario mayor a 40000
SELECT id_profesor, nombre, salario FROM profesor WHERE salario > 40000 ORDER BY salario DESC;

-- S4. AND: estudiantes de semestre 5 o superior con promedio mayor a 8.5
SELECT id_estudiante, nombre, semestre, promedio FROM estudiante WHERE semestre >= 5 AND promedio > 8.5 ORDER BY promedio DESC;

-- S5. OR: aulas teoricas o auditorios
SELECT id_aula, clave, tipo, capacidad FROM aula WHERE tipo = 'Teorica' OR tipo = 'Auditorio' ORDER BY id_aula;

-- S6. NOT: cursos que no pertenecen al area de Matematicas
SELECT id_curso, nombre, area FROM curso WHERE NOT (area = 'Matematicas') ORDER BY id_curso;

-- S7. Condicion compuesta con parentesis
SELECT id_estudiante, nombre, edad, semestre, promedio FROM estudiante WHERE (semestre >= 6 AND promedio >= 8.5) OR (edad < 19 AND promedio >= 8) ORDER BY id_estudiante;

-- S8. LIKE: estudiantes cuyo nombre empieza con M o contiene ana en el correo
SELECT id_estudiante, nombre, correo FROM estudiante WHERE nombre LIKE 'M%' OR correo LIKE '%ana%' ORDER BY id_estudiante;

-- S9. Valores NULL: estudiantes sin tutor asignado
SELECT id_estudiante, nombre, id_tutor FROM estudiante WHERE id_tutor IS NULL ORDER BY id_estudiante;

-- S10. Rangos BETWEEN: estudiantes de 20 a 22 años
SELECT id_estudiante, nombre, edad FROM estudiante WHERE edad BETWEEN 20 AND 22 ORDER BY edad, nombre;

-- P1. Proyeccion de un solo atributo: nombres de carreras
SELECT DISTINCT nombre FROM carrera ORDER BY nombre;

-- P2. Proyeccion de multiples atributos: nombre y correo de estudiantes
SELECT DISTINCT nombre, correo FROM estudiante ORDER BY nombre;

-- P3. Proyeccion con renombramiento
SELECT DISTINCT nombre AS nombre_estudiante, correo AS email FROM estudiante ORDER BY nombre_estudiante;

-- P4. Proyeccion que genera duplicados y elimina repetidos: semestres existentes
SELECT DISTINCT semestre FROM estudiante ORDER BY semestre;

-- P5. Proyeccion con atributo calculado: promedio ajustado
SELECT nombre, promedio, ROUND(promedio + 0.10, 2) AS promedio_estimado FROM estudiante ORDER BY nombre LIMIT 10;

-- P6. Proyeccion de clave primaria
SELECT DISTINCT id_estudiante FROM estudiante ORDER BY id_estudiante;

-- P7. Todos los atributos excepto tutor: vista academica del estudiante
SELECT id_estudiante,nombre,correo,edad,semestre,promedio,id_carrera FROM estudiante ORDER BY id_estudiante LIMIT 10;

-- P8. Proyeccion combinada con seleccion
SELECT DISTINCT nombre, promedio FROM estudiante WHERE promedio >= 9 ORDER BY promedio DESC;

-- P9. Atributos de diferentes tipos de datos
SELECT DISTINCT nombre, edad, promedio, correo FROM estudiante ORDER BY nombre LIMIT 10;

-- P10. Proyeccion que resulta en relacion vacia
SELECT DISTINCT nombre FROM estudiante WHERE promedio > 10;

-- U1. Union simple compatible: personas academicas con nombre y correo
SELECT nombre, correo FROM estudiante UNION SELECT nombre, correo FROM profesor ORDER BY nombre;

-- U2. Union de selecciones: estudiantes destacados o de primer ciclo
SELECT id_estudiante,nombre FROM estudiante WHERE promedio >= 9 UNION SELECT id_estudiante,nombre FROM estudiante WHERE semestre <= 2 ORDER BY id_estudiante;

-- U3. Union de proyecciones: areas de cursos y nombres de departamentos
SELECT area AS concepto FROM curso UNION SELECT nombre AS concepto FROM departamento ORDER BY concepto;

-- U4. Union con relacion vacia
SELECT nombre FROM estudiante UNION SELECT nombre FROM estudiante WHERE promedio > 10 ORDER BY nombre;

-- I1. Interseccion simple: nombres que aparecen como estudiante y profesor
SELECT nombre FROM estudiante INTERSECT SELECT nombre FROM profesor ORDER BY nombre;

-- I2. Interseccion con condiciones: estudiantes ISC y promedio alto
SELECT id_estudiante FROM estudiante WHERE id_carrera=1 INTERSECT SELECT id_estudiante FROM estudiante WHERE promedio>=8.5 ORDER BY id_estudiante;

-- I3. Interseccion vacia: cursos obligatorios y optativos
SELECT id_curso FROM curso WHERE tipo='Obligatorio' INTERSECT SELECT id_curso FROM curso WHERE tipo='Optativo';

-- I4. Interseccion de proyecciones: departamentos con carreras y profesores
SELECT id_departamento FROM carrera INTERSECT SELECT id_departamento FROM profesor ORDER BY id_departamento;

-- D1. Diferencia simple: profesores sin supervisor
SELECT id_profesor FROM profesor EXCEPT SELECT id_profesor FROM profesor WHERE id_supervisor IS NOT NULL ORDER BY id_profesor;

-- D2. Diferencia de selecciones: estudiantes no destacados
SELECT id_estudiante,nombre FROM estudiante EXCEPT SELECT id_estudiante,nombre FROM estudiante WHERE promedio>=9 ORDER BY id_estudiante;

-- D3. Diferencia que elimina cursos con grupo
SELECT id_curso FROM curso EXCEPT SELECT id_curso FROM grupo ORDER BY id_curso;

-- D4. Diferencia con relacion vacia
SELECT nombre FROM carrera EXCEPT SELECT nombre FROM carrera WHERE creditos_totales>400 ORDER BY nombre;

-- X1. Producto cartesiano simple de departamentos y carreras
SELECT d.nombre AS departamento, c.nombre AS carrera FROM departamento d CROSS JOIN carrera c ORDER BY departamento, carrera LIMIT 12;

-- X2. Producto cartesiano seguido de seleccion simulando JOIN
SELECT d.nombre AS departamento, c.nombre AS carrera FROM departamento d CROSS JOIN carrera c WHERE d.id_departamento = c.id_departamento ORDER BY departamento;

-- X3. Producto cartesiano de tres relaciones pequenas
SELECT d.nombre AS departamento, c.nombre AS carrera, a.clave AS aula FROM departamento d CROSS JOIN carrera c CROSS JOIN aula a LIMIT 12;

-- X4. Producto cartesiano seguido de proyeccion
SELECT e.nombre AS estudiante, c.nombre AS curso FROM estudiante e CROSS JOIN curso c LIMIT 12;

-- X5. Producto cartesiano con renombramiento para evitar ambiguedad
SELECT e1.nombre AS estudiante_1, e2.nombre AS estudiante_2 FROM estudiante e1 CROSS JOIN estudiante e2 WHERE e1.id_estudiante < e2.id_estudiante LIMIT 12;
