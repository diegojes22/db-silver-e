# AGENTS.md — DB Silver E-commerce

## 1. Contexto del proyecto

Este repositorio contiene el modelo y los scripts de una base de datos relacional para **DB Silver E-commerce**, un proyecto académico de la asignatura de Backend de Ingeniería en Sistemas Computacionales (ISC), correspondiente al ciclo 2026 del Instituto Tecnológico de La Piedad (ITLP).

El sistema está orientado a un comercio electrónico de productos electrónicos, tomando como referencia conceptual una tienda de componentes, dispositivos y accesorios electrónicos.

### Objetivos

- Aplicar buenas prácticas de modelado, normalización e integridad de datos.
- Implementar y validar scripts SQL reproducibles.
- Preparar la base de datos para su integración con una API Backend y distintas aplicaciones cliente.
- Mantener compatibilidad con los motores de base de datos contemplados por el proyecto, es decir, compatibilidad total con PostgreSQL y Supabase.

## 2. Tecnologías y entorno

### PostgreSQL

**PostgreSQL es el motor principal de desarrollo y validación.**

El proyecto está diseñado para utilizar **Supabase** como plataforma de alojamiento. Supabase utiliza PostgreSQL, por lo que las características específicas de este motor deben ser la referencia para el diseño destinado a dicho entorno.

Los cambios en el esquema, las restricciones, las relaciones y las consultas deben probarse primero en una instancia local de PostgreSQL.

### MySQL

El repositorio contiene un Script de creacion de la base de datos para `MySQL`, el cual se localiza en `src/schema/create4mysql.sql`. Este Script es el modelo original de la base de datos compartido en la clase y solo es una referencio inicial para el modelo de PostgreSQL y Supabase.

### Supabase

Supabase es el entorno de destino, no el entorno predeterminado para experimentar.

- No realizar modificaciones en el proyecto remoto sin autorización explícita.
- No asumir que se dispone de permisos administrativos.
- No ejecutar migraciones, eliminaciones, reinicializaciones ni operaciones destructivas en el entorno remoto como parte de una validación rutinaria.
- Solicitar acceso al administrador correspondiente cuando sea necesario.
- No incluir credenciales, tokens, cadenas de conexión privadas ni archivos `.env` con secretos en el repositorio.

## 3. Estructura del repositorio

La estructura de referencia es la siguiente:

```text
./
├── models/           # Diagramas y documentación del modelo de datos
├── src/
│   ├── schema/       # Scripts de creación del esquema para PostgreSQL y MySQL
│   ├── insert/       # Scripts para insertar datos de prueba o iniciales
│   └── querys/       # Consultas SQL de validación
└── skills/           # Instrucciones y recursos para asistir en tareas de PostgreSQL
```

Antes de modificar archivos, inspeccionar la estructura real del repositorio y determinar qué scripts y convenciones ya existen.

La estructura anterior es una referencia documental, no una autorización para crear, mover o renombrar archivos innecesariamente.

**Importante:** conservar el nombre de los directorios y archivos (por ejemplo: `querys/`) mientras no exista una decisión explícita del equipo para cambiarlo. No corregir nombres de directorios de manera aislada, ya que pueden existir referencias que dependan de ellos.

## 4. Instrucciones generales para agentes de IA

Al trabajar en este repositorio, el agente debe:

1. Inspeccionar los archivos relevantes antes de proponer o aplicar cambios.
2. Comprender el modelo de datos existente y las relaciones entre tablas.
3. Reutilizar las convenciones del proyecto siempre que sean correctas.
4. Preferir cambios pequeños, coherentes y verificables.
5. Explicar brevemente las modificaciones realizadas y su justificación técnica.
6. Identificar los posibles efectos secundarios sobre tablas, relaciones, restricciones y datos existentes.
7. No inventar tablas, columnas, relaciones, reglas de negocio ni requisitos que no estén documentados o justificados.
8. Señalar las ambigüedades que afecten materialmente al diseño antes de tomar decisiones irreversibles.
9. Diferenciar entre cambios propuestos, cambios aplicados y cambios efectivamente probados.
10. Mantener la documentación sincronizada con las modificaciones realizadas.

No reescribir archivos completos cuando sea suficiente una modificación localizada.

No eliminar código, comentarios, registros de prueba o documentación únicamente porque parezcan innecesarios sin comprobar primero su propósito.

## 5. Buenas prácticas de diseño de bases de datos

Todo cambio en el esquema debe considerar los siguientes principios.

### Integridad de datos

- Definir claves primarias para las entidades que las necesiten.
- Utilizar claves foráneas para representar relaciones entre tablas.
- Aplicar restricciones `NOT NULL`, `UNIQUE`, `CHECK` y otras cuando correspondan a las reglas del sistema.
- Elegir tipos de datos adecuados para el significado y el rango de cada atributo.
- Evitar duplicar información que pueda mantenerse mediante relaciones correctamente diseñadas.
- Definir explícitamente el comportamiento de las claves foráneas ante actualizaciones o eliminaciones cuando sea relevante.

