class Predator extends Fish {

  Predator(float x, float y, PVector vel) {
    super(x, y, vel);
    this.c = color(255, 0, 0);
    this.mass = 25;
    this.size = mass/2 + 5;
    viewRatio = 250;
  }

  void wandering() {
  }
  
  void hunt(ArrayList<Marine> marines) {
    for (Marine target : marines) {
      if (target instanceof Prey) {
        PVector targetPos = target.pos;
        if (PVector.dist(pos, target.pos) < viewRatio)
          seek(targetPos);
      }
    }
  }
}
