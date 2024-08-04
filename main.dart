class Strong {
  final double strenghtLevel = 1500.99;
}

class QuickRunner {
  void runQuick() {
    print("ruuuuuuuuun!");
  }
}

class Tall {
  final double height = 1.00;
}

class Player with Strong, QuickRunner, Tall {}

void main() {
  var player = Player(
    team: Team.red,
    name: 'min',
  );
}
