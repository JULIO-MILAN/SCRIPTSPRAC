-- 04_consultas_avanzadas.sql
-- Ejecutar despues de 01_schema.sql y 02_data.sql

-- JN1. Reunion natural simple: carrera con departamento
SELECT c.nombre AS carrera, d.nombre AS departamento FROM carrera c JOIN departamento d USING(id_departamento) ORDER BY carrera;

-- JN2. Reunion natural de tres tablas: estudiante, carrera y departamento
SELECT e.nombre AS estudiante, c.nombre AS carrera, d.nombre AS departamento FROM estudiante e JOIN carrera c USING(id_carrera) JOIN departamento d ON c.id_departamento=d.id_departamento ORDER BY estudiante LIMIT 12;

-- JN3. Reunion natural con proyeccion
SELECT e.nombre AS estudiante, c.nombre AS carrera FROM estudiante e JOIN carrera c USING(id_carrera) ORDER BY e.nombre LIMIT 12;

-- JT1. Theta join de igualdad: grupos con curso correspondiente
SELECT g.id_grupo, c.nombre AS curso, g.periodo FROM grupo g JOIN curso c ON g.id_curso=c.id_curso ORDER BY g.id_grupo LIMIT 12;

-- JT2. Theta join con desigualdad: aulas con capacidad mayor que cupo del grupo
SELECT a.clave, a.capacidad, g.id_grupo, g.cupo FROM aula a JOIN grupo g ON a.capacidad > g.cupo ORDER BY a.id_aula, g.id_grupo LIMIT 12;

-- JT3. Theta join compuesto: grupo en aula laboratorio con cupo suficiente
SELECT g.id_grupo, a.clave, a.tipo, a.capacidad, g.cupo FROM grupo g JOIN aula a ON g.id_aula=a.id_aula AND a.capacidad >= g.cupo AND a.tipo LIKE 'Laboratorio%' ORDER BY g.id_grupo;

-- JO1. Left outer join: todos los profesores y sus grupos si existen
SELECT p.nombre AS profesor, g.id_grupo, g.periodo FROM profesor p LEFT JOIN grupo g ON p.id_profesor=g.id_profesor ORDER BY p.id_profesor, g.id_grupo LIMIT 12;

-- JO2. Right outer join: todos los grupos con profesor, equivalente mostrado como left desde grupo
SELECT g.id_grupo, c.nombre AS curso, p.nombre AS profesor FROM grupo g LEFT JOIN profesor p ON p.id_profesor=g.id_profesor JOIN curso c ON c.id_curso=g.id_curso ORDER BY g.id_grupo LIMIT 12;

-- JO3. Full outer join: cursos y grupos, conservando cursos sin grupo y grupos sin curso
SELECT c.nombre AS curso, g.id_grupo, g.periodo FROM curso c LEFT JOIN grupo g ON c.id_curso=g.id_curso UNION SELECT c.nombre AS curso, g.id_grupo, g.periodo FROM grupo g LEFT JOIN curso c ON c.id_curso=g.id_curso ORDER BY curso, id_grupo LIMIT 12;

-- JS1. Semi-join: estudiantes que tienen inscripciones
SELECT DISTINCT e.id_estudiante, e.nombre FROM estudiante e WHERE EXISTS (SELECT 1 FROM inscripcion i WHERE i.id_estudiante=e.id_estudiante) ORDER BY e.id_estudiante;

-- JA1. Anti-join: estudiantes sin inscripciones
SELECT e.id_estudiante, e.nombre FROM estudiante e WHERE NOT EXISTS (SELECT 1 FROM inscripcion i WHERE i.id_estudiante=e.id_estudiante) ORDER BY e.id_estudiante;

-- JS2. Semi-join combinado: carreras con estudiantes inscritos
SELECT DISTINCT c.id_carrera, c.nombre FROM carrera c WHERE EXISTS (SELECT 1 FROM estudiante e JOIN inscripcion i ON e.id_estudiante=i.id_estudiante WHERE e.id_carrera=c.id_carrera) ORDER BY c.id_carrera;

