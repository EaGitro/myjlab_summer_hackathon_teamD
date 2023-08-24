
ArrayList<DroppingItem> droppingItems = new ArrayList<DroppingItem>();

public class DroppingItem {
  String name;
  boolean isSokuji;
  float water, salt;

  DroppingItem(String name, boolean isSokuji, float water, float salt) {
      this.name = name;
      this.isSokuji = isSokuji;
      this.water = water;
      this.salt = salt;
  }
}
