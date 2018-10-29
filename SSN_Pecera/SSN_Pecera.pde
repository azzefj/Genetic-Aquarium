Sea sea;
ArrayList<Fish> fish;
int agentCount;
boolean campoVisible = true;
boolean settingPreys = true;
boolean settingPredators = false;

float extraDegrees = TWO_PI/360;

void setup() {
  fullScreen(P2D);
  background(#27CED6);
  sea = new Sea(20, 0.2, 0.000001);
  fish = new ArrayList<Fish>();
  fish.add(new Prey(random(width), random(height), PVector.random2D()));
  fish.add(new Prey(random(width), random(height), PVector.random2D()));
  fish.add(new Predator(random(width), random(height), PVector.random2D()));
  fish.add(new Predator(random(width), random(height), PVector.random2D()));
}

void draw() {
  color c = color(#27CED6);
  fill(c, 40);
  rect(0, 0, width, height);

  sea.update();
  if (campoVisible)sea.display();

  for (Fish v : fish) {
    PVector mouse = new PVector(mouseX, mouseY);
    PVector f = sea.getForce(v.pos.x, v.pos.y);
    f.normalize();
    v.applyForce(f);
    v.hunt(fish);
    v.update();
    v.display();
  }
  if (mousePressed) {
    if (settingPreys) {
      fish.add(new Prey(mouseX, mouseY, PVector.random2D()));
    }

    else if (settingPredators) {
      fish.add(new Predator(mouseX, mouseY, PVector.random2D()));
    }
  }
}

void keyPressed() {
  if (keyPressed) {
    campoVisible = (key == 'q' || key == 'Q') ? !campoVisible : campoVisible;
    if (key == 'w' || key == 'W'){
      settingPreys = true;
      settingPredators = false;
    }
    if (key == 'e' || key == 'E'){
      settingPreys = false;
      settingPredators = true;
    }
  }
  
}
