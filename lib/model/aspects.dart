// An interactive character sheet built with Flutter and GetX.
// Copyright (C) 2023  Jacopo Schiavon

// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.

// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.

// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <https://www.gnu.org/licenses/>.

class Aspects {
  int id;
  final String concept;
  final String origin;
  final String bond;
  final String weakness;
  final String uniqueThing;

  Aspects({
    this.id = 0,
    this.concept = '',
    this.origin = '',
    this.bond = '',
    this.weakness = '',
    this.uniqueThing = '',
  });

  factory Aspects.fromMap(Map<String, dynamic>? aspectsMap) {
    return Aspects(
        id: aspectsMap?['id'] ?? 0,
        concept: aspectsMap?['concept'] ?? '',
        origin: aspectsMap?['origin'] ?? '',
        bond: aspectsMap?['bond'] ?? '',
        weakness: aspectsMap?['weakness'] ?? '',
        uniqueThing: aspectsMap?['uniqueThing'] ?? '');
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'concept': concept,
      'origin': origin,
      'bond': bond,
      'weakness': weakness,
      'uniqueThing': uniqueThing,
    };
  }
}
