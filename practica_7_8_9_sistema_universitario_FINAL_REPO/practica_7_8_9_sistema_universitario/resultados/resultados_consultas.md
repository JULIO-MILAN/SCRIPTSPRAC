# Resultados de consultas principales

Las tablas siguientes se generaron con los datos de ejemplo del proyecto.

## Parte 1 - Seleccion

### S1 - Condicion simple con igualdad: estudiantes de la carrera ISC

```sql
SELECT id_estudiante, nombre, semestre, promedio FROM estudiante WHERE id_carrera = 1 ORDER BY id_estudiante;
```

| id_estudiante | nombre            | semestre | promedio |
| ------------- | ----------------- | -------- | -------- |
| 1             | Julio Milan       | 5        | 9.1      |
| 2             | Fernanda Lopez    | 6        | 8.8      |
| 3             | Diego Martinez    | 5        | 8.6      |
| 11            | Sebastian Morales | 3        | 8.3      |
| 17            | Bruno Salazar     | 8        | 6.9      |

### S2 - Condicion con desigualdad: cursos que no son optativos

```sql
SELECT id_curso, nombre, tipo FROM curso WHERE tipo <> 'Optativo' ORDER BY id_curso;
```

| id_curso | nombre                       | tipo        |
| -------- | ---------------------------- | ----------- |
| 1        | Bases de Datos               | Obligatorio |
| 2        | Algoritmos y Estructuras     | Obligatorio |
| 3        | Calculo Vectorial            | Obligatorio |
| 4        | Algebra Lineal               | Obligatorio |
| 5        | Redes de Computadoras        | Obligatorio |
| 6        | Sistemas Operativos          | Obligatorio |
| 13       | Arquitectura de Computadoras | Obligatorio |
| 15       | Etica Profesional            | Obligatorio |

### S3 - Comparacion: profesores con salario mayor a 40000

```sql
SELECT id_profesor, nombre, salario FROM profesor WHERE salario > 40000 ORDER BY salario DESC;
```

| id_profesor | nombre              | salario |
| ----------- | ------------------- | ------- |
| 12          | Dra. Valeria Soto   | 46000.0 |
| 7           | Dra. Elena Navarro  | 45000.0 |
| 3           | Dra. Sofia Aguilar  | 44000.0 |
| 5           | Dra. Maria Castillo | 43000.0 |
| 1           | Dra. Ana Torres     | 42000.0 |
| 9           | Dra. Paola Herrera  | 41000.0 |

### S4 - AND: estudiantes de semestre 5 o superior con promedio mayor a 8.5

```sql
SELECT id_estudiante, nombre, semestre, promedio FROM estudiante WHERE semestre >= 5 AND promedio > 8.5 ORDER BY promedio DESC;
```

| id_estudiante | nombre           | semestre | promedio |
| ------------- | ---------------- | -------- | -------- |
| 4             | Andrea Gomez     | 7        | 9.4      |
| 12            | Regina Ortega    | 5        | 9.2      |
| 1             | Julio Milan      | 5        | 9.1      |
| 10            | Valentina Castro | 7        | 8.9      |
| 2             | Fernanda Lopez   | 6        | 8.8      |
| 6             | Natalia Perez    | 6        | 8.7      |
| 3             | Diego Martinez   | 5        | 8.6      |

### S5 - OR: aulas teoricas o auditorios

```sql
SELECT id_aula, clave, tipo, capacidad FROM aula WHERE tipo = 'Teorica' OR tipo = 'Auditorio' ORDER BY id_aula;
```

| id_aula | clave | tipo      | capacidad |
| ------- | ----- | --------- | --------- |
| 3       | B201  | Teorica   | 45        |
| 4       | B202  | Teorica   | 50        |
| 9       | E501  | Auditorio | 60        |

### S6 - NOT: cursos que no pertenecen al area de Matematicas

```sql
SELECT id_curso, nombre, area FROM curso WHERE NOT (area = 'Matematicas') ORDER BY id_curso;
```

| id_curso | nombre                   | area          |
| -------- | ------------------------ | ------------- |
| 1        | Bases de Datos           | Base de Datos |
| 2        | Algoritmos y Estructuras | Programacion  |
| 5        | Redes de Computadoras    | Redes         |
| 6        | Sistemas Operativos      | Sistemas      |
| 7        | Inteligencia Artificial  | IA            |
| 8        | Aprendizaje Automatico   | IA            |
| 9        | Seguridad Web            | Seguridad     |
| 10       | Mineria de Datos         | Base de Datos |
| ... | 5 filas mas | |

### S7 - Condicion compuesta con parentesis

```sql
SELECT id_estudiante, nombre, edad, semestre, promedio FROM estudiante WHERE (semestre >= 6 AND promedio >= 8.5) OR (edad < 19 AND promedio >= 8) ORDER BY id_estudiante;
```

| id_estudiante | nombre           | edad | semestre | promedio |
| ------------- | ---------------- | ---- | -------- | -------- |
| 2             | Fernanda Lopez   | 21   | 6        | 8.8      |
| 4             | Andrea Gomez     | 22   | 7        | 9.4      |
| 6             | Natalia Perez    | 21   | 6        | 8.7      |
| 10            | Valentina Castro | 22   | 7        | 8.9      |
| 14            | Ximena Vargas    | 18   | 2        | 8.4      |
| 20            | Mariana Nunez    | 18   | 1        | 8.6      |

### S8 - LIKE: estudiantes cuyo nombre empieza con M o contiene ana en el correo

```sql
SELECT id_estudiante, nombre, correo FROM estudiante WHERE nombre LIKE 'M%' OR correo LIKE '%ana%' ORDER BY id_estudiante;
```

| id_estudiante | nombre          | correo                        |
| ------------- | --------------- | ----------------------------- |
| 9             | Mateo Hernandez | mateo.hernandez@alumno.ipn.mx |
| 20            | Mariana Nunez   | mariana.nunez@alumno.ipn.mx   |

### S9 - Valores NULL: estudiantes sin tutor asignado

```sql
SELECT id_estudiante, nombre, id_tutor FROM estudiante WHERE id_tutor IS NULL ORDER BY id_estudiante;
```

| id_estudiante | nombre         | id_tutor |
| ------------- | -------------- | -------- |
| 13            | Leonardo Reyes | NULL     |
| 14            | Ximena Vargas  | NULL     |
| 20            | Mariana Nunez  | NULL     |

### S10 - Rangos BETWEEN: estudiantes de 20 a 22 años

```sql
SELECT id_estudiante, nombre, edad FROM estudiante WHERE edad BETWEEN 20 AND 22 ORDER BY edad, nombre;
```

| id_estudiante | nombre         | edad |
| ------------- | -------------- | ---- |
| 8             | Camila Sanchez | 20   |
| 3             | Diego Martinez | 20   |
| 1             | Julio Milan    | 20   |
| 12            | Regina Ortega  | 20   |
| 16            | Renata Rojas   | 20   |
| 2             | Fernanda Lopez | 21   |
| 13            | Leonardo Reyes | 21   |
| 18            | Lucia Fuentes  | 21   |
| ... | 4 filas mas | |


## Parte 1 - Proyeccion

### P1 - Proyeccion de un solo atributo: nombres de carreras

```sql
SELECT DISTINCT nombre FROM carrera ORDER BY nombre;
```

| nombre                                 |
| -------------------------------------- |
| Ciencia de Datos                       |
| Ingenieria de Software                 |
| Ingenieria en Inteligencia Artificial  |
| Ingenieria en Sistemas Computacionales |
| Seguridad Informatica                  |

### P2 - Proyeccion de multiples atributos: nombre y correo de estudiantes

```sql
SELECT DISTINCT nombre, correo FROM estudiante ORDER BY nombre;
```

| nombre         | correo                       |
| -------------- | ---------------------------- |
| Andrea Gomez   | andrea.gomez@alumno.ipn.mx   |
| Bruno Salazar  | bruno.salazar@alumno.ipn.mx  |
| Camila Sanchez | camila.sanchez@alumno.ipn.mx |
| Diego Martinez | diego.martinez@alumno.ipn.mx |
| Emiliano Ruiz  | emiliano.ruiz@alumno.ipn.mx  |
| Fernanda Lopez | fernanda.lopez@alumno.ipn.mx |
| Ivan Campos    | ivan.campos@alumno.ipn.mx    |
| Julio Milan    | julio.milan@alumno.ipn.mx    |
| ... | 12 filas mas |

