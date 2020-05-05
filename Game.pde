class Game {
  ArrayList<Level> levels;
  int lives;
  int score;
  int currentLevel;
  Game() {
    lives=5;
    score=0;
    currentLevel=0;

    levels = new ArrayList<Level>();
    levels.add(new Level(true, 1, true, 1, true, 1, true, 1, "saloon"));
    levels.add(new Level(true, 2, true, 2, true, 2, true, 2, "saloon"));
    levels.add(new Level(true, 2, true, 3, true, 3, true, 3, "sports"));
    levels.add(new Level(true, 2, true, 3, true, 3, true, 4, "sports"));
    levels.add(new Level(true, 3, true, 3, true, 3, true, 4, "sports"));
    levels.add(new Level(false, 2, false, 3, true, 3, true, 4, "punk"));
    levels.add(new Level(true, 3, true, 3, false, 4, false, 4, "punk"));
    levels.add(new Level(false, 3, false, 4, true, 4, true, 4, "punk"));
    levels.add(new Level(true, 4, true, 4, false, 4, false, 4, "punk"));
    levels.add(new Level(false, 4, true, 4, true, 4, false, 4, "alien"));
    levels.add(new Level(true, 4, false, 4, false, 4, true, 4, "alien"));
    levels.add(new Level(false, 4, true, 4, false, 4, true, 4, "alien"));
    levels.add(new Level(true, 4, false, 4, true, 4, false, 4, "alien"));
  }
  void nextLevel(){
    currentLevel=(currentLevel+1)%13;
    currentScene=levels.get(currentLevel);
    levels.get(currentLevel).restart();
  }
  
}