-- SELF1. Auto-reunion: pares de estudiantes de la misma carrera
SELECT e1.nombre AS estudiante_1, e2.nombre AS estudiante_2, e1.id_carrera FROM estudiante e1 JOIN estudiante e2 ON e1.id_carrera=e2.id_carrera AND e1.id_estudiante<e2.id_estudiante ORDER BY e1.id_carrera LIMIT 12;

-- SELF2. Auto-reunion jerarquica: profesor y supervisor
SELECT p.nombre AS profesor, s.nombre AS supervisor FROM profesor p JOIN profesor s ON p.id_supervisor=s.id_profesor ORDER BY supervisor, profesor;

-- SELF3. Auto-reunion por caracteristicas similares: profesores del mismo departamento
SELECT p1.nombre AS profesor_1, p2.nombre AS profesor_2, p1.id_departamento FROM profesor p1 JOIN profesor p2 ON p1.id_departamento=p2.id_departamento AND p1.id_profesor<p2.id_profesor ORDER BY p1.id_departamento LIMIT 12;

-- A1. COUNT de todas las tuplas: total de estudiantes
SELECT COUNT(*) AS total_estudiantes FROM estudiante;

-- A2. COUNT de valores distintos: carreras con estudiantes
SELECT COUNT(DISTINCT id_carrera) AS carreras_con_estudiantes FROM estudiante;

-- A3. SUM de columna numerica: cupo total de grupos
SELECT SUM(cupo) AS cupo_total FROM grupo;

-- A4. AVG de columna numerica: promedio general academico
SELECT ROUND(AVG(promedio),2) AS promedio_general FROM estudiante;

-- A5. MAX de columna numerica: salario maximo docente
SELECT MAX(salario) AS salario_maximo FROM profesor;

-- A6. MIN de columna numerica: calificacion minima
SELECT MIN(calificacion) AS calificacion_minima FROM inscripcion;

-- A7. Multiples funciones agregadas
SELECT COUNT(*) AS n, ROUND(AVG(promedio),2) AS promedio, MAX(promedio) AS maximo, MIN(promedio) AS minimo FROM estudiante;

-- A8. Agregacion con seleccion previa
SELECT ROUND(AVG(promedio),2) AS promedio_isc FROM estudiante WHERE id_carrera=1;

-- A9. Agregacion con condicion de resultado
SELECT id_carrera, COUNT(*) AS total FROM estudiante GROUP BY id_carrera HAVING COUNT(*) > 3 ORDER BY id_carrera;

-- A10. Agregacion sobre resultado de reunion
SELECT ROUND(AVG(i.calificacion),2) AS promedio_calificaciones FROM estudiante e JOIN inscripcion i ON e.id_estudiante=i.id_estudiante;

-- G1. Agrupacion simple con COUNT: estudiantes por carrera
SELECT c.nombre AS carrera, COUNT(e.id_estudiante) AS total FROM carrera c LEFT JOIN estudiante e ON c.id_carrera=e.id_carrera GROUP BY c.id_carrera,c.nombre ORDER BY c.id_carrera;

-- G2. Agrupacion con SUM: creditos por area
SELECT area, SUM(creditos) AS creditos_area FROM curso GROUP BY area ORDER BY area;

-- G3. Agrupacion con AVG: promedio por carrera
SELECT c.nombre AS carrera, ROUND(AVG(e.promedio),2) AS promedio_carrera FROM estudiante e JOIN carrera c ON e.id_carrera=c.id_carrera GROUP BY c.nombre ORDER BY promedio_carrera DESC;

-- G4. Agrupacion con MAX/MIN: calificaciones por grupo
SELECT id_grupo, MAX(calificacion) AS max_calif, MIN(calificacion) AS min_calif FROM inscripcion GROUP BY id_grupo ORDER BY id_grupo LIMIT 12;

-- G5. Agrupacion por multiples atributos: cursos por tipo y area
SELECT tipo, area, COUNT(*) AS total FROM curso GROUP BY tipo, area ORDER BY tipo, area;

-- G6. Agrupacion con seleccion previa: inscritos aprobados por grupo
SELECT id_grupo, COUNT(*) AS aprobados FROM inscripcion WHERE estado='Aprobado' GROUP BY id_grupo ORDER BY id_grupo LIMIT 12;

