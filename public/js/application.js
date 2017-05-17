$(document).ready(function() {

  $('#search').submit(function(e){
    e.preventDefault();
    form = $('#search').serialize();
    console.log("hola");
    $.ajax({
      url:'/fetch',
      data: form,
      type:'POST',
      beforeSend: function() {
        $(".tweets").html("<img src='fg.gif'/>");
      },
      success:function(data){ 
        $(".tweets").html(data);
        console.log(data)
      }
    });

  });


});



