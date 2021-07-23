var myCanvas = document.getElementById('myCanvas');
if(myCanvas.getContext){
  var ctx = myCanvas.getContext("2d");

  ctx.fillStyle = "#000";
  ctx.fillRect (30, 30, 40, 40);
  ctx.strokeStyle = "rgba(0, 0, 200, 0.5)";
  ctx.strokeRect (60, 60, 60, 60);
  ctx.clearRect(40,40,20,20);
              
}