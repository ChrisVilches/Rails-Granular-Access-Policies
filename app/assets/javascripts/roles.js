function listRolesPermissions(){
  $(document).ready(function(){
    $.ajax({
      url: '/roles',
      type: 'GET',
      success: function(rolesPermissions){
        $("#role-list").html(HandlebarsTemplates['role_list']({ roles: rolesPermissions.roles }));
        $("#permission-list").html(HandlebarsTemplates['permission_list']({ permissions: rolesPermissions.permissions }));
      },
      error: function(e){
      }
    });
  });
}
