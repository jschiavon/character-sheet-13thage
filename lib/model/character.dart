class Character {
  int id;
  String charName;
  String charRace;
  String charClass;
  int charLevel;

  Character({
    this.id = 0,
    this.charName = '',
    this.charRace = '',
    this.charClass = '',
    this.charLevel = 1,
  });

  factory Character.fromMap(Map<String, dynamic>? characterMap) {
    return Character(
        id: characterMap?['id'] ?? 0,
        charName: characterMap?['name'] ?? '',
        charRace: characterMap?['race'] ?? '',
        charClass: characterMap?['class'] ?? '',
        charLevel: characterMap?['level'] ?? 1);
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': charName,
      'race': charRace,
      'class': charClass,
      'level': charLevel,
    };
  }
}
