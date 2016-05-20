
$(document).ready(function(){
    $("#m_subs").click(function(){
        $(".sandwich").slideToggle('fast');
    });
});


$(document).ready(function(){
    $(".sandwich").hover(function(){
        $(this).css("background-color", "yellow");
      }, function(){
        $(this).css("background-color", "#808000");
    });
});

$(document).ready(function(){
    $(".drink").hover(function(){
        $(this).css("background-color", "yellow");
      }, function(){
        $(this).css("background-color", "#808000");
    });
});

$(document).ready(function(){
    $("#m_drink").click(function(){
        $(".drink").slideToggle();
    });
});

$(document).ready(function(){
    $(".drink, .sandwich").click(function(){
        var htmlString = $(this).html();
        alert(htmlString);
    });
});
