permission_list = [
  [ 1, "Puede leer", "LEER", "Descripcion de permiso puede leer" ],
  [ 2, "Puede crear", "CREAR", "Descripcion de permiso puede crear" ],
  [ 3, "Puede editar", "EDITAR", "Descripcion de permiso puede editar" ],
  [ 4, "Puede eliminar", "ELIMINAR", "Descripcion de permiso puede eliminar" ],
  [ 5, "Ver lista de roles", "VER_ROLES_PERMISO", "Este usuario puede ver el listado de roles (y tambien de permisos)" ]
]

permission_list.each do |id, title, symbol, description|
  Permission.create!( id: id, title: title, symbol: symbol, description: description )
end

role_list = [
  [ 1, "Administrador absoluto", "Descripcion de administrador absoluto", [1, 2, 3, 4, 5] ],
  [ 2, "Lector", "Descripcion de lector", [1] ],
  [ 3, "Publicador", "Descripcion de publicador", [2] ],
  [ 4, "Editor", "Descripcion de editor", [3] ],
  [ 5, "Editor y eliminador", "Descripcion, este usuario puede editar y eliminar", [3, 4] ]
]


role_list.each do |id, title, description, permission_ids|
  role = Role.new
  role.id = id
  role.title = title
  role.description = description

  permission_ids.each do |id|
    # Esto deberia ser mas eficiente, porque find() al parecer primero hace una consulta.
    role.permissions.push Permission.find(id)
  end

  role.save!
end


User.create! :id => 1, :email => 'admin@gmail.com', :password => '123123', :password_confirmation => '123123', :role_id => 1
User.create! :id => 2, :email => 'juan@gmail.com', :password => '123123', :password_confirmation => '123123', :role_id => 2
User.create! :id => 3, :email => 'pedro@gmail.com', :password => '123123', :password_confirmation => '123123', :role_id => 3

Article.create! :text => 'Texto del articulo, este articulo es pero hermoso <3', :user_id => 1
Article.create! :text => 'Me gustan los tacos vegetarianos', :user_id => 1
Article.create! :text => 'Quiero adoptar un gatito', :user_id => 1
Article.create! :text => 'Hoy sali al Starbucks y compre un Mocha', :user_id => 2
Article.create! :text => 'Ruby on Rails es el mejor framework del mundo', :user_id => 2
Article.create! :text => 'Hola mundo, que tal', :user_id => 3
