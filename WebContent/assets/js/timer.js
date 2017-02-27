$(function(){
    var timenow = new Date();
    timenow.setSeconds(timenow.getSeconds() + 3);

    $('#clock1').countdown(timenow,function(event){
        var timeformat = event.strftime('倒计时 %D天 %H:%M:%S'); 
        $(this).html(timeformat);
    }).on('finish.countdown', function(){
        $(this)
            .parent()
            .hide()
            .html('<button class="btn btn-success btn-lg"><span class="glyphicon glyphicon-headphones"></span> 进入Live课程</button>')
            .addClass('animated flash') 
            .show();
    });
});
