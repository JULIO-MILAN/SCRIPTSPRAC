# Instrucciones para generar el diagrama relacional en pgAdmin

1. Crear una base de datos nueva, por ejemplo `practica789`.
2. Abrir Query Tool sobre esa base de datos.
3. Ejecutar en orden:
   - `sql/01_schema.sql`
   - `sql/02_data.sql`
4. En pgAdmin abrir la herramienta ERD Tool o Generate ERD.
5. Agregar las tablas del esquema `public`:
   - departamento
   - carrera
   - profesor
   - estudiante
   - curso
   - aula
   - grupo
   - inscripcion
6. Exportar la imagen del diagrama relacional y reemplazar el archivo:
   - `docs/modelo_relacional.png`

El archivo `sql/01_schema.sql` contiene las llaves primarias y foráneas necesarias para que pgAdmin detecte las relaciones automáticamente.