### P3 - Proyeccion con renombramiento

```sql
SELECT DISTINCT nombre AS nombre_estudiante, correo AS email FROM estudiante ORDER BY nombre_estudiante;
```

| nombre_estudiante | email                        |
| ----------------- | ---------------------------- |
| Andrea Gomez      | andrea.gomez@alumno.ipn.mx   |
| Bruno Salazar     | bruno.salazar@alumno.ipn.mx  |
| Camila Sanchez    | camila.sanchez@alumno.ipn.mx |
| Diego Martinez    | diego.martinez@alumno.ipn.mx |
| Emiliano Ruiz     | emiliano.ruiz@alumno.ipn.mx  |
| Fernanda Lopez    | fernanda.lopez@alumno.ipn.mx |
| Ivan Campos       | ivan.campos@alumno.ipn.mx    |
| Julio Milan       | julio.milan@alumno.ipn.mx    |
| ... | 12 filas mas |

### P4 - Proyeccion que genera duplicados y elimina repetidos: semestres existentes

```sql
SELECT DISTINCT semestre FROM estudiante ORDER BY semestre;
```

| semestre |
| -------- |
| 1        |
| 2        |
| 3        |
| 4        |
| 5        |
| 6        |
| 7        |
| 8        |

### P5 - Proyeccion con atributo calculado: promedio ajustado

```sql
SELECT nombre, promedio, ROUND(promedio + 0.10, 2) AS promedio_estimado FROM estudiante ORDER BY nombre LIMIT 10;
```

| nombre         | promedio | promedio_estimado |
| -------------- | -------- | ----------------- |
| Andrea Gomez   | 9.4      | 9.5               |
| Bruno Salazar  | 6.9      | 7.0               |
| Camila Sanchez | 9.0      | 9.1               |
| Diego Martinez | 8.6      | 8.7               |
| Emiliano Ruiz  | 7.9      | 8.0               |
| Fernanda Lopez | 8.8      | 8.9               |
| Ivan Campos    | 7.2      | 7.3               |
| Julio Milan    | 9.1      | 9.2               |
| ... | 2 filas mas | |

### P6 - Proyeccion de clave primaria

```sql
SELECT DISTINCT id_estudiante FROM estudiante ORDER BY id_estudiante;
```

| id_estudiante |
| ------------- |
| 1             |
| 2             |
| 3             |
| 4             |
| 5             |
| 6             |
| 7             |
| 8             |
| ... | 12 filas mas |

### P7 - Todos los atributos excepto tutor: vista academica del estudiante

```sql
SELECT id_estudiante,nombre,correo,edad,semestre,promedio,id_carrera FROM estudiante ORDER BY id_estudiante LIMIT 10;
```

| id_estudiante | nombre          | correo                        | edad | semestre | promedio | id_carrera |
| ------------- | --------------- | ----------------------------- | ---- | -------- | -------- | ---------- |
| 1             | Julio Milan     | julio.milan@alumno.ipn.mx     | 20   | 5        | 9.1      | 1          |
| 2             | Fernanda Lopez  | fernanda.lopez@alumno.ipn.mx  | 21   | 6        | 8.8      | 1          |
| 3             | Diego Martinez  | diego.martinez@alumno.ipn.mx  | 20   | 5        | 8.6      | 1          |
| 4             | Andrea Gomez    | andrea.gomez@alumno.ipn.mx    | 22   | 7        | 9.4      | 2          |
| 5             | Emiliano Ruiz   | emiliano.ruiz@alumno.ipn.mx   | 19   | 3        | 7.9      | 3          |
| 6             | Natalia Perez   | natalia.perez@alumno.ipn.mx   | 21   | 6        | 8.7      | 3          |
| 7             | Santiago Flores | santiago.flores@alumno.ipn.mx | 23   | 8        | 8.1      | 4          |
| 8             | Camila Sanchez  | camila.sanchez@alumno.ipn.mx  | 20   | 4        | 9.0      | 4          |
| ... | 2 filas mas | | | | | |

### P8 - Proyeccion combinada con seleccion

```sql
SELECT DISTINCT nombre, promedio FROM estudiante WHERE promedio >= 9 ORDER BY promedio DESC;
```

| nombre         | promedio |
| -------------- | -------- |
| Renata Rojas   | 9.5      |
| Andrea Gomez   | 9.4      |
| Regina Ortega  | 9.2      |
| Julio Milan    | 9.1      |
| Camila Sanchez | 9.0      |

### P9 - Atributos de diferentes tipos de datos

```sql
SELECT DISTINCT nombre, edad, promedio, correo FROM estudiante ORDER BY nombre LIMIT 10;
```

| nombre         | edad | promedio | correo                       |
| -------------- | ---- | -------- | ---------------------------- |
| Andrea Gomez   | 22   | 9.4      | andrea.gomez@alumno.ipn.mx   |
| Bruno Salazar  | 23   | 6.9      | bruno.salazar@alumno.ipn.mx  |
| Camila Sanchez | 20   | 9.0      | camila.sanchez@alumno.ipn.mx |
| Diego Martinez | 20   | 8.6      | diego.martinez@alumno.ipn.mx |
| Emiliano Ruiz  | 19   | 7.9      | emiliano.ruiz@alumno.ipn.mx  |
| Fernanda Lopez | 21   | 8.8      | fernanda.lopez@alumno.ipn.mx |
| Ivan Campos    | 19   | 7.2      | ivan.campos@alumno.ipn.mx    |
| Julio Milan    | 20   | 9.1      | julio.milan@alumno.ipn.mx    |
| ... | 2 filas mas | | |

### P10 - Proyeccion que resulta en relacion vacia

```sql
SELECT DISTINCT nombre FROM estudiante WHERE promedio > 10;
```

| nombre |
| ------ |


## Parte 1 - Conjuntos

### U1 - Union simple compatible: personas academicas con nombre y correo

```sql
SELECT nombre, correo FROM estudiante UNION SELECT nombre, correo FROM profesor ORDER BY nombre;
```

| nombre              | correo                       |
| ------------------- | ---------------------------- |
| Andrea Gomez        | andrea.gomez@alumno.ipn.mx   |
| Bruno Salazar       | bruno.salazar@alumno.ipn.mx  |
| Camila Sanchez      | camila.sanchez@alumno.ipn.mx |
| Diego Martinez      | diego.martinez@alumno.ipn.mx |
| Dra. Ana Torres     | ana.torres@ipn.mx            |
| Dra. Elena Navarro  | elena.navarro@ipn.mx         |
| Dra. Maria Castillo | maria.castillo@ipn.mx        |
| Dra. Paola Herrera  | paola.herrera@ipn.mx         |
| Dra. Sofia Aguilar  | sofia.aguilar@ipn.mx         |
| Dra. Valeria Soto   | valeria.soto@ipn.mx          |
| Emiliano Ruiz       | emiliano.ruiz@alumno.ipn.mx  |
| Fernanda Lopez      | fernanda.lopez@alumno.ipn.mx |
| ... | 20 filas mas |

### U2 - Union de selecciones: estudiantes destacados o de primer ciclo

```sql
SELECT id_estudiante,nombre FROM estudiante WHERE promedio >= 9 UNION SELECT id_estudiante,nombre FROM estudiante WHERE semestre <= 2 ORDER BY id_estudiante;
```

| id_estudiante | nombre          |
| ------------- | --------------- |
| 1             | Julio Milan     |
| 4             | Andrea Gomez    |
| 8             | Camila Sanchez  |
| 9             | Mateo Hernandez |
| 12            | Regina Ortega   |
| 14            | Ximena Vargas   |
| 16            | Renata Rojas    |
| 20            | Mariana Nunez   |

### U3 - Union de proyecciones: areas de cursos y nombres de departamentos

```sql
SELECT area AS concepto FROM curso UNION SELECT nombre AS concepto FROM departamento ORDER BY concepto;
```

