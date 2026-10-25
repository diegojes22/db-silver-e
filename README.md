<div align=center>

```
    ____  ____     ______     ______                                            
   / __ \/ __ )   / ____/    / ____/___  ____ ___  ____ ___  ___  _____________ 
  / / / / __  |  / __/______/ /   / __ \/ __ `__ \/ __ `__ \/ _ \/ ___/ ___/ _ \
 / /_/ / /_/ /  / /__/_____/ /___/ /_/ / / / / / / / / / / /  __/ /  / /__/  __/
/_____/_____/  /_____/ __  \____/\____/_/ /_/_/_/_/ /_/ /_/\___/_/   \___/\___/ 
              / ___/(_) /   _____  _____   /_  __/__  ____ _____ ___            
              \__ \/ / / | / / _ \/ ___/    / / / _ \/ __ `/ __ `__ \           
             ___/ / / /| |/ /  __/ /       / / /  __/ /_/ / / / / / /           
            /____/_/_/ |___/\___/_/       /_/  \___/\__,_/_/ /_/ /_/            
                                                                                                                               
```

</div>

---
Esta es la Base de Datos para el proyecto de Backend ISC 2026 del ITLP. Esta DB
esta preparada para ser de un E-commerce de productos electronicos (un especie de Steren
para darnos a entender).

> **Equipo Silver**
> - [@diegojes22](https://github.com/diegojes22)
> - [@salzzzr](https://github.com/salzzzr)
> - [@Nick-MC0712](https://github.com/Nick-MC0712)
> 
> Mencion honorifica a [@Mikehub15](https://github.com/Mikehub15)

---
## Informacion tecnica
Esta DB esta pensada para estar alojada en **Supabase** que en la practica es **PostgreSQL**.

Para realizar validacion del modelo, pruebas, cambios u otra accion primero debes probar dichos cambios en una instancia local de **PostgreSQL** antes de realizar alguna implementacion en **Supabase**

> **@Recordatorio**
> Para acceder al proyecto alojado en **Supabase** se debe solicitar acceso al administrador correspondiente.

### Recomendaciones para realizar un commit
Para poder realizar un commit y un porterior **git push** se recomienda la siguiente estructura
```
git commit -m '<descripcion muy breve del cambio> . <fecha del cambio usando numeros>'
```

## Estructura del repositorio
```
./
  models/           # Diagramas de modelado de la base de datos
  src/              
    db/             # Scripts de creacion para la DB (para MySQL y Postgres)
    insert/         # Insercion de registros e informacion en la DB
    querys/         # Consultas de validacion
```

## Sobre este trabajo
Este proyecto se desarrolla en el marco de una actividad académica correspondiente a la asignatura de Backend del **[Instituto Tecnológico de La Piedad](https://piedad.tecnm.mx/)**, como parte de la formación universitaria en **Ingeniería en Sistemas Computacionales**.

La estructura inicial de la base de datos y el concepto general de la actividad fueron proporcionados por el docente responsable de la asignatura. A partir de estos lineamientos, el desarrollo tiene como finalidad aplicar y poner en práctica los conocimientos adquiridos sobre diseño, arquitectura y desarrollo de sistemas Backend, siguiendo buenas prácticas de programación y principios de diseño orientados a la construcción de una API reutilizable y capaz de servir como base para distintas aplicaciones cliente.

Este repositorio tiene fines exclusivamente educativos y de demostración técnica. Su publicación tiene como propósito documentar el proceso de desarrollo, facilitar la revisión del trabajo y servir como evidencia del aprendizaje adquirido. El reconocimiento de los lineamientos y materiales proporcionados por el docente no implica que estos sean de autoría propia.

> **@Importante!** <br>
> Este proyecto estara bajo una licencia, por lo que no es OpenSource