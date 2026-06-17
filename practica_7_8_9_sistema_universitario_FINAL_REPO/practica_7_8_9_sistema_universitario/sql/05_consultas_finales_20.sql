-- 05_consultas_finales_20.sql
-- Ejecutar despues de 01_schema.sql y 02_data.sql

-- F1. Seleccion simple: estudiantes de ISC con promedio minimo de 8.5
SELECT nombre, semestre, promedio FROM estudiante WHERE id_carrera=1 AND promedio>=8.5 ORDER BY promedio DESC;

-- F2. Proyeccion con seleccion: correos de estudiantes sin tutor
SELECT nombre, correo FROM estudiante WHERE id_tutor IS NULL ORDER BY nombre;

-- F3. Union: personas academicas con correo institucional
SELECT nombre, correo FROM estudiante UNION SELECT nombre, correo FROM profesor ORDER BY nombre;

-- F4. Interseccion: departamentos que tienen carreras y profesores
SELECT id_departamento FROM carrera INTERSECT SELECT id_departamento FROM profesor ORDER BY id_departamento;

-- F5. Diferencia: estudiantes sin ninguna inscripcion
SELECT e.id_estudiante, e.nombre FROM estudiante e WHERE NOT EXISTS (SELECT 1 FROM inscripcion i WHERE i.id_estudiante=e.id_estudiante) ORDER BY e.id_estudiante;

-- F6. Join de dos tablas: estudiantes con carrera
SELECT e.nombre AS estudiante, c.nombre AS carrera FROM estudiante e JOIN carrera c ON e.id_carrera=c.id_carrera ORDER BY estudiante LIMIT 12;

-- F7. Join de tres o mas tablas: inscripciones con estudiante, grupo y curso
SELECT e.nombre AS estudiante, c.nombre AS curso, i.calificacion FROM estudiante e JOIN inscripcion i ON e.id_estudiante=i.id_estudiante JOIN grupo g ON i.id_grupo=g.id_grupo JOIN curso c ON g.id_curso=c.id_curso ORDER BY estudiante, curso LIMIT 12;

-- F8. Theta join: aulas cuya capacidad supera el cupo del grupo
SELECT a.clave, a.capacidad, g.id_grupo, g.cupo FROM aula a JOIN grupo g ON a.capacidad > g.cupo ORDER BY a.clave, g.id_grupo LIMIT 12;

-- F9. Outer join: todos los profesores aunque no tengan grupo
SELECT p.nombre AS profesor, g.id_grupo, g.periodo FROM profesor p LEFT JOIN grupo g ON p.id_profesor=g.id_profesor ORDER BY p.id_profesor, g.id_grupo LIMIT 12;

-- F10. Anti-join: profesores sin grupo asignado
SELECT p.id_profesor, p.nombre FROM profesor p WHERE NOT EXISTS (SELECT 1 FROM grupo g WHERE g.id_profesor=p.id_profesor) ORDER BY p.id_profesor;

-- F11. Agregacion: total de estudiantes por carrera
SELECT c.nombre AS carrera, COUNT(e.id_estudiante) AS total FROM carrera c LEFT JOIN estudiante e ON c.id_carrera=e.id_carrera GROUP BY c.nombre ORDER BY carrera;

-- F12. Agregacion: promedio de calificaciones por curso
SELECT c.nombre AS curso, ROUND(AVG(i.calificacion),2) AS promedio FROM curso c JOIN grupo g ON c.id_curso=g.id_curso JOIN inscripcion i ON i.id_grupo=g.id_grupo GROUP BY c.nombre ORDER BY promedio DESC;

-- F13. Agrupacion con HAVING: grupos con mas de cinco inscritos
SELECT id_grupo, COUNT(*) AS total FROM inscripcion GROUP BY id_grupo HAVING COUNT(*) > 5 ORDER BY total DESC, id_grupo;

-- F14. Multiples agregaciones: salario promedio, maximo y minimo por departamento
SELECT d.nombre AS departamento, ROUND(AVG(p.salario),2) AS salario_promedio, MAX(p.salario) AS salario_maximo, MIN(p.salario) AS salario_minimo FROM departamento d JOIN profesor p ON d.id_departamento=p.id_departamento GROUP BY d.nombre ORDER BY d.nombre;

-- F15. Agregacion sobre reunion: aprobados por periodo
SELECT g.periodo, COUNT(*) AS aprobados FROM grupo g JOIN inscripcion i ON g.id_grupo=i.id_grupo WHERE i.estado='Aprobado' GROUP BY g.periodo ORDER BY g.periodo;

-- F16. Division: estudiantes inscritos en todos los cursos obligatorios
SELECT e.id_estudiante, e.nombre FROM estudiante e WHERE NOT EXISTS (SELECT 1 FROM curso c WHERE c.tipo='Obligatorio' AND NOT EXISTS (SELECT 1 FROM inscripcion i JOIN grupo g ON i.id_grupo=g.id_grupo WHERE i.id_estudiante=e.id_estudiante AND g.id_curso=c.id_curso)) ORDER BY e.id_estudiante;

-- F17. Division: estudiantes inscritos en todos los cursos del area Base de Datos
SELECT e.id_estudiante, e.nombre FROM estudiante e WHERE NOT EXISTS (SELECT 1 FROM curso c WHERE c.area='Base de Datos' AND NOT EXISTS (SELECT 1 FROM inscripcion i JOIN grupo g ON i.id_grupo=g.id_grupo WHERE i.id_estudiante=e.id_estudiante AND g.id_curso=c.id_curso)) ORDER BY e.id_estudiante;

-- F18. Division: profesores que imparten todos los cursos de Programacion
SELECT p.id_profesor, p.nombre FROM profesor p WHERE NOT EXISTS (SELECT 1 FROM curso c WHERE c.area='Programacion' AND NOT EXISTS (SELECT 1 FROM grupo g WHERE g.id_profesor=p.id_profesor AND g.id_curso=c.id_curso)) ORDER BY p.id_profesor;

-- F19. Cuantificador universal: estudiantes que aprobaron todos sus cursos inscritos
SELECT e.nombre FROM estudiante e WHERE NOT EXISTS (SELECT 1 FROM inscripcion i WHERE i.id_estudiante=e.id_estudiante AND i.calificacion < 6) ORDER BY e.nombre;

-- F20. Cuantificador universal: carreras donde todos sus estudiantes tienen promedio minimo de 8
SELECT c.nombre FROM carrera c WHERE NOT EXISTS (SELECT 1 FROM estudiante e WHERE e.id_carrera=c.id_carrera AND e.promedio < 8) ORDER BY c.nombre;