| concepto                |
| ----------------------- |
| Base de Datos           |
| Computacion             |
| Gestion                 |
| Gestion Academica       |
| Hardware                |
| Humanidades             |
| IA                      |
| Inteligencia Artificial |
| ... | 5 filas mas |

### U4 - Union con relacion vacia

```sql
SELECT nombre FROM estudiante UNION SELECT nombre FROM estudiante WHERE promedio > 10 ORDER BY nombre;
```

| nombre         |
| -------------- |
| Andrea Gomez   |
| Bruno Salazar  |
| Camila Sanchez |
| Diego Martinez |
| Emiliano Ruiz  |
| Fernanda Lopez |
| Ivan Campos    |
| Julio Milan    |
| Leonardo Reyes |
| Lucia Fuentes  |
| ... | 10 filas mas |

### I1 - Interseccion simple: nombres que aparecen como estudiante y profesor

```sql
SELECT nombre FROM estudiante INTERSECT SELECT nombre FROM profesor ORDER BY nombre;
```

| nombre |
| ------ |

### I2 - Interseccion con condiciones: estudiantes ISC y promedio alto

```sql
SELECT id_estudiante FROM estudiante WHERE id_carrera=1 INTERSECT SELECT id_estudiante FROM estudiante WHERE promedio>=8.5 ORDER BY id_estudiante;
```

| id_estudiante |
| ------------- |
| 1             |
| 2             |
| 3             |

### I3 - Interseccion vacia: cursos obligatorios y optativos

```sql
SELECT id_curso FROM curso WHERE tipo='Obligatorio' INTERSECT SELECT id_curso FROM curso WHERE tipo='Optativo';
```

| id_curso |
| -------- |

### I4 - Interseccion de proyecciones: departamentos con carreras y profesores

```sql
SELECT id_departamento FROM carrera INTERSECT SELECT id_departamento FROM profesor ORDER BY id_departamento;
```

| id_departamento |
| --------------- |
| 1               |
| 3               |
| 4               |

### D1 - Diferencia simple: profesores sin supervisor

```sql
SELECT id_profesor FROM profesor EXCEPT SELECT id_profesor FROM profesor WHERE id_supervisor IS NOT NULL ORDER BY id_profesor;
```

| id_profesor |
| ----------- |
| 1           |
| 3           |
| 5           |

### D2 - Diferencia de selecciones: estudiantes no destacados

```sql
SELECT id_estudiante,nombre FROM estudiante EXCEPT SELECT id_estudiante,nombre FROM estudiante WHERE promedio>=9 ORDER BY id_estudiante;
```

| id_estudiante | nombre            |
| ------------- | ----------------- |
| 2             | Fernanda Lopez    |
| 3             | Diego Martinez    |
| 5             | Emiliano Ruiz     |
| 6             | Natalia Perez     |
| 7             | Santiago Flores   |
| 9             | Mateo Hernandez   |
| 10            | Valentina Castro  |
| 11            | Sebastian Morales |
| 13            | Leonardo Reyes    |
| 14            | Ximena Vargas     |
| 15            | Pablo Medina      |
| 17            | Bruno Salazar     |
| ... | 3 filas mas |

### D3 - Diferencia que elimina cursos con grupo

```sql
SELECT id_curso FROM curso EXCEPT SELECT id_curso FROM grupo ORDER BY id_curso;
```

| id_curso |
| -------- |

### D4 - Diferencia con relacion vacia

```sql
SELECT nombre FROM carrera EXCEPT SELECT nombre FROM carrera WHERE creditos_totales>400 ORDER BY nombre;
```

| nombre                                 |
| -------------------------------------- |
| Ciencia de Datos                       |
| Ingenieria de Software                 |
| Ingenieria en Inteligencia Artificial  |
| Ingenieria en Sistemas Computacionales |
| Seguridad Informatica                  |


## Parte 1 - Producto cartesiano

### X1 - Producto cartesiano simple de departamentos y carreras

```sql
SELECT d.nombre AS departamento, c.nombre AS carrera FROM departamento d CROSS JOIN carrera c ORDER BY departamento, carrera LIMIT 12;
```

| departamento      | carrera                                |
| ----------------- | -------------------------------------- |
| Computacion       | Ciencia de Datos                       |
| Computacion       | Ingenieria de Software                 |
| Computacion       | Ingenieria en Inteligencia Artificial  |
| Computacion       | Ingenieria en Sistemas Computacionales |
| Computacion       | Seguridad Informatica                  |
| Gestion Academica | Ciencia de Datos                       |
| Gestion Academica | Ingenieria de Software                 |
| Gestion Academica | Ingenieria en Inteligencia Artificial  |
| ... | 4 filas mas |

### X2 - Producto cartesiano seguido de seleccion simulando JOIN

```sql
SELECT d.nombre AS departamento, c.nombre AS carrera FROM departamento d CROSS JOIN carrera c WHERE d.id_departamento = c.id_departamento ORDER BY departamento;
```

| departamento            | carrera                                |
| ----------------------- | -------------------------------------- |
| Computacion             | Ingenieria en Sistemas Computacionales |
| Computacion             | Seguridad Informatica                  |
| Inteligencia Artificial | Ciencia de Datos                       |
| Inteligencia Artificial | Ingenieria en Inteligencia Artificial  |
| Sistemas                | Ingenieria de Software                 |

### X3 - Producto cartesiano de tres relaciones pequenas

```sql
SELECT d.nombre AS departamento, c.nombre AS carrera, a.clave AS aula FROM departamento d CROSS JOIN carrera c CROSS JOIN aula a LIMIT 12;
```

| departamento | carrera                                | aula |
| ------------ | -------------------------------------- | ---- |
| Computacion  | Ingenieria en Sistemas Computacionales | A101 |
| Computacion  | Ingenieria en Sistemas Computacionales | A102 |
| Computacion  | Ingenieria en Sistemas Computacionales | B201 |
| Computacion  | Ingenieria en Sistemas Computacionales | B202 |
| Computacion  | Ingenieria en Sistemas Computacionales | C301 |
| Computacion  | Ingenieria en Sistemas Computacionales | C302 |
| Computacion  | Ingenieria en Sistemas Computacionales | D401 |
| Computacion  | Ingenieria en Sistemas Computacionales | D402 |
| ... | 4 filas mas | |

### X4 - Producto cartesiano seguido de proyeccion

```sql
SELECT e.nombre AS estudiante, c.nombre AS curso FROM estudiante e CROSS JOIN curso c LIMIT 12;
```

| estudiante  | curso                    |
| ----------- | ------------------------ |
| Julio Milan | Bases de Datos           |
| Julio Milan | Algoritmos y Estructuras |
| Julio Milan | Calculo Vectorial        |
| Julio Milan | Algebra Lineal           |
| Julio Milan | Redes de Computadoras    |
| Julio Milan | Sistemas Operativos      |
| Julio Milan | Inteligencia Artificial  |
| Julio Milan | Aprendizaje Automatico   |
| ... | 4 filas mas |

### X5 - Producto cartesiano con renombramiento para evitar ambiguedad

```sql
SELECT e1.nombre AS estudiante_1, e2.nombre AS estudiante_2 FROM estudiante e1 CROSS JOIN estudiante e2 WHERE e1.id_estudiante < e2.id_estudiante LIMIT 12;
```

| estudiante_1 | estudiante_2    |
| ------------ | --------------- |
| Julio Milan  | Fernanda Lopez  |
| Julio Milan  | Diego Martinez  |
| Julio Milan  | Andrea Gomez    |
| Julio Milan  | Emiliano Ruiz   |
| Julio Milan  | Natalia Perez   |
| Julio Milan  | Santiago Flores |
| Julio Milan  | Camila Sanchez  |
| Julio Milan  | Mateo Hernandez |
| ... | 4 filas mas |


## Parte 2 - Reuniones

### JN1 - Reunion natural simple: carrera con departamento

```sql
SELECT c.nombre AS carrera, d.nombre AS departamento FROM carrera c JOIN departamento d USING(id_departamento) ORDER BY carrera;
```

