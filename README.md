# Políticas de acceso

Esta es una aplicación muy sencilla que muestra como granularizar los permisos y roles de usuario de manera dinámica. Los usuarios pueden operar en distintas partes de la aplicación dependiendo de los permisos que posean.

Las gemas utilizadas son `devise` para la autenticación base, y `pundit` para la creación de políticas.

Probar con estos distintos usuarios.

```
admin@gmail.com
juan@gmail.com
pedro@gmail.com
```

Todos con la contraseña `123123`.

Luego, ver como el menú de la izquierda tiene menos opciones, con cada uno de esos usuarios.

También, se puede comprobar que algunos usuarios tienen botones para editar `artículos` y otro usuario no tiene esas opciones. Sólo puede leerlos pero no editarlos.

## Instalación

```bash
bundle install
rake db:drop
rake db:migrate
rake db:seed
```

Ejecutar con

```bash
rails s
```
