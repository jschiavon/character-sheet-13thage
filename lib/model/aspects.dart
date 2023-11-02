class Aspects {
  int id;
  final String concept;
  final String origin;
  final String bond;
  final String uniqueThing;

  Aspects({
    this.id = 0,
    this.concept = '',
    this.origin = '',
    this.bond = '',
    this.uniqueThing = '',
  });

  factory Aspects.fromMap(Map<String, dynamic>? aspectsMap) {
    return Aspects(
        id: aspectsMap?['id'] ?? 0,
        concept: aspectsMap?['concept'] ?? '',
        origin: aspectsMap?['origin'] ?? '',
        bond: aspectsMap?['bond'] ?? '',
        uniqueThing: aspectsMap?['uniqueThing'] ?? '');
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'concept': concept,
      'origin': origin,
      'bond': bond,
      'uniqueThing': uniqueThing,
    };
  }
}
