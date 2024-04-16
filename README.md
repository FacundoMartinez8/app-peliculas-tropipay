La app fue realizada con Clean Architecture y TDD. Hay cosas q se podrian mejorar pero por cuestion de tiempo no hice. por ejemplo.

- Agregar paginacion al pedir las peliculas.
- Faltaron test como del Bloc y algunos widgets.
- Se podria refactorizar codigo.
- Se podria mejorar mucho la logica del buscador.

Antes de correr la app agregar archivo .env e instalar las dependencias (flutter pub get)
Las credenciales q yo use son las siguientes:

TMBD_URL=https://api.themoviedb.org/3
API_KEY=eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI1NDI5YzFhZjU0ODE2NzZiMzEwYWUyMDYzNDc4OTAxZiIsInN1YiI6IjY0M2IyZDQ0NGQ2NzkxMDQ2OWQ3MzY0YSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.F9wavWbmbgy8Fpy7HLYq4bAZeWg_fKPlLIv1fqMTd8o


Para correr los test generar los archivos mocks.

- flutter pub run build_runner build --delete-conflicting-outputs

