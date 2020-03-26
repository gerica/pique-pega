class PlayersSpritsConst {
  static final String bettyDown1 = "players/betty_down_1.png";
  static final String bettyDown2 = "players/betty_down_2.png";
  static final String bettyDown3 = "players/betty_down_3.png";
  static final String bettyDown4 = "players/betty_down_4.png";
  static final String bettyLeft1 = "players/betty_left_1.png";
  static final String bettyLeft2 = "players/betty_left_2.png";
  static final String bettyLeft3 = "players/betty_left_3.png";
  static final String bettyLeft4 = "players/betty_left_4.png";
  static final String bettyUp1 = "players/betty_up_1.png";
  static final String bettyUp2 = "players/betty_up_2.png";
  static final String bettyUp3 = "players/betty_up_3.png";
  static final String bettyUp4 = "players/betty_up_4.png";
  static final String bettyRigth1 = "players/betty_rigth_1.png";
  static final String bettyRigth2 = "players/betty_rigth_2.png";
  static final String bettyRigth3 = "players/betty_rigth_3.png";
  static final String bettyRigth4 = "players/betty_rigth_4.png";

  static final String georgeDown1 = "players/george_down_1.png";
  static final String georgeDown2 = "players/george_down_2.png";
  static final String georgeDown3 = "players/george_down_3.png";
  static final String georgeDown4 = "players/george_down_4.png";
  static final String georgeLeft1 = "players/george_left_1.png";
  static final String georgeLeft2 = "players/george_left_2.png";
  static final String georgeLeft3 = "players/george_left_3.png";
  static final String georgeLeft4 = "players/george_left_4.png";
  static final String georgeUp1 = "players/george_up_1.png";
  static final String georgeUp2 = "players/george_up_2.png";
  static final String georgeUp3 = "players/george_up_3.png";
  static final String georgeUp4 = "players/george_up_4.png";
  static final String georgeRigth1 = "players/george_rigth_1.png";
  static final String georgeRigth2 = "players/george_rigth_2.png";
  static final String georgeRigth3 = "players/george_rigth_3.png";
  static final String georgeRigth4 = "players/george_rigth_4.png";

  static final String praca1 = "bg/praca_2.png";
  static final String praca2 = "bg/praca_4.png";
  static final String praia1 = "bg/praia_1.png";
  static final String praia2 = "bg/praia_2.png";

  static List<String> getAllBettyMoves() {
    List<String> result = List();
    result.add(bettyDown1);
    result.add(bettyDown2);
    result.add(bettyDown3);
    result.add(bettyDown4);
    result.add(bettyUp1);
    result.add(bettyUp2);
    result.add(bettyUp3);
    result.add(bettyUp4);
    result.add(bettyLeft1);
    result.add(bettyLeft2);
    result.add(bettyLeft3);
    result.add(bettyLeft4);
    result.add(bettyRigth1);
    result.add(bettyRigth2);
    result.add(bettyRigth3);
    result.add(bettyRigth4);
    return result;
  }

  static List<String> getAllGeorgeMoves() {
    List<String> result = List();
    result.add(georgeDown1);
    result.add(georgeDown2);
    result.add(georgeDown3);
    result.add(georgeDown4);
    result.add(georgeUp1);
    result.add(georgeUp2);
    result.add(georgeUp3);
    result.add(georgeUp4);
    result.add(georgeLeft1);
    result.add(georgeLeft2);
    result.add(georgeLeft3);
    result.add(georgeLeft4);
    result.add(georgeRigth1);
    result.add(georgeRigth2);
    result.add(georgeRigth3);
    result.add(georgeRigth4);
    return result;
  }

  static List<String> getAllPracas() {
    List<String> result = List();
    result.add(praca1);
    result.add(praca2);
    result.add(praia1);
    result.add(praia2);

    return result;
  }

  static List<String> getAll() {
    List<String> result = List();
    getAllBettyMoves().forEach((f) => result.add(f));
    getAllGeorgeMoves().forEach((f) => result.add(f));
    getAllPracas().forEach((f) => result.add(f));
    return result;
  }
}
