class Star 
{
  //coordenadas do momento
  float x;
  float y;
  float z;
  
  //coordenadas anteriores
  float px;
  float py;

  Star() 
  {
    x = random(-width, width);
    y = random(-height, height);
    z = random(width);
  }
  
  void update()
  {
    z = z - speed;
    if(z < 1)
    {
      x = random(-width, width);
      y = random(-height, height);
      z = width;
      px = x;
      py = y;
    }
  }
  
  void show()
  {
    fill(255);
    noStroke();
    
    //posição seguinte
    float sx = map(x/z, 0, 1, 0, width);
    float sy = map(y/z, 0, 1, 0, height);
    
    //variação do raio das esferas
    float r = map(z, 0, width, 5, 0);
    
    ellipse(sx, sy, r, r);
    
    //desenho do rastro da estrela
    stroke(255);
    line(px, py, sx, sy);
    
    px = sx;
    py = sy;
  }
 
  
}
