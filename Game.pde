class Game{
  ArrayList<Level> levels;
  int score;
  Game(){
    score=0;
    levels = new ArrayList<Level>();
    levels.add(new Level());
  }
}
