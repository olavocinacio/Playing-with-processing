Star[] stars = new Star[1000];
float speed;

void setup() 
{
  size(600, 600);
  for(int i = 0; i < stars.length; i++)
  {
    stars[i] = new Star();    
  }
}

void draw ()
{
  //A multiplicação por um valor aleatório implica em velocidades aleatórias (algumas estrelas serão mais rápidas que outras)
  speed = map(mouseX, 0, width, 0, 50) * random(0, 1.5);
  background(0);
  translate(width/2, height/2);
  for(int i = 0; i < stars.length; i++)
  {
    stars[i].update();
    stars[i].show();
  }
}
