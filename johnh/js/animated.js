$(document).ready(function(){
var reset = 0;




  $("#centennialimg").mouseenter(function(){
    $("#lsidebar").fadeToggle(1000);
  });

  $("#rockyimg").mouseenter(function(){
    $("#rsidebar").fadeToggle(1000);
  });
  $("#resetbutton").click(function(){

    $("#portal1").css("height", "320");
    $("#portal1").css("width", "auto");

    $("#portal2").css("height", "320");
    $("#portal2").css("width", "auto");

    $("#portal3").css("height", "320");
    $("#portal3").css("width", "auto");

    $("#portal4").css("height", "320");
    $("#portal4").css("width", "auto");
    
    $("#portal5").css("height", "320");
    $("#portal5").css("width", "auto");
clearInterval(timer);
  });

if(reset==0){
var timer = setInterval(function(){
  $("#portal1").animate({
    height: '-=20px',
    width: '-=20px'
        });
  $("#portal2").animate({
    height: '-=20px',
    width: '-=20px'
        });
  $("#portal3").animate({
    height: '-=20px',
    width: '-=20px'
        });
  $("#portal4").animate({
    height: '-=20px',
    width: '-=20px'
      });
  $("#portal5").animate({
    height: '-=20px',
    width: '-=20px'
  });
},2000);
}

});