| carrera                                | departamento            |
| -------------------------------------- | ----------------------- |
| Ciencia de Datos                       | Inteligencia Artificial |
| Ingenieria de Software                 | Sistemas                |
| Ingenieria en Inteligencia Artificial  | Inteligencia Artificial |
| Ingenieria en Sistemas Computacionales | Computacion             |
| Seguridad Informatica                  | Computacion             |

### JN2 - Reunion natural de tres tablas: estudiante, carrera y departamento

```sql
SELECT e.nombre AS estudiante, c.nombre AS carrera, d.nombre AS departamento FROM estudiante e JOIN carrera c USING(id_carrera) JOIN departamento d ON c.id_departamento=d.id_departamento ORDER BY estudiante LIMIT 12;
```

| estudiante     | carrera                                | departamento            |
| -------------- | -------------------------------------- | ----------------------- |
| Andrea Gomez   | Ingenieria en Inteligencia Artificial  | Inteligencia Artificial |
| Bruno Salazar  | Ingenieria en Sistemas Computacionales | Computacion             |
| Camila Sanchez | Ingenieria de Software                 | Sistemas                |
| Diego Martinez | Ingenieria en Sistemas Computacionales | Computacion             |
| Emiliano Ruiz  | Ciencia de Datos                       | Inteligencia Artificial |
| Fernanda Lopez | Ingenieria en Sistemas Computacionales | Computacion             |
| Ivan Campos    | Ingenieria de Software                 | Sistemas                |
| Julio Milan    | Ingenieria en Sistemas Computacionales | Computacion             |
| ... | 4 filas mas | |

### JN3 - Reunion natural con proyeccion

```sql
SELECT e.nombre AS estudiante, c.nombre AS carrera FROM estudiante e JOIN carrera c USING(id_carrera) ORDER BY e.nombre LIMIT 12;
```

| estudiante     | carrera                                |
| -------------- | -------------------------------------- |
| Andrea Gomez   | Ingenieria en Inteligencia Artificial  |
| Bruno Salazar  | Ingenieria en Sistemas Computacionales |
| Camila Sanchez | Ingenieria de Software                 |
| Diego Martinez | Ingenieria en Sistemas Computacionales |
| Emiliano Ruiz  | Ciencia de Datos                       |
| Fernanda Lopez | Ingenieria en Sistemas Computacionales |
| Ivan Campos    | Ingenieria de Software                 |
| Julio Milan    | Ingenieria en Sistemas Computacionales |
| ... | 4 filas mas |

### JT1 - Theta join de igualdad: grupos con curso correspondiente

```sql
SELECT g.id_grupo, c.nombre AS curso, g.periodo FROM grupo g JOIN curso c ON g.id_curso=c.id_curso ORDER BY g.id_grupo LIMIT 12;
```

| id_grupo | curso                    | periodo |
| -------- | ------------------------ | ------- |
| 1        | Bases de Datos           | 2026-2  |
| 2        | Algoritmos y Estructuras | 2026-2  |
| 3        | Calculo Vectorial        | 2026-2  |
| 4        | Algebra Lineal           | 2026-2  |
| 5        | Redes de Computadoras    | 2026-2  |
| 6        | Sistemas Operativos      | 2026-2  |
| 7        | Inteligencia Artificial  | 2026-2  |
| 8        | Aprendizaje Automatico   | 2026-2  |
| ... | 4 filas mas | |

### JT2 - Theta join con desigualdad: aulas con capacidad mayor que cupo del grupo

```sql
SELECT a.clave, a.capacidad, g.id_grupo, g.cupo FROM aula a JOIN grupo g ON a.capacidad > g.cupo ORDER BY a.id_aula, g.id_grupo LIMIT 12;
```

| clave | capacidad | id_grupo | cupo |
| ----- | --------- | -------- | ---- |
| A101  | 35        | 5        | 30   |
| A101  | 35        | 6        | 30   |
| A101  | 35        | 7        | 25   |
| A101  | 35        | 8        | 25   |
| A101  | 35        | 13       | 30   |
| A101  | 35        | 14       | 30   |
| A101  | 35        | 15       | 28   |
| A101  | 35        | 19       | 30   |
| ... | 4 filas mas | | |

### JT3 - Theta join compuesto: grupo en aula laboratorio con cupo suficiente

```sql
SELECT g.id_grupo, a.clave, a.tipo, a.capacidad, g.cupo FROM grupo g JOIN aula a ON g.id_aula=a.id_aula AND a.capacidad >= g.cupo AND a.tipo LIKE 'Laboratorio%' ORDER BY g.id_grupo;
```

| id_grupo | clave | tipo           | capacidad | cupo |
| -------- | ----- | -------------- | --------- | ---- |
| 1        | A101  | Laboratorio    | 35        | 35   |
| 2        | A102  | Laboratorio    | 40        | 35   |
| 5        | C301  | Laboratorio    | 30        | 30   |
| 6        | C302  | Laboratorio    | 32        | 30   |
| 7        | D401  | Laboratorio IA | 25        | 25   |
| 8        | D402  | Laboratorio IA | 30        | 25   |
| 9        | A101  | Laboratorio    | 35        | 35   |
| 10       | A102  | Laboratorio    | 40        | 35   |
| ... | 8 filas mas | | | |

### JO1 - Left outer join: todos los profesores y sus grupos si existen

```sql
SELECT p.nombre AS profesor, g.id_grupo, g.periodo FROM profesor p LEFT JOIN grupo g ON p.id_profesor=g.id_profesor ORDER BY p.id_profesor, g.id_grupo LIMIT 12;
```

| profesor           | id_grupo | periodo |
| ------------------ | -------- | ------- |
| Dra. Ana Torres    | 1        | 2026-2  |
| Dra. Ana Torres    | 2        | 2026-2  |
| Dra. Ana Torres    | 12       | 2026-2  |
| Dra. Ana Torres    | 18       | 2026-1  |
| Mtro. Luis Ramirez | 16       | 2026-1  |
| Dra. Sofia Aguilar | 7        | 2026-2  |
| Dra. Sofia Aguilar | 10       | 2026-2  |
| Mtro. Carlos Vega  | 3        | 2026-2  |
| ... | 4 filas mas | |

### JO2 - Right outer join: todos los grupos con profesor, equivalente mostrado como left desde grupo

```sql
SELECT g.id_grupo, c.nombre AS curso, p.nombre AS profesor FROM grupo g LEFT JOIN profesor p ON p.id_profesor=g.id_profesor JOIN curso c ON c.id_curso=g.id_curso ORDER BY g.id_grupo LIMIT 12;
```

| id_grupo | curso                    | profesor            |
| -------- | ------------------------ | ------------------- |
| 1        | Bases de Datos           | Dra. Ana Torres     |
| 2        | Algoritmos y Estructuras | Dra. Ana Torres     |
| 3        | Calculo Vectorial        | Mtro. Carlos Vega   |
| 4        | Algebra Lineal           | Dra. Paola Herrera  |
| 5        | Redes de Computadoras    | Dra. Maria Castillo |
| 6        | Sistemas Operativos      | Dra. Maria Castillo |
| 7        | Inteligencia Artificial  | Dra. Sofia Aguilar  |
| 8        | Aprendizaje Automatico   | Dra. Elena Navarro  |
| ... | 4 filas mas | |

### JO3 - Full outer join: cursos y grupos, conservando cursos sin grupo y grupos sin curso

```sql
SELECT c.nombre AS curso, g.id_grupo, g.periodo FROM curso c LEFT JOIN grupo g ON c.id_curso=g.id_curso UNION SELECT c.nombre AS curso, g.id_grupo, g.periodo FROM grupo g LEFT JOIN curso c ON c.id_curso=g.id_curso ORDER BY curso, id_grupo LIMIT 12;
```

| curso                        | id_grupo | periodo |
| ---------------------------- | -------- | ------- |
| Administracion de Proyectos  | 11       | 2026-2  |
| Algebra Lineal               | 4        | 2026-2  |
| Algoritmos y Estructuras     | 2        | 2026-2  |
| Algoritmos y Estructuras     | 17       | 2026-1  |
| Aprendizaje Automatico       | 8        | 2026-2  |
| Aprendizaje Automatico       | 20       | 2026-2  |
| Arquitectura de Computadoras | 13       | 2026-2  |
| Bases de Datos               | 1        | 2026-2  |
| ... | 4 filas mas | |

