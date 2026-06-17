# Practicas 7, 8 y 9 - Operaciones del Algebra Relacional

**Dominio:** Sistema universitario  
**Integrante:** Julio Adrian Milan Huidobro  
**Unidad de aprendizaje:** Bases de Datos  
**Programa:** Ingenieria en Sistemas Computacionales

## Descripcion

Este repositorio desarrolla un sistema universitario para practicar algebra relacional, calculo relacional de tuplas, calculo relacional de dominios y SQL. El modelo integra estudiantes, profesores, carreras, departamentos, cursos, aulas, grupos e inscripciones.

El proyecto cumple con:

- 8 relaciones interconectadas.
- Mas de 100 tuplas distribuidas entre tablas.
- Claves primarias y foraneas.
- Consultas con seleccion, proyeccion, union, interseccion, diferencia, producto cartesiano, reuniones, agrupacion, agregacion y division.
- 20 consultas finales expresadas en Algebra Relacional, CRT, CRD y SQL.

## Estructura

```text
practica_7_8_9_sistema_universitario/
├── README.md
├── docs/
│   ├── practica_7_8_9_sistema_universitario.pdf
│   ├── eer_sistema_universitario.png
│   └── modelo_relacional.png
├── sql/
│   ├── 01_schema.sql
│   ├── 02_data.sql
│   ├── 03_consultas_basicas.sql
│   ├── 04_consultas_avanzadas.sql
│   └── 05_consultas_finales_20.sql
├── resultados/
│   └── resultados_consultas.md
└── diagramas/
    ├── eer.dot
    └── modelo_relacional.dot
```

## Instalacion y ejecucion con PostgreSQL

1. Crear una base de datos:

```sql
CREATE DATABASE practica789;
```

2. Ejecutar los scripts en orden:

```bash
psql -d practica789 -f sql/01_schema.sql
psql -d practica789 -f sql/02_data.sql
psql -d practica789 -f sql/03_consultas_basicas.sql
psql -d practica789 -f sql/04_consultas_avanzadas.sql
psql -d practica789 -f sql/05_consultas_finales_20.sql
```

## Modelo relacional

![Modelo relacional](docs/modelo_relacional.png)

## Diagrama EER

![Diagrama EER](docs/eer_sistema_universitario.png)


## Diagramas

- El archivo `docs/eer_sistema_universitario.png` contiene el diagrama Entidad-Relación Extendido en notación clásica con entidades, atributos, relaciones y cardinalidades.
- El archivo `docs/modelo_relacional.png` puede reemplazarse por la imagen exportada desde pgAdmin después de ejecutar `sql/01_schema.sql`.
- Las instrucciones para generar el diagrama relacional están en `docs/INSTRUCCIONES_DIAGRAMA_RELACIONAL_PGADMIN.md`.

## Entregable principal

El documento completo esta en:

```text
docs/practica_7_8_9_sistema_universitario.pdf
```

Tambien se incluyen los resultados de consulta en:

```text
resultados/resultados_consultas.md
```