### Identificadores

El proyecto puede utilizar UUID como identificadores primarios cuando corresponda al modelo existente.

- Mantener consistencia entre los tipos de las claves primarias y foráneas.
- No cambiar el tipo de un identificador sin evaluar sus dependencias.
- No generar identificadores nuevos para registros existentes sin una justificación.
- Elegir un mecanismo de generación de UUID compatible con el motor y la versión objetivo.

### Tipos de datos

- Utilizar `NUMERIC` cuando se requiera precisión decimal, especialmente para importes monetarios.
- Evitar utilizar tipos de punto flotante para representar dinero.
- Elegir entre `DATE`, `TIMESTAMP` y `TIMESTAMPTZ` según la semántica del dato.
- No almacenar fechas, importes o cantidades como cadenas de texto cuando exista un tipo adecuado.
- Considerar los límites, la nulabilidad y las reglas de validación de cada atributo.

### Relaciones y normalización

- Mantener la coherencia entre el modelo relacional, los diagramas y los scripts SQL.
- Evaluar la normalización antes de introducir datos redundantes.
- No desnormalizar sin una razón técnica documentada.
- Verificar que las cardinalidades y las restricciones representen correctamente las reglas del negocio.

### Índices y rendimiento

- Evaluar índices para claves primarias, restricciones de unicidad y consultas frecuentes.
- Recordar que crear una clave foránea no implica que PostgreSQL cree automáticamente un índice en las columnas que la referencian.
- Evitar índices redundantes o innecesarios.
- Justificar los índices adicionales según los patrones de consulta esperados.

## 6. Convenciones para scripts SQL

Los scripts deben ser legibles, consistentes y fáciles de ejecutar.

- Utilizar una indentación uniforme y nombres descriptivos.
- Preferir palabras clave SQL en mayúsculas para mantener la consistencia.
- Calificar explícitamente los esquemas cuando sea necesario para evitar ambigüedades.
- Agrupar las operaciones relacionadas de forma lógica.
- Documentar las decisiones no evidentes mediante comentarios SQL.
- Evitar depender de un orden de ejecución implícito.
- No asumir que una tabla, extensión o función existe sin comprobarlo o documentar el requisito.

Cuando sea pertinente, utilizar transacciones para agrupar cambios relacionados. Tener en cuenta que no todas las operaciones de PostgreSQL admiten ejecución dentro de una transacción.

### Creación del esquema

Los scripts de `src/schema/` deben reflejar el modelo aprobado.

Antes de modificar un esquema, comprobar:

- Las dependencias entre tablas.
- El orden de creación de las entidades y restricciones.
- Los tipos de datos y sus valores predeterminados.
- Las claves primarias y foráneas.
- Las restricciones de integridad.
- La compatibilidad con el motor correspondiente.

### Inserción de registros

Los scripts de `src/insert/` deben respetar el esquema definido.

- Especificar las columnas destino en las instrucciones `INSERT`.
- Respetar los tipos de datos, las restricciones y las relaciones existentes.
- Utilizar identificadores consistentes entre tablas relacionadas.
- Evitar duplicados accidentales en datos de prueba.
- No introducir datos reales, privados o confidenciales.
- No asumir que un registro se insertó correctamente sin comprobar el resultado.

### Consultas de validación

Las consultas de `src/querys/` deben ayudar a comprobar el funcionamiento del modelo.

Cuando corresponda, incluir verificaciones para:

- La existencia de las tablas y columnas esperadas.
- La integridad referencial.
- Los registros huérfanos o duplicados.
- Los valores que incumplan las reglas de negocio.
- La coherencia entre los datos relacionados.
- Los resultados de las operaciones de inserción y actualización.

Preferir consultas de lectura para las verificaciones rutinarias.

## 7. Procedimiento de trabajo

Para cualquier modificación relevante, seguir este flujo:

1. **Inspeccionar:** revisar los archivos afectados, las dependencias y las convenciones actuales.
2. **Analizar:** identificar el problema, el comportamiento esperado y los posibles impactos.
3. **Planificar:** determinar los archivos que necesitan cambios y cómo se comprobarán.
4. **Implementar:** realizar el cambio mínimo necesario, manteniendo la coherencia del proyecto.
5. **Validar:** ejecutar las comprobaciones pertinentes en una instancia local del motor correspondiente.
6. **Documentar:** actualizar los diagramas o la documentación cuando el cambio afecte al modelo.
7. **Informar:** resumir los archivos modificados, las decisiones tomadas, las pruebas ejecutadas y las limitaciones pendientes.