### JS1 - Semi-join: estudiantes que tienen inscripciones

```sql
SELECT DISTINCT e.id_estudiante, e.nombre FROM estudiante e WHERE EXISTS (SELECT 1 FROM inscripcion i WHERE i.id_estudiante=e.id_estudiante) ORDER BY e.id_estudiante;
```

| id_estudiante | nombre            |
| ------------- | ----------------- |
| 1             | Julio Milan       |
| 2             | Fernanda Lopez    |
| 3             | Diego Martinez    |
| 4             | Andrea Gomez      |
| 5             | Emiliano Ruiz     |
| 6             | Natalia Perez     |
| 7             | Santiago Flores   |
| 8             | Camila Sanchez    |
| 9             | Mateo Hernandez   |
| 10            | Valentina Castro  |
| 11            | Sebastian Morales |
| 12            | Regina Ortega     |
| ... | 8 filas mas |

### JA1 - Anti-join: estudiantes sin inscripciones

```sql
SELECT e.id_estudiante, e.nombre FROM estudiante e WHERE NOT EXISTS (SELECT 1 FROM inscripcion i WHERE i.id_estudiante=e.id_estudiante) ORDER BY e.id_estudiante;
```

| id_estudiante | nombre |
| ------------- | ------ |

### JS2 - Semi-join combinado: carreras con estudiantes inscritos

```sql
SELECT DISTINCT c.id_carrera, c.nombre FROM carrera c WHERE EXISTS (SELECT 1 FROM estudiante e JOIN inscripcion i ON e.id_estudiante=i.id_estudiante WHERE e.id_carrera=c.id_carrera) ORDER BY c.id_carrera;
```

| id_carrera | nombre                                 |
| ---------- | -------------------------------------- |
| 1          | Ingenieria en Sistemas Computacionales |
| 2          | Ingenieria en Inteligencia Artificial  |
| 3          | Ciencia de Datos                       |
| 4          | Ingenieria de Software                 |
| 5          | Seguridad Informatica                  |

### SELF1 - Auto-reunion: pares de estudiantes de la misma carrera

```sql
SELECT e1.nombre AS estudiante_1, e2.nombre AS estudiante_2, e1.id_carrera FROM estudiante e1 JOIN estudiante e2 ON e1.id_carrera=e2.id_carrera AND e1.id_estudiante<e2.id_estudiante ORDER BY e1.id_carrera LIMIT 12;
```

| estudiante_1   | estudiante_2      | id_carrera |
| -------------- | ----------------- | ---------- |
| Julio Milan    | Bruno Salazar     | 1          |
| Julio Milan    | Diego Martinez    | 1          |
| Julio Milan    | Fernanda Lopez    | 1          |
| Julio Milan    | Sebastian Morales | 1          |
| Fernanda Lopez | Bruno Salazar     | 1          |
| Fernanda Lopez | Diego Martinez    | 1          |
| Fernanda Lopez | Sebastian Morales | 1          |
| Diego Martinez | Bruno Salazar     | 1          |
| ... | 4 filas mas | |

### SELF2 - Auto-reunion jerarquica: profesor y supervisor

```sql
SELECT p.nombre AS profesor, s.nombre AS supervisor FROM profesor p JOIN profesor s ON p.id_supervisor=s.id_profesor ORDER BY supervisor, profesor;
```

| profesor           | supervisor          |
| ------------------ | ------------------- |
| Mtro. Carlos Vega  | Dra. Ana Torres     |
| Mtro. Jorge Pineda | Dra. Ana Torres     |
| Mtro. Luis Ramirez | Dra. Ana Torres     |
| Ing. Roberto Diaz  | Dra. Maria Castillo |
| Mtro. Daniel Cruz  | Dra. Maria Castillo |
| Dra. Elena Navarro | Dra. Sofia Aguilar  |
| Dra. Valeria Soto  | Dra. Sofia Aguilar  |
| Dra. Paola Herrera | Mtro. Carlos Vega   |
| ... | 1 filas mas |

### SELF3 - Auto-reunion por caracteristicas similares: profesores del mismo departamento

```sql
SELECT p1.nombre AS profesor_1, p2.nombre AS profesor_2, p1.id_departamento FROM profesor p1 JOIN profesor p2 ON p1.id_departamento=p2.id_departamento AND p1.id_profesor<p2.id_profesor ORDER BY p1.id_departamento LIMIT 12;
```

| profesor_1          | profesor_2         | id_departamento |
| ------------------- | ------------------ | --------------- |
| Dra. Ana Torres     | Ing. Ricardo Mora  | 1               |
| Dra. Ana Torres     | Mtro. Jorge Pineda | 1               |
| Dra. Ana Torres     | Mtro. Luis Ramirez | 1               |
| Mtro. Luis Ramirez  | Ing. Ricardo Mora  | 1               |
| Mtro. Luis Ramirez  | Mtro. Jorge Pineda | 1               |
| Mtro. Jorge Pineda  | Ing. Ricardo Mora  | 1               |
| Mtro. Carlos Vega   | Dra. Paola Herrera | 2               |
| Dra. Maria Castillo | Ing. Roberto Diaz  | 3               |
| ... | 3 filas mas | |


## Parte 2 - Agregacion

### A1 - COUNT de todas las tuplas: total de estudiantes

```sql
SELECT COUNT(*) AS total_estudiantes FROM estudiante;
```

| total_estudiantes |
| ----------------- |
| 20                |

### A2 - COUNT de valores distintos: carreras con estudiantes

```sql
SELECT COUNT(DISTINCT id_carrera) AS carreras_con_estudiantes FROM estudiante;
```

| carreras_con_estudiantes |
| ------------------------ |
| 5                        |

### A3 - SUM de columna numerica: cupo total de grupos

```sql
SELECT SUM(cupo) AS cupo_total FROM grupo;
```

| cupo_total |
| ---------- |
| 663        |

### A4 - AVG de columna numerica: promedio general academico

```sql
SELECT ROUND(AVG(promedio),2) AS promedio_general FROM estudiante;
```

| promedio_general |
| ---------------- |
| 8.4              |

### A5 - MAX de columna numerica: salario maximo docente

```sql
SELECT MAX(salario) AS salario_maximo FROM profesor;
```

| salario_maximo |
| -------------- |
| 46000.0        |

### A6 - MIN de columna numerica: calificacion minima

```sql
SELECT MIN(calificacion) AS calificacion_minima FROM inscripcion;
```

| calificacion_minima |
| ------------------- |
| 5.7                 |

### A7 - Multiples funciones agregadas

```sql
SELECT COUNT(*) AS n, ROUND(AVG(promedio),2) AS promedio, MAX(promedio) AS maximo, MIN(promedio) AS minimo FROM estudiante;
```

| n  | promedio | maximo | minimo |
| -- | -------- | ------ | ------ |
| 20 | 8.4      | 9.5    | 6.9    |

### A8 - Agregacion con seleccion previa

```sql
SELECT ROUND(AVG(promedio),2) AS promedio_isc FROM estudiante WHERE id_carrera=1;
```

| promedio_isc |
| ------------ |
| 8.34         |

### A9 - Agregacion con condicion de resultado

```sql
SELECT id_carrera, COUNT(*) AS total FROM estudiante GROUP BY id_carrera HAVING COUNT(*) > 3 ORDER BY id_carrera;
```

| id_carrera | total |
| ---------- | ----- |
| 1          | 5     |
| 2          | 4     |
| 3          | 4     |
| 4          | 4     |

### A10 - Agregacion sobre resultado de reunion

```sql
SELECT ROUND(AVG(i.calificacion),2) AS promedio_calificaciones FROM estudiante e JOIN inscripcion i ON e.id_estudiante=i.id_estudiante;
```

| promedio_calificaciones |
| ----------------------- |
| 7.95                    |


## Parte 2 - Agrupacion

### G1 - Agrupacion simple con COUNT: estudiantes por carrera

