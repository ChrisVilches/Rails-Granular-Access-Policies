/*
*
* Configuracion global para todas las llamadas AJAX de la aplicacion.
* Se pueden sobreescribir en llamadas individuales.
* https://api.jquery.com/jquery.ajaxsetup/
*
*/

$.ajaxSetup({
  headers: {
    'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
  },

  contentType: "application/json",

  dataType: "json",

  // Mostrar errores recibidos.
  error: function(res){

    if(!res.hasOwnProperty('responseJSON')){
      $.notify("Hubo un error desconocido.", "error");
      return;
    }

    var errors = res.responseJSON;

    for(i in errors){
      $.notify(errors[i], "error");
    }

  }
});


// Crear un helper de handlebars para formatear fechas

Handlebars.registerHelper('dateFormat', function(context, block) {

  function formatDate(date) {
    var monthNames = [
      "Enero", "Febrero", "Marzo",
      "Abril", "Mayo", "Junio", "Julio",
      "Agosto", "Septiembre", "Octubre",
      "Noviembre", "Diciembre"
    ];

    var day = date.getDate();
    var monthIndex = date.getMonth();
    var year = date.getFullYear();
    var hh = date.getHours();
    var mm = date.getMinutes();
    var ss = date.getSeconds();

    return day + ' ' + monthNames[monthIndex] + ' ' + year + ', ' + hh + ':' + mm + ':' + ss;
  }

  return formatDate(new Date(context));
});