-- G7. Agrupacion con condicion posterior HAVING
SELECT id_grupo, COUNT(*) AS total FROM inscripcion GROUP BY id_grupo HAVING COUNT(*) > 5 ORDER BY total DESC, id_grupo;

-- G8. Agrupacion sobre reunion: inscritos por curso
SELECT c.nombre AS curso, COUNT(i.id_inscripcion) AS inscritos FROM curso c JOIN grupo g ON c.id_curso=g.id_curso JOIN inscripcion i ON g.id_grupo=i.id_grupo GROUP BY c.nombre ORDER BY inscritos DESC, curso LIMIT 12;

-- G9. Multiples funciones agrupadas: estadisticas por carrera
SELECT c.nombre AS carrera, COUNT(*) AS total, ROUND(AVG(e.promedio),2) AS promedio, MAX(e.promedio) AS maximo FROM estudiante e JOIN carrera c ON e.id_carrera=c.id_carrera GROUP BY c.nombre ORDER BY carrera;

-- G10. Agrupacion anidada: promedio de promedios por departamento
SELECT departamento, ROUND(AVG(promedio_carrera),2) AS promedio_de_promedios FROM (SELECT d.nombre AS departamento, c.nombre AS carrera, AVG(e.promedio) AS promedio_carrera FROM estudiante e JOIN carrera c ON e.id_carrera=c.id_carrera JOIN departamento d ON c.id_departamento=d.id_departamento GROUP BY d.nombre, c.nombre) x GROUP BY departamento ORDER BY departamento;

-- DIV1. Estudiantes inscritos en TODOS los cursos obligatorios
SELECT e.id_estudiante, e.nombre FROM estudiante e WHERE NOT EXISTS (SELECT 1 FROM curso c WHERE c.tipo='Obligatorio' AND NOT EXISTS (SELECT 1 FROM inscripcion i JOIN grupo g ON i.id_grupo=g.id_grupo WHERE i.id_estudiante=e.id_estudiante AND g.id_curso=c.id_curso)) ORDER BY e.id_estudiante;

-- DIV2. Estudiantes inscritos en TODOS los cursos del area Base de Datos
SELECT e.id_estudiante, e.nombre FROM estudiante e WHERE NOT EXISTS (SELECT 1 FROM curso c WHERE c.area='Base de Datos' AND NOT EXISTS (SELECT 1 FROM inscripcion i JOIN grupo g ON i.id_grupo=g.id_grupo WHERE i.id_estudiante=e.id_estudiante AND g.id_curso=c.id_curso)) ORDER BY e.id_estudiante;

-- DIV3. Profesores que imparten TODOS los cursos del area Programacion
SELECT p.id_profesor, p.nombre FROM profesor p WHERE NOT EXISTS (SELECT 1 FROM curso c WHERE c.area='Programacion' AND NOT EXISTS (SELECT 1 FROM grupo g WHERE g.id_profesor=p.id_profesor AND g.id_curso=c.id_curso)) ORDER BY p.id_profesor;

-- DIV4. Estudiantes inscritos en TODOS los cursos de Matematicas
SELECT e.id_estudiante, e.nombre FROM estudiante e WHERE NOT EXISTS (SELECT 1 FROM curso c WHERE c.area='Matematicas' AND NOT EXISTS (SELECT 1 FROM inscripcion i JOIN grupo g ON i.id_grupo=g.id_grupo WHERE i.id_estudiante=e.id_estudiante AND g.id_curso=c.id_curso)) ORDER BY e.id_estudiante;

-- DIV5. Estudiantes con inscripcion en TODOS los cursos optativos de IA
SELECT e.id_estudiante, e.nombre FROM estudiante e WHERE NOT EXISTS (SELECT 1 FROM curso c WHERE c.area='IA' AND NOT EXISTS (SELECT 1 FROM inscripcion i JOIN grupo g ON i.id_grupo=g.id_grupo WHERE i.id_estudiante=e.id_estudiante AND g.id_curso=c.id_curso)) ORDER BY e.id_estudiante;