```sql
SELECT c.nombre AS carrera, COUNT(e.id_estudiante) AS total FROM carrera c LEFT JOIN estudiante e ON c.id_carrera=e.id_carrera GROUP BY c.id_carrera,c.nombre ORDER BY c.id_carrera;
```

| carrera                                | total |
| -------------------------------------- | ----- |
| Ingenieria en Sistemas Computacionales | 5     |
| Ingenieria en Inteligencia Artificial  | 4     |
| Ciencia de Datos                       | 4     |
| Ingenieria de Software                 | 4     |
| Seguridad Informatica                  | 3     |

### G2 - Agrupacion con SUM: creditos por area

```sql
SELECT area, SUM(creditos) AS creditos_area FROM curso GROUP BY area ORDER BY area;
```

| area          | creditos_area |
| ------------- | ------------- |
| Base de Datos | 14            |
| Gestion       | 5             |
| Hardware      | 7             |
| Humanidades   | 4             |
| IA            | 16            |
| Matematicas   | 14            |
| Programacion  | 14            |
| Redes         | 8             |
| ... | 2 filas mas |

### G3 - Agrupacion con AVG: promedio por carrera

```sql
SELECT c.nombre AS carrera, ROUND(AVG(e.promedio),2) AS promedio_carrera FROM estudiante e JOIN carrera c ON e.id_carrera=c.id_carrera GROUP BY c.nombre ORDER BY promedio_carrera DESC;
```

| carrera                                | promedio_carrera |
| -------------------------------------- | ---------------- |
| Ingenieria en Inteligencia Artificial  | 9.18             |
| Ingenieria en Sistemas Computacionales | 8.34             |
| Ingenieria de Software                 | 8.18             |
| Ciencia de Datos                       | 8.15             |
| Seguridad Informatica                  | 8.13             |

### G4 - Agrupacion con MAX/MIN: calificaciones por grupo

```sql
SELECT id_grupo, MAX(calificacion) AS max_calif, MIN(calificacion) AS min_calif FROM inscripcion GROUP BY id_grupo ORDER BY id_grupo LIMIT 12;
```

| id_grupo | max_calif | min_calif |
| -------- | --------- | --------- |
| 1        | 9.4       | 6.5       |
| 2        | 9.0       | 6.5       |
| 3        | 8.9       | 5.7       |
| 4        | 8.9       | 6.8       |
| 5        | 8.9       | 7.9       |
| 6        | 9.1       | 6.5       |
| 7        | 9.0       | 8.2       |
| 8        | 8.5       | 7.9       |
| ... | 4 filas mas | |

### G5 - Agrupacion por multiples atributos: cursos por tipo y area

```sql
SELECT tipo, area, COUNT(*) AS total FROM curso GROUP BY tipo, area ORDER BY tipo, area;
```

| tipo        | area          | total |
| ----------- | ------------- | ----- |
| Obligatorio | Base de Datos | 1     |
| Obligatorio | Hardware      | 1     |
| Obligatorio | Humanidades   | 1     |
| Obligatorio | Matematicas   | 2     |
| Obligatorio | Programacion  | 1     |
| Obligatorio | Redes         | 1     |
| Obligatorio | Sistemas      | 1     |
| Optativo    | Base de Datos | 1     |
| ... | 4 filas mas | |

### G6 - Agrupacion con seleccion previa: inscritos aprobados por grupo

```sql
SELECT id_grupo, COUNT(*) AS aprobados FROM inscripcion WHERE estado='Aprobado' GROUP BY id_grupo ORDER BY id_grupo LIMIT 12;
```

| id_grupo | aprobados |
| -------- | --------- |
| 1        | 14        |
| 2        | 13        |
| 3        | 8         |
| 4        | 8         |
| 5        | 6         |
| 6        | 6         |
| 7        | 6         |
| 8        | 5         |
| ... | 4 filas mas |

### G7 - Agrupacion con condicion posterior HAVING

```sql
SELECT id_grupo, COUNT(*) AS total FROM inscripcion GROUP BY id_grupo HAVING COUNT(*) > 5 ORDER BY total DESC, id_grupo;
```

| id_grupo | total |
| -------- | ----- |
| 1        | 14    |
| 2        | 13    |
| 3        | 10    |
| 10       | 9     |
| 4        | 8     |
| 5        | 6     |
| 6        | 6     |
| 7        | 6     |
| ... | 1 filas mas |

### G8 - Agrupacion sobre reunion: inscritos por curso

```sql
SELECT c.nombre AS curso, COUNT(i.id_inscripcion) AS inscritos FROM curso c JOIN grupo g ON c.id_curso=g.id_curso JOIN inscripcion i ON g.id_grupo=i.id_grupo GROUP BY c.nombre ORDER BY inscritos DESC, curso LIMIT 12;
```

| curso                    | inscritos |
| ------------------------ | --------- |
| Bases de Datos           | 16        |
| Algoritmos y Estructuras | 15        |
| Calculo Vectorial        | 10        |
| Mineria de Datos         | 9         |
| Algebra Lineal           | 8         |
| Programacion Web         | 7         |
| Redes de Computadoras    | 7         |
| Inteligencia Artificial  | 6         |
| ... | 4 filas mas |

### G9 - Multiples funciones agrupadas: estadisticas por carrera

```sql
SELECT c.nombre AS carrera, COUNT(*) AS total, ROUND(AVG(e.promedio),2) AS promedio, MAX(e.promedio) AS maximo FROM estudiante e JOIN carrera c ON e.id_carrera=c.id_carrera GROUP BY c.nombre ORDER BY carrera;
```

| carrera                                | total | promedio | maximo |
| -------------------------------------- | ----- | -------- | ------ |
| Ciencia de Datos                       | 4     | 8.15     | 8.7    |
| Ingenieria de Software                 | 4     | 8.18     | 9.0    |
| Ingenieria en Inteligencia Artificial  | 4     | 9.18     | 9.5    |
| Ingenieria en Sistemas Computacionales | 5     | 8.34     | 9.1    |
| Seguridad Informatica                  | 3     | 8.13     | 8.9    |

### G10 - Agrupacion anidada: promedio de promedios por departamento

```sql
SELECT departamento, ROUND(AVG(promedio_carrera),2) AS promedio_de_promedios FROM (SELECT d.nombre AS departamento, c.nombre AS carrera, AVG(e.promedio) AS promedio_carrera FROM estudiante e JOIN carrera c ON e.id_carrera=c.id_carrera JOIN departamento d ON c.id_departamento=d.id_departamento GROUP BY d.nombre, c.nombre) x GROUP BY departamento ORDER BY departamento;
```

| departamento            | promedio_de_promedios |
| ----------------------- | --------------------- |
| Computacion             | 8.24                  |
| Inteligencia Artificial | 8.66                  |
| Sistemas                | 8.18                  |


## Parte 2 - Division

### DIV1 - Estudiantes inscritos en TODOS los cursos obligatorios

```sql
SELECT e.id_estudiante, e.nombre FROM estudiante e WHERE NOT EXISTS (SELECT 1 FROM curso c WHERE c.tipo='Obligatorio' AND NOT EXISTS (SELECT 1 FROM inscripcion i JOIN grupo g ON i.id_grupo=g.id_grupo WHERE i.id_estudiante=e.id_estudiante AND g.id_curso=c.id_curso)) ORDER BY e.id_estudiante;
```

| id_estudiante | nombre |
| ------------- | ------ |

### DIV2 - Estudiantes inscritos en TODOS los cursos del area Base de Datos

```sql
SELECT e.id_estudiante, e.nombre FROM estudiante e WHERE NOT EXISTS (SELECT 1 FROM curso c WHERE c.area='Base de Datos' AND NOT EXISTS (SELECT 1 FROM inscripcion i JOIN grupo g ON i.id_grupo=g.id_grupo WHERE i.id_estudiante=e.id_estudiante AND g.id_curso=c.id_curso)) ORDER BY e.id_estudiante;
```

| id_estudiante | nombre         |
| ------------- | -------------- |
| 1             | Julio Milan    |
| 2             | Fernanda Lopez |
| 3             | Diego Martinez |
| 4             | Andrea Gomez   |
| 6             | Natalia Perez  |
| 12            | Regina Ortega  |
| 16            | Renata Rojas   |
| 18            | Lucia Fuentes  |

