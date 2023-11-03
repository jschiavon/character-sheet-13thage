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

final CLASSES = <String, Map<String, dynamic>>{
  'Barbarian': {
    'abilities': [
      'strength',
      'constitution',
      '',
    ],
    'stats': {
      'ac': 12,
      'pd': 11,
      'md': 10,
    },
    'hp': 7,
    'recoveries': 8,
    'recovery dice': 10,
    'melee': {
      'ability': ['strength'],
      'die': 10,
      'miss': 'level',
    },
    'ranged': {
      'ability': ['dexterity'],
      'die': 8,
      'miss': null,
    },
  },
  'Bard': {
    'abilities': [
      'dexterity',
      'charisma',
      '',
    ],
    'stats': {
      'ac': 12,
      'pd': 10,
      'md': 11,
    },
    'hp': 7,
    'recoveries': 8,
    'recovery dice': 8,
    'melee': {
      'ability': ['strength', 'dexterity'],
      'die': 8,
      'miss': 'level',
    },
    'ranged': {
      'ability': ['dexterity'],
      'die': 8,
      'miss': null,
    },
  },
  'Berserker: Storm Bull': {
    'abilities': [
      'strength',
      'constitution',
      '',
    ],
    'stats': {
      'ac': 9,
      'pd': 11,
      'md': 11,
    },
    'hp': 8,
    'recoveries': 8,
    'recovery dice': 10,
    'melee': {
      'ability': ['strength'],
      'die': 10,
      'miss': 'level',
    },
    'ranged': {
      'ability': ['dexterity'],
      'die': 8,
      'miss': null,
    },
  },
  'Berserker: Zoran Zorani': {
    'abilities': [
      'strength',
      'constitution',
      '',
    ],
    'stats': {
      'ac': 12,
      'pd': 10,
      'md': 10,
    },
    'hp': 7,
    'recoveries': 8,
    'recovery dice': 8,
    'melee': {
      'ability': ['strength'],
      'die': 10,
      'miss': 'level',
    },
    'ranged': {
      'ability': ['dexterity'],
      'die': 4,
      'miss': null,
    },
  },
  'Chaos Mage': {
    'abilities': [
      'intelligence',
      'charisma',
      '',
    ],
    'stats': {
      'ac': 10,
      'pd': 10,
      'md': 11,
    },
    'hp': 6,
    'recoveries': 8,
    'recovery dice': 6,
    'melee': {
      'ability': ['strength'],
      'die': 6,
      'miss': 'level',
    },
    'ranged': {
      'ability': ['dexterity'],
      'die': 4,
      'miss': null,
    },
  },
  'Cleric': {
    'abilities': [
      'wisdom',
      'strength',
      '',
    ],
    'stats': {
      'ac': 15,
      'pd': 11,
      'md': 11,
    },
    'hp': 7,
    'recoveries': 8,
    'recovery dice': 8,
    'melee': {
      'ability': ['strength'],
      'die': 6,
      'miss': 'level',
    },
    'ranged': {
      'ability': ['dexterity'],
      'die': 6,
      'miss': null,
    },
  },
  'Commander': {
    'abilities': [
      'strength',
      'charisma',
      '',
    ],
    'stats': {
      'ac': 12,
      'pd': 10,
      'md': 12,
    },
    'hp': 7,
    'recoveries': 8,
    'recovery dice': 8,
    'melee': {
      'ability': ['strength'],
      'die': 8,
      'miss': 'level',
    },
    'ranged': {
      'ability': ['dexterity'],
      'die': 6,
      'miss': null,
    },
  },
  'Demonologist': {
    'abilities': [
      'constitution',
      'charisma',
      '',
    ],
    'stats': {
      'ac': 11,
      'pd': 11,
      'md': 11,
    },
    'hp': 6,
    'recoveries': 8,
    'recovery dice': 6,
    'melee': {
      'ability': ['strength'],
      'die': 6,
      'miss': 'level',
    },
    'ranged': {
      'ability': ['dexterity'],
      'die': 4,
      'miss': null,
    },
  },
  'Druid': {
    'abilities': [
      'strength',
      'dexterity',
      'wisdom',
      '',
    ],
    'stats': {
      'ac': 10,
      'pd': 11,
      'md': 11,
    },
    'hp': 6,
    'recoveries': 8,
    'recovery dice': 6,
    'melee': {
      'ability': ['strength', 'dexterity'],
      'die': 6,
      'miss': 'level',
    },
    'ranged': {
      'ability': ['dexterity'],
      'die': 6,
      'miss': null,
    },
  },
  'Earth Priestess': {
    'abilities': [
      'wisdom',
      'charisma',
      '',
    ],
    'stats': {
      'ac': 12,
      'pd': 10,
      'md': 10,
    },
    'hp': 6,
    'recoveries': 8,
    'recovery dice': 6,
    'melee': {
      'ability': ['strength'],
      'die': 4,
      'miss': 'level',
    },
    'ranged': {
      'ability': ['dexterity'],
      'die': 3,
      'miss': null,
    },
  },
  'Fighter': {
    'abilities': [
      'strength',
      'dexterity',
      'constitution',
      '',
    ],
    'stats': {
      'ac': 15,
      'pd': 10,
      'md': 10,
    },
    'hp': 8,
    'recoveries': 9,
    'recovery dice': 10,
    'melee': {
      'ability': ['strength'],
      'die': 10,
      'miss': 'level',
    },
    'ranged': {
      'ability': ['dexterity'],
      'die': 8,
      'miss': null,
    },
  },
  'Hell Mother': {
    'abilities': [
      'charisma',
      'constitution',
      '',
    ],
    'stats': {
      'ac': 11,
      'pd': 10,
      'md': 11,
    },
    'hp': 5,
    'recoveries': 8,
    'recovery dice': 6,
    'melee': {
      'ability': ['strength'],
      'die': 4,
      'miss': 'level',
    },
    'ranged': {
      'ability': ['dexterity'],
      'die': 3,
      'miss': null,
    },
  },
  'Humakti': {
    'abilities': [
      'strength',
      'constitution',
      '',
    ],
    'stats': {
      'ac': 15,
      'pd': 10,
      'md': 11,
    },
    'hp': 8,
    'recoveries': 8,
    'recovery dice': 8,
    'melee': {
      'ability': ['strength'],
      'die': 10,
      'miss': 'level',
    },
    'ranged': {
      'ability': ['dexterity'],
      'die': 8,
      'miss': null,
    },
  },
  'Monk': {
    'abilities': [
      'strength',
      'dexterity',
      'wisdom',
      '',
    ],
    'stats': {
      'ac': 11,
      'pd': 11,
      'md': 11,
    },
    'hp': 7,
    'recoveries': 8,
    'recovery dice': 8,
    'melee': {
      'ability': ['strength'],
      'die': 8,
      'miss': 'level',
    },
    'ranged': {
      'ability': ['dexterity'],
      'die': 6,
      'miss': null,
    },
  },
  'Necromancer': {
    'abilities': [
      'intelligence',
      'charisma',
      '',
    ],
    'stats': {
      'ac': 10,
      'pd': 10,
      'md': 11,
    },
    'hp': 7,
    'recoveries': 8,
    'recovery dice': 6,
    'melee': {
      'ability': ['strength'],
      'die': 6,
      'miss': 'level',
    },
    'ranged': {
      'ability': ['dexterity'],
      'die': 4,
      'miss': null,
    },
  },
  'Occultist': {
    'abilities': [
      'intelligence',
      'wisdom',
      '',
    ],
    'stats': {
      'ac': 11,
      'pd': 10,
      'md': 11,
    },
    'hp': 7,
    'recoveries': 8,
    'recovery dice': 6,
    'melee': {
      'ability': ['strength'],
      'die': 6,
      'miss': 'level',
    },
    'ranged': {
      'ability': ['dexterity'],
      'die': 4,
      'miss': null,
    },
  },
  'Paladin': {
    'abilities': [
      'strength',
      'charisma',
      '',
    ],
    'stats': {
      'ac': 16,
      'pd': 10,
      'md': 12,
    },
    'hp': 7,
    'recoveries': 8,
    'recovery dice': 10,
    'melee': {
      'ability': ['strength'],
      'die': 10,
      'miss': 'level',
    },
    'ranged': {
      'ability': ['dexterity'],
      'die': 8,
      'miss': null,
    },
  },
  'Ranger': {
    'abilities': [
      'strength',
      'dexterity',
      '',
    ],
    'stats': {
      'ac': 14,
      'pd': 11,
      'md': 10,
    },
    'hp': 7,
    'recoveries': 8,
    'recovery dice': 8,
    'melee': {
      'ability': ['strength'],
      'die': 10,
      'miss': 'level',
    },
    'ranged': {
      'ability': ['dexterity'],
      'die': 8,
      'miss': 'level',
    },
  },
  'Rogue': {
    'abilities': [
      'dexterity',
      'charisma',
      '',
    ],
    'stats': {
      'ac': 12,
      'pd': 12,
      'md': 10,
    },
    'hp': 7,
    'recoveries': 8,
    'recovery dice': 8,
    'melee': {
      'ability': ['dexterity'],
      'die': 8,
      'miss': 'level',
    },
    'ranged': {
      'ability': ['dexterity'],
      'die': 6,
      'miss': 'level',
    },
  },
  'Sorcerer': {
    'abilities': [
      'charisma',
      'constitution',
      '',
    ],
    'stats': {
      'ac': 10,
      'pd': 11,
      'md': 10,
    },
    'hp': 7,
    'recoveries': 8,
    'recovery dice': 6,
    'melee': {
      'ability': ['strength'],
      'die': 8,
      'miss': 'level',
    },
    'ranged': {
      'ability': ['dexterity'],
      'die': 6,
      'miss': null,
    },
  },
  'Trickster': {
    'abilities': [
      'charisma',
      'constitution',
      '',
    ],
    'stats': {
      'ac': 9,
      'pd': 12,
      'md': 14,
    },
    'hp': 6,
    'recoveries': 8,
    'recovery dice': 10,
    'melee': {
      'ability': ['strength'],
      'die': 6,
      'miss': 'level',
    },
    'ranged': {
      'ability': ['dexterity'],
      'die': 4,
      'miss': null,
    },
  },
  'Wizard': {
    'abilities': [
      'intelligence',
      'wisdom',
      '',
    ],
    'stats': {
      'ac': 10,
      'pd': 10,
      'md': 12,
    },
    'hp': 7,
    'recoveries': 8,
    'recovery dice': 6,
    'melee': {
      'ability': ['strength'],
      'die': 6,
      'miss': 'level',
    },
    'ranged': {
      'ability': ['dexterity'],
      'die': 4,
      'miss': null,
    },
  },
};

final RACES = <String, List<String>>{
  'Dwarf': ['constitution', 'wisdom', ''],
  'Gnome': ['dexterity', 'intelligence', ''],
  'Half-elf': ['constitution', 'charisma', ''],
  'Halfling': ['constitution', 'dexterity', ''],
  'Half-orc': ['strength', 'dexterity', ''],
  'High Elf': ['intelligence', 'charisma', ''],
  'Human': [
    'strength',
    'dexterity',
    'constitution',
    'intelligence',
    'wisdom',
    'charisma',
    ''
  ],
  'Dark Elf': ['dexterity', 'charisma', ''],
  'Dragonic': ['strength', 'charisma', ''],
  'Forgeborn': ['strength', 'constitution', ''],
  'Aasimar': ['wisdom', 'charisma', ''],
  'Tiefling': ['strength', 'intelligence', ''],
};
