# English overview

Simple app that shows how to granularize privileges for different types/roles of users.

Depending on the user role, different actions will be seen on the menu. At backend level, these actions will also be validated against a policy to safely check whether the user can execute the action or not.

Using the `pundit` gem this was achieved in a very elegant way.

# Políticas de acceso

Creada usando `Rails 5.1.3`.

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
yarn
```

Ejecutar con

```bash
rails s
```
