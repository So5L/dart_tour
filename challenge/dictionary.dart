typedef Term = String;
typedef Definition = String;
typedef Block = Map<Term, Definition>;
typedef BlockList = List<Block>;

class Dictionary {
  // Map을 클래스의 속성으로 선언
  Block _dictionary = {};

  // 단어 추가 메서드
  void addWord(Term word, Definition definition) {
    if (_dictionary.containsKey(word)) {
      print('The word "$word" already exists.');
    } else {
      _dictionary[word] = definition;
      print('Word "$word" added to the dictionary.');
    }
  }

  void updateWord(Term word, Definition definition) {
    if (_dictionary.containsKey(word)) {
      _dictionary[word] = definition;
      print('The word "$word" is updated.');
    } else {
      print('Word "$word" not found.');
    }
  }

  void upsertWord(Term word, Definition definition) {
    if (_dictionary.containsKey(word)) {
      _dictionary[word] = definition;
      print('The word "$word" is updated.');
    } else {
      _dictionary[word] = definition;
      print('Word "$word" added to the dictionary.');
    }
  }

  void bulkAdd(BlockList blockList) {
    for (Block block in blockList) {
      _dictionary[block["term"]!] = block["definition"]!;
    }
    print('List "$blockList" added to the dictionary.');
  }

  // 단어 삭제 메서드
  void deleteWord(Term word) {
    if (_dictionary.containsKey(word)) {
      _dictionary.remove(word);
      print('Word "$word" deleted from the dictionary.');
    } else {
      print('Word "$word" not found.');
    }
  }

  void bulkDelete(BlockList blockList) {
    for (Block block in blockList) {
      _dictionary.remove(block["term"]!);
    }
    print('List "$blockList" deleted from the dictionary.');
  }

  // 단어 검색 메서드
  void showAllWords() {
    _dictionary.forEach((word, definition) {
      print('$word: $definition');
    });
  }

  Term? getWord(Term word) {
    print('$word: ${_dictionary[word]}');
    return null;
  }

  void existsWord(Term word) {
    if (_dictionary.containsKey(word)) {
      print('The word "$word" already exists.');
    } else {
      print('The word "$word" does not exists.');
    }
  }

  int? countWord() {
    print(_dictionary.length);
    return null;
  }
}

void main() {
  // Dictionary 클래스의 인스턴스 생성
  Dictionary myDictionary = Dictionary();

  myDictionary.addWord('min', 'handsome man');
  myDictionary.addWord(
      'apple', 'A fruit that is usually red, green, or yellow.');
  myDictionary.countWord();
  myDictionary.showAllWords();

  myDictionary.deleteWord('apple');
  myDictionary.updateWord('min', 'handsome woman');
  myDictionary.getWord('min');

  myDictionary.countWord();

  myDictionary.existsWord('nico');

  var list = [
    {"term": "김치", "definition": "대박이네~"},
    {"term": "아파트", "definition": "비싸네~"}
  ];

  myDictionary.bulkAdd(list);
  myDictionary.showAllWords();
  myDictionary.bulkDelete(list);
  myDictionary.showAllWords();
}
