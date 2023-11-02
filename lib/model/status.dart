class Status {
  int id;
  final int damage;
  final int recoveriesSpent;
  final bool staggered;
  final bool down;
  final bool dead;

  Status({
    this.id = 0,
    this.damage = 0,
    this.recoveriesSpent = 0,
    this.staggered = false,
    this.down = false,
    this.dead = false,
  });

  factory Status.fromMap(Map<String, dynamic>? statusMap) {
    return Status(
      id: statusMap?['id'] ?? 0,
      damage: statusMap?['damage'] ?? 0,
      recoveriesSpent: statusMap?['recoveriesSpent'] ?? 0,
      staggered: statusMap?['staggered'] ?? false,
      down: statusMap?['down'] ?? false,
      dead: statusMap?['dead'] ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'damage': damage,
      'recoveriesSpent': recoveriesSpent,
      'staggered': staggered,
      'down': down,
      'dead': dead,
    };
  }
}
