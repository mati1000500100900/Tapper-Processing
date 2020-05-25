class Game {
  ArrayList<Level> levels;
  int lives;
  int score;
  int currentLevel;
  Game() {
    this.newGame();
  }
  void nextLevel() {
    currentLevel=(currentLevel+1)%13;
    currentScene=levels.get(currentLevel);
    levels.get(currentLevel).restart();
  }
  void newGame() {
    lives=5;
    score=0;
    currentLevel=0;

    levels = new ArrayList<Level>();
    levels.add(new Level(true, 1, true, 1, true, 1, true, 1, 50, 0));
    levels.add(new Level(true, 2, true, 2, true, 2, true, 2, 50, 1));
    levels.add(new Level(false, 2, false, 3, false, 3, false, 3, 75, 2));
    levels.add(new Level(false, 2, false, 3, false, 3, false, 4, 75, 3));
    levels.add(new Level(false, 3, false, 3, false, 3, false, 4, 75, 4));
    levels.add(new Level(true, 2, true, 3, false, 3, false, 4, 100, 5));
    levels.add(new Level(false, 3, false, 3, true, 4, true, 4, 100, 6));
    levels.add(new Level(true, 3, true, 4, false, 4, false, 4, 100, 7));
    levels.add(new Level(false, 4, false, 4, true, 4, true, 4, 100, 8));
    levels.add(new Level(true, 4, false, 4, false, 4, true, 4, 150, 9));
    levels.add(new Level(false, 4, true, 4, true, 4, false, 4, 150, 10));
    levels.add(new Level(false, 4, true, 4, false, 4, true, 4, 150, 11));
    levels.add(new Level(true, 4, false, 4, true, 4, false, 4, 150, 12));
  }
}