### DIV3 - Profesores que imparten TODOS los cursos del area Programacion

```sql
SELECT p.id_profesor, p.nombre FROM profesor p WHERE NOT EXISTS (SELECT 1 FROM curso c WHERE c.area='Programacion' AND NOT EXISTS (SELECT 1 FROM grupo g WHERE g.id_profesor=p.id_profesor AND g.id_curso=c.id_curso)) ORDER BY p.id_profesor;
```

| id_profesor | nombre          |
| ----------- | --------------- |
| 1           | Dra. Ana Torres |

### DIV4 - Estudiantes inscritos en TODOS los cursos de Matematicas

```sql
SELECT e.id_estudiante, e.nombre FROM estudiante e WHERE NOT EXISTS (SELECT 1 FROM curso c WHERE c.area='Matematicas' AND NOT EXISTS (SELECT 1 FROM inscripcion i JOIN grupo g ON i.id_grupo=g.id_grupo WHERE i.id_estudiante=e.id_estudiante AND g.id_curso=c.id_curso)) ORDER BY e.id_estudiante;
```

| id_estudiante | nombre          |
| ------------- | --------------- |
| 1             | Julio Milan     |
| 2             | Fernanda Lopez  |
| 3             | Diego Martinez  |
| 8             | Camila Sanchez  |
| 9             | Mateo Hernandez |
| 13            | Leonardo Reyes  |
| 19            | Ivan Campos     |

### DIV5 - Estudiantes con inscripcion en TODOS los cursos optativos de IA

```sql
SELECT e.id_estudiante, e.nombre FROM estudiante e WHERE NOT EXISTS (SELECT 1 FROM curso c WHERE c.area='IA' AND NOT EXISTS (SELECT 1 FROM inscripcion i JOIN grupo g ON i.id_grupo=g.id_grupo WHERE i.id_estudiante=e.id_estudiante AND g.id_curso=c.id_curso)) ORDER BY e.id_estudiante;
```

| id_estudiante | nombre        |
| ------------- | ------------- |
| 4             | Andrea Gomez  |
| 6             | Natalia Perez |
| 12            | Regina Ortega |
| 16            | Renata Rojas  |
| 20            | Mariana Nunez |


## Caso integrador - 20 consultas finales

### F1 - Seleccion simple: estudiantes de ISC con promedio minimo de 8.5

```sql
SELECT nombre, semestre, promedio FROM estudiante WHERE id_carrera=1 AND promedio>=8.5 ORDER BY promedio DESC;
```

| nombre         | semestre | promedio |
| -------------- | -------- | -------- |
| Julio Milan    | 5        | 9.1      |
| Fernanda Lopez | 6        | 8.8      |
| Diego Martinez | 5        | 8.6      |

### F2 - Proyeccion con seleccion: correos de estudiantes sin tutor

```sql
SELECT nombre, correo FROM estudiante WHERE id_tutor IS NULL ORDER BY nombre;
```

| nombre         | correo                       |
| -------------- | ---------------------------- |
| Leonardo Reyes | leonardo.reyes@alumno.ipn.mx |
| Mariana Nunez  | mariana.nunez@alumno.ipn.mx  |
| Ximena Vargas  | ximena.vargas@alumno.ipn.mx  |

### F3 - Union: personas academicas con correo institucional

```sql
SELECT nombre, correo FROM estudiante UNION SELECT nombre, correo FROM profesor ORDER BY nombre;
```

| nombre              | correo                       |
| ------------------- | ---------------------------- |
| Andrea Gomez        | andrea.gomez@alumno.ipn.mx   |
| Bruno Salazar       | bruno.salazar@alumno.ipn.mx  |
| Camila Sanchez      | camila.sanchez@alumno.ipn.mx |
| Diego Martinez      | diego.martinez@alumno.ipn.mx |
| Dra. Ana Torres     | ana.torres@ipn.mx            |
| Dra. Elena Navarro  | elena.navarro@ipn.mx         |
| Dra. Maria Castillo | maria.castillo@ipn.mx        |
| Dra. Paola Herrera  | paola.herrera@ipn.mx         |
| Dra. Sofia Aguilar  | sofia.aguilar@ipn.mx         |
| Dra. Valeria Soto   | valeria.soto@ipn.mx          |
| ... | 22 filas mas |

### F4 - Interseccion: departamentos que tienen carreras y profesores

```sql
SELECT id_departamento FROM carrera INTERSECT SELECT id_departamento FROM profesor ORDER BY id_departamento;
```

| id_departamento |
| --------------- |
| 1               |
| 3               |
| 4               |

### F5 - Diferencia: estudiantes sin ninguna inscripcion

```sql
SELECT e.id_estudiante, e.nombre FROM estudiante e WHERE NOT EXISTS (SELECT 1 FROM inscripcion i WHERE i.id_estudiante=e.id_estudiante) ORDER BY e.id_estudiante;
```

| id_estudiante | nombre |
| ------------- | ------ |

### F6 - Join de dos tablas: estudiantes con carrera

```sql
SELECT e.nombre AS estudiante, c.nombre AS carrera FROM estudiante e JOIN carrera c ON e.id_carrera=c.id_carrera ORDER BY estudiante LIMIT 12;
```

| estudiante     | carrera                                |
| -------------- | -------------------------------------- |
| Andrea Gomez   | Ingenieria en Inteligencia Artificial  |
| Bruno Salazar  | Ingenieria en Sistemas Computacionales |
| Camila Sanchez | Ingenieria de Software                 |
| Diego Martinez | Ingenieria en Sistemas Computacionales |
| Emiliano Ruiz  | Ciencia de Datos                       |
| Fernanda Lopez | Ingenieria en Sistemas Computacionales |
| Ivan Campos    | Ingenieria de Software                 |
| Julio Milan    | Ingenieria en Sistemas Computacionales |
| Leonardo Reyes | Ciencia de Datos                       |
| Lucia Fuentes  | Ciencia de Datos                       |
| ... | 2 filas mas |

### F7 - Join de tres o mas tablas: inscripciones con estudiante, grupo y curso

```sql
SELECT e.nombre AS estudiante, c.nombre AS curso, i.calificacion FROM estudiante e JOIN inscripcion i ON e.id_estudiante=i.id_estudiante JOIN grupo g ON i.id_grupo=g.id_grupo JOIN curso c ON g.id_curso=c.id_curso ORDER BY estudiante, curso LIMIT 12;
```

| estudiante     | curso                    | calificacion |
| -------------- | ------------------------ | ------------ |
| Andrea Gomez   | Algoritmos y Estructuras | 8.6          |
| Andrea Gomez   | Aprendizaje Automatico   | 8.5          |
| Andrea Gomez   | Bases de Datos           | 8.2          |
| Andrea Gomez   | Calculo Vectorial        | 8.9          |
| Andrea Gomez   | Inteligencia Artificial  | 8.2          |
| Andrea Gomez   | Mineria de Datos         | 8.6          |
| Bruno Salazar  | Algoritmos y Estructuras | 7.5          |
| Bruno Salazar  | Bases de Datos           | 7.2          |
| Bruno Salazar  | Calculo Vectorial        | 5.7          |
| Camila Sanchez | Algebra Lineal           | 7.9          |
| ... | 2 filas mas | |

### F8 - Theta join: aulas cuya capacidad supera el cupo del grupo

```sql
SELECT a.clave, a.capacidad, g.id_grupo, g.cupo FROM aula a JOIN grupo g ON a.capacidad > g.cupo ORDER BY a.clave, g.id_grupo LIMIT 12;
```

| clave | capacidad | id_grupo | cupo |
| ----- | --------- | -------- | ---- |
| A101  | 35        | 5        | 30   |
| A101  | 35        | 6        | 30   |
| A101  | 35        | 7        | 25   |
| A101  | 35        | 8        | 25   |
| A101  | 35        | 13       | 30   |
| A101  | 35        | 14       | 30   |
| A101  | 35        | 15       | 28   |
| A101  | 35        | 19       | 30   |
| A101  | 35        | 20       | 25   |
| A102  | 40        | 1        | 35   |
| ... | 2 filas mas | | |

