//Essa é uma versão simplificada, onde são inseridos, no código, os dados de massa, comprimento e ângulos iniciais.
//A ideia é implementar o código de forma a criar uma interface onde o usúario possa manipular a massa e comprimento das cordas.
//Além disso, as bolas se tornarão responsivas ao mouse, de forma que o ângulo seja formado ao arrastar as mesmas.

//Comprimentos das cordas
float r1 = 200;
float r2 = 200;
//Massa das esferas
float m1 = 40;
float m2 = 40;
//Ângulos em relação ao eixo das ordenadas
float a1 = PI/2;
float a2 = PI/2;
//Velocidade ângular
float a1_v = 0;
float a2_v = 0;
//Gravidade
float g = 0.98;
//Posição anterior
float px2 = 0;
float py2 = 0;
//Centros
float cx, cy;

PGraphics canvas;

void setup()
{
  size(1000,650);
  cx = width/2;
  cy = 100;
  canvas = createGraphics(width,height);
  canvas.beginDraw();
  canvas.background(255);
  canvas.endDraw();
}

void draw ()
{
  //Fórmulas extraídas de www.myphysicslab.com/pendulum/double-pendulum-en.html
  float num1 = -g * (2*m1 + m2) * sin(a1);
  float num2 = -m2 * g * sin(a1 - 2*a2);
  float num3 = -2 * sin(a1-a2) * m2;
  float num4 = a2_v * a2_v * r2 + a1_v * a1_v * r1 * cos(a1-a2);
  float den = r1 * (2*m1 + m2 - m2 * cos(2*a1-2*a2));
  //Aceleração ângular
  float a1_a = (num1+ num2 + num3 * num4) / den;
  
  num1 = 2 * sin(a1-a2); 
  num2 = (a1_v * a1_v * r1 * (m1+m2));
  num3 = g * (m1+m2) * cos(a1);
  num4 = a2_v * a2_v * r2 * m2 * cos(a1-a2);
  den =  r2 * (2*m1 + m2 - m2*cos(2*a1-2*a2)); 
  float a2_a = (num1 * (num2 + num3 + num4)) / den;
  
  //background(255);
  image(canvas,0,0);
  stroke(0);
  strokeWeight(2);
  
  translate(cx,cy);
  
  float x1 = r1 * sin(a1);
  float y1 = r1 * cos(a1);
  
  float x2 = x1 + r2 * sin(a2);
  float y2 = y1 + r2 * cos(a2);
 
  
  line (0, 0, x1, y1);
  fill(0);
  ellipse(x1, y1, m1, m1);
  
  line(x1, y1, x2, y2);
  fill(0);
  ellipse(x2, y2, m2, m2);
  
  a1_v += a1_a;
  a2_v += a2_a;
  a1 += a1_v;
  a2 += a2_v;
  
  //Resistência redutora da velocidade
  a1 *= 0.999999;
  a2 *= 0.999999;

  //Desenhando linha de trajetória
  canvas.beginDraw();
  canvas.translate(cx, cy);
  canvas.strokeWeight(1);
  canvas.stroke(0,0,255);
  if(frameCount >1)
  {
  canvas.line(px2, py2, x2, y2);
  }
  canvas.endDraw();
  
  px2 = x2;
  py2 = y2;

}