Si no se dispone de una instancia local o de las herramientas necesarias para ejecutar las pruebas, indicarlo expresamente. No afirmar que un script fue probado si únicamente se revisó su sintaxis de forma manual.

## 8. Seguridad y protección de datos

La protección de la información tiene prioridad sobre la comodidad de desarrollo.

- No ejecutar operaciones destructivas sin autorización explícita.
- No modificar la base de datos remota de Supabase durante pruebas ordinarias.
- No mostrar ni registrar credenciales o secretos.
- No asumir que una operación es segura por el simple hecho de ejecutarse desde una herramienta de IA.
- Revisar el alcance de instrucciones como `DROP`, `TRUNCATE`, `DELETE` y `UPDATE` antes de ejecutarlas.
- Utilizar datos ficticios para pruebas y ejemplos.
- No modificar permisos, políticas de acceso o mecanismos de autenticación sin comprender su alcance.
- En caso de duda sobre el entorno de conexión, detener la operación y confirmar que se trata de la instancia local.

Los scripts de validación deben diseñarse para minimizar los efectos secundarios y evitar modificaciones involuntarias de datos.

## 9. Control de versiones y colaboración

Antes de modificar archivos, revisar el estado del repositorio para evitar sobrescribir trabajo ajeno.

- No descartar cambios existentes del usuario.
- No revertir modificaciones ajenas a la tarea solicitada.
- Mantener los cambios relacionados agrupados de manera lógica.
- No crear commits ni ejecutar `git push` sin una solicitud explícita.
- No modificar la licencia ni los avisos de autoría sin autorización.
- Evitar incluir archivos temporales, credenciales, volcados innecesarios o datos sensibles en los commits.

### Convención de mensajes de commit

La convención documentada por el equipo es:

```text
git commit -m '<descripción breve del cambio> . <fecha numérica>'
```

Ejemplo ilustrativo:

```text
git commit -m 'Agrega restricciones a productos. 281026'
```
> La fecha del commit se compone por el numero del dia, seguido por el numeor del mes, y finalmente el numero del año pero omitiendo la centuria.

Conservar esta convención cuando se trabaje con el historial del equipo, salvo que sus integrantes acuerden formalmente otra.

## 10. Diagramas y documentación

Los archivos de `models/` deben mantenerse alineados con el esquema implementado.

Cuando se agreguen, eliminen o modifiquen tablas, columnas, relaciones o restricciones relevantes:

- Comprobar si es necesario actualizar los diagramas.
- Mantener los nombres y las cardinalidades consistentes con los scripts.
- Documentar las decisiones que no puedan deducirse directamente del esquema.
- No presentar un diagrama conceptual como si fuera necesariamente idéntico al esquema físico.

## 11. Criterios de aceptación

Un cambio se considera técnicamente listo cuando cumple los criterios aplicables:

- [ ] Respeta los requisitos y el modelo vigente.
- [ ] Mantiene la coherencia de claves primarias, foráneas y restricciones.
- [ ] Utiliza tipos de datos apropiados.
- [ ] No introduce cambios ajenos a la tarea.
- [ ] Ha sido validado en el motor correspondiente, o se han declarado las pruebas pendientes.
- [ ] Mantiene actualizada la documentación afectada.
- [ ] No introduce credenciales ni datos confidenciales.
- [ ] No modifica Supabase sin autorización.
- [ ] Se han documentado las limitaciones o decisiones relevantes.

No todos los criterios requieren una modificación en cada tarea; deben aplicarse según el alcance del cambio.

## 12. Contexto académico y licencia

Este repositorio forma parte de una actividad académica de la asignatura de Backend del Instituto Tecnológico de La Piedad, dentro de la carrera de Ingeniería en Sistemas Computacionales.

La estructura inicial de la base de datos y el concepto general de la actividad fueron proporcionados por el docente responsable. El desarrollo posterior tiene como objetivo poner en práctica conocimientos de modelado de datos, diseño de sistemas Backend, SQL e integridad de la información.

El proyecto es mantenido por el Equipo Silver.

- [@diegojes22](https://github.com/diegojes22)
- [@salzzzr](https://github.com/salzzzr)
- [@Nick-MC0712](https://github.com/Nick-MC0712)

Respetar los avisos de autoría y los términos de licencia establecidos por los responsables del proyecto. No asumir que la disponibilidad pública del repositorio concede automáticamente permisos de redistribución, modificación o uso comercial.

## 13. Referencias

- Repositorio: https://github.com/diegojes22/db-silver-e
- Instituto Tecnológico de La Piedad: https://piedad.tecnm.mx/
- Documentación oficial de PostgreSQL: https://www.postgresql.org/docs/
- Documentación oficial de Supabase: https://supabase.com/docs

---

**Principio general:** priorizar la integridad y consistencia de la informacion almacenada en la base de datos.