### F9 - Outer join: todos los profesores aunque no tengan grupo

```sql
SELECT p.nombre AS profesor, g.id_grupo, g.periodo FROM profesor p LEFT JOIN grupo g ON p.id_profesor=g.id_profesor ORDER BY p.id_profesor, g.id_grupo LIMIT 12;
```

| profesor            | id_grupo | periodo |
| ------------------- | -------- | ------- |
| Dra. Ana Torres     | 1        | 2026-2  |
| Dra. Ana Torres     | 2        | 2026-2  |
| Dra. Ana Torres     | 12       | 2026-2  |
| Dra. Ana Torres     | 18       | 2026-1  |
| Mtro. Luis Ramirez  | 16       | 2026-1  |
| Dra. Sofia Aguilar  | 7        | 2026-2  |
| Dra. Sofia Aguilar  | 10       | 2026-2  |
| Mtro. Carlos Vega   | 3        | 2026-2  |
| Dra. Maria Castillo | 5        | 2026-2  |
| Dra. Maria Castillo | 6        | 2026-2  |
| ... | 2 filas mas | |

### F10 - Anti-join: profesores sin grupo asignado

```sql
SELECT p.id_profesor, p.nombre FROM profesor p WHERE NOT EXISTS (SELECT 1 FROM grupo g WHERE g.id_profesor=p.id_profesor) ORDER BY p.id_profesor;
```

| id_profesor | nombre |
| ----------- | ------ |

### F11 - Agregacion: total de estudiantes por carrera

```sql
SELECT c.nombre AS carrera, COUNT(e.id_estudiante) AS total FROM carrera c LEFT JOIN estudiante e ON c.id_carrera=e.id_carrera GROUP BY c.nombre ORDER BY carrera;
```

| carrera                                | total |
| -------------------------------------- | ----- |
| Ciencia de Datos                       | 4     |
| Ingenieria de Software                 | 4     |
| Ingenieria en Inteligencia Artificial  | 4     |
| Ingenieria en Sistemas Computacionales | 5     |
| Seguridad Informatica                  | 3     |

### F12 - Agregacion: promedio de calificaciones por curso

```sql
SELECT c.nombre AS curso, ROUND(AVG(i.calificacion),2) AS promedio FROM curso c JOIN grupo g ON c.id_curso=g.id_curso JOIN inscripcion i ON i.id_grupo=g.id_grupo GROUP BY c.nombre ORDER BY promedio DESC;
```

| curso                    | promedio |
| ------------------------ | -------- |
| Mineria de Datos         | 8.6      |
| Inteligencia Artificial  | 8.33     |
| Redes de Computadoras    | 8.24     |
| Aprendizaje Automatico   | 8.18     |
| Sistemas Operativos      | 8.15     |
| Programacion Web         | 8.1      |
| Bases de Datos           | 7.99     |
| Algebra Lineal           | 7.97     |
| Algoritmos y Estructuras | 7.86     |
| Calculo Vectorial        | 7.58     |
| ... | 5 filas mas |

### F13 - Agrupacion con HAVING: grupos con mas de cinco inscritos

```sql
SELECT id_grupo, COUNT(*) AS total FROM inscripcion GROUP BY id_grupo HAVING COUNT(*) > 5 ORDER BY total DESC, id_grupo;
```

| id_grupo | total |
| -------- | ----- |
| 1        | 14    |
| 2        | 13    |
| 3        | 10    |
| 10       | 9     |
| 4        | 8     |
| 5        | 6     |
| 6        | 6     |
| 7        | 6     |
| 12       | 6     |

### F14 - Multiples agregaciones: salario promedio, maximo y minimo por departamento

```sql
SELECT d.nombre AS departamento, ROUND(AVG(p.salario),2) AS salario_promedio, MAX(p.salario) AS salario_maximo, MIN(p.salario) AS salario_minimo FROM departamento d JOIN profesor p ON d.id_departamento=p.id_departamento GROUP BY d.nombre ORDER BY d.nombre;
```

| departamento            | salario_promedio | salario_maximo | salario_minimo |
| ----------------------- | ---------------- | -------------- | -------------- |
| Computacion             | 35375.0          | 42000.0        | 28000.0        |
| Gestion Academica       | 33500.0          | 33500.0        | 33500.0        |
| Inteligencia Artificial | 45000.0          | 46000.0        | 44000.0        |
| Matematicas             | 37500.0          | 41000.0        | 34000.0        |
| Sistemas                | 36000.0          | 43000.0        | 29000.0        |

### F15 - Agregacion sobre reunion: aprobados por periodo

```sql
SELECT g.periodo, COUNT(*) AS aprobados FROM grupo g JOIN inscripcion i ON g.id_grupo=i.id_grupo WHERE i.estado='Aprobado' GROUP BY g.periodo ORDER BY g.periodo;
```

| periodo | aprobados |
| ------- | --------- |
| 2026-1  | 6         |
| 2026-2  | 94        |

### F16 - Division: estudiantes inscritos en todos los cursos obligatorios

```sql
SELECT e.id_estudiante, e.nombre FROM estudiante e WHERE NOT EXISTS (SELECT 1 FROM curso c WHERE c.tipo='Obligatorio' AND NOT EXISTS (SELECT 1 FROM inscripcion i JOIN grupo g ON i.id_grupo=g.id_grupo WHERE i.id_estudiante=e.id_estudiante AND g.id_curso=c.id_curso)) ORDER BY e.id_estudiante;
```

| id_estudiante | nombre |
| ------------- | ------ |

### F17 - Division: estudiantes inscritos en todos los cursos del area Base de Datos

```sql
SELECT e.id_estudiante, e.nombre FROM estudiante e WHERE NOT EXISTS (SELECT 1 FROM curso c WHERE c.area='Base de Datos' AND NOT EXISTS (SELECT 1 FROM inscripcion i JOIN grupo g ON i.id_grupo=g.id_grupo WHERE i.id_estudiante=e.id_estudiante AND g.id_curso=c.id_curso)) ORDER BY e.id_estudiante;
```

| id_estudiante | nombre         |
| ------------- | -------------- |
| 1             | Julio Milan    |
| 2             | Fernanda Lopez |
| 3             | Diego Martinez |
| 4             | Andrea Gomez   |
| 6             | Natalia Perez  |
| 12            | Regina Ortega  |
| 16            | Renata Rojas   |
| 18            | Lucia Fuentes  |

### F18 - Division: profesores que imparten todos los cursos de Programacion

```sql
SELECT p.id_profesor, p.nombre FROM profesor p WHERE NOT EXISTS (SELECT 1 FROM curso c WHERE c.area='Programacion' AND NOT EXISTS (SELECT 1 FROM grupo g WHERE g.id_profesor=p.id_profesor AND g.id_curso=c.id_curso)) ORDER BY p.id_profesor;
```

| id_profesor | nombre          |
| ----------- | --------------- |
| 1           | Dra. Ana Torres |

### F19 - Cuantificador universal: estudiantes que aprobaron todos sus cursos inscritos

```sql
SELECT e.nombre FROM estudiante e WHERE NOT EXISTS (SELECT 1 FROM inscripcion i WHERE i.id_estudiante=e.id_estudiante AND i.calificacion < 6) ORDER BY e.nombre;
```

| nombre          |
| --------------- |
| Andrea Gomez    |
| Camila Sanchez  |
| Diego Martinez  |
| Fernanda Lopez  |
| Ivan Campos     |
| Julio Milan     |
| Leonardo Reyes  |
| Lucia Fuentes   |
| Mariana Nunez   |
| Mateo Hernandez |
| ... | 8 filas mas |

### F20 - Cuantificador universal: carreras donde todos sus estudiantes tienen promedio minimo de 8

```sql
SELECT c.nombre FROM carrera c WHERE NOT EXISTS (SELECT 1 FROM estudiante e WHERE e.id_carrera=c.id_carrera AND e.promedio < 8) ORDER BY c.nombre;
```

| nombre                                |
| ------------------------------------- |
| Ingenieria en Inteligencia Artificial |
