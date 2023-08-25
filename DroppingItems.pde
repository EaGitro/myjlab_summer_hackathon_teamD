
ArrayList<DroppingItem> droppingItems = new ArrayList<DroppingItem>();

public class DroppingItem {
  String name;
  boolean isSokuji;
  float water, salt;
  PImage picture;
  AudioPlayer sound;

  DroppingItem(String name, boolean isSokuji, float water, float salt, PImage picture, AudioPlayer sound) {
      this.name = name;
      this.isSokuji = isSokuji;
      this.water = water;
      this.salt = salt;
      this.picture = picture;
      this.sound = sound;
  }
}
