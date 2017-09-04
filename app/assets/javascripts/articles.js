// Inicializador

function listArticles(){
  $(document).ready(function(){
    $.ajax({
      url: '/articles/',
      type: 'GET',
      success: function(articles){
        $("#article-list").html(HandlebarsTemplates['article_list']({ articles }));
      },
      error: function(e){
      }
    });
  });
}


// Click al boton de editar


$(document).on('click', '[editar-articulo-id]', function(e){
  var nuevo = prompt("Introduzca el nuevo texto.");
  if(!nuevo){
    return;
  }
  var id = Number($(this).attr("editar-articulo-id"));
  $.ajax({
    url: '/articles/' + id,
    type: 'PATCH',
    data: JSON.stringify({ text: nuevo }),
    success: function(response) {
      $.notify("Fue editado exitosamente", "success");
      listArticles();
    }
  });
});



// Click al boton de eliminar


$(document).on('click', '[eliminar-articulo-id]', function(e){
  if(!confirm("Eliminar?")){
    return;
  }
  var id = Number($(this).attr("eliminar-articulo-id"));
  var text = $("#nuevo-articulo-input").val();
  $.ajax({
    url: '/articles/' + id,
    type: 'DELETE',
    success: function(response) {
      $.notify("Fue eliminado exitosamente", "success");
      listArticles();
    }
  });
});


// Click al boton de enviar nuevo articulo


$(document).on('click', "#nuevo-articulo-boton", function(){
  var text = $("#nuevo-articulo-input").val();
  $.ajax({
    url: '/articles',
    type: 'POST',
    data: JSON.stringify({ text }),
    success: function(response) {
      $.notify("Articulo creado exitosamente", "success");
      $("#nuevo-articulo-input").val("");
    }
  });
});
