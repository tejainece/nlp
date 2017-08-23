import 'dart:convert';
import 'dart:io';

// https://github.com/fozziethebeat/S-Space/blob/master/data/english-stop-words-large.txt
main() async {
  var stopwordsTxt =
      new File.fromUri(Platform.script.resolve('stopwords_english.txt'));
  var outputFile = new File.fromUri(
      Platform.script.resolve('../lib/src/english_stopwords.dart'));

  var sink = outputFile.openWrite()
    ..writeln("import 'tokenizer.dart';")
    ..writeln()
    ..write('final RegExp _stopwords = new RegExp(r"\\\\b(');
  var input = stopwordsTxt
      .openRead()
      .transform(UTF8.decoder)
      .transform(const LineSplitter())
      .map((s) => s.trim())
      .where((s) => s.isNotEmpty);
  int i = 0;

  await for (var line in input) {
    if (i++ > 0) sink.write('|');
    sink.write(line);
  }

  sink
    ..writeln(')\\\\b");')
    ..writeln()
    ..writeln('/// Removes common stopwords from English text.')
    ..writeln("Tokenizer removeEnglishStopwords(Tokenizer tokenizer) {")
    ..writeln("  return (String input) {")
    ..writeln("    var s = tokenizer(input).join(' ').replaceAll(_stopwords, '');")
    ..writeln("    return s.split(' ').where((ss) => ss.isNotEmpty).toList();")
    ..writeln("  };")
    ..writeln('}');

  await sink.close();
}
