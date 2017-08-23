final RegExp _punctation = new RegExp(r'\W|_');

/// Tokenize English input.
List<String> tokenizeEnglish(String input) {
  return input
      .toLowerCase()
      .replaceAll("ain't", "are not")
      .replaceAll("won't", "will not")
      .replaceAll("n't", " not")
      .replaceAll("'ll", " will")
      .replaceAll("'ve", " have")
      .replaceAll("'s", " is")
      .replaceAll("'d", " would")
      .replaceAll("'re", " are")
      .replaceAll("y'all", " you all")
      .replaceAll("o'clock", "of clock")
      .split(_punctation)
      .where((s) => s.isNotEmpty)
      .toList();
}
