import 'dart:io';
import 'package:nlp/nlp.dart';

/// Inspired by:
/// https://chatbotslife.com/text-classification-using-algorithms-e4d50dcba45
main() {
  var bayes = new NaiveBayes(
    lancaster,
    removeEnglishStopwords(
      tokenizeEnglish,
    ),
  )
    ..teach('greeting', [
      'how are you?',
      'how is your day?',
      'good day',
      'how is it going today?',
    ])
    ..teach('goodbye', [
      'have a nice day',
      'see you later',
      'have a nice day',
      'talk to you soon',
    ])
    ..teach('sandwich', [
      'make me a sandwich',
      'can you make a sandwich?',
      'having a sandwich today?',
      "what's for lunch?",
    ])
    ..train();

  while (true) {
    stdout.write('Enter some text: ');
    var line = stdin.readLineSync();
    var className = bayes.classify(line, 0.0);

    switch (className) {
      case 'greeting':
        stdout.writeln('Hello! I am doing just fine.');
        break;
      case 'goodbye':
        stdout.writeln('See you later, duude! Stay gnarly.');
        break;
      case 'sandwich':
        stdout.writeln('Bon appetit! I just prepared you a BLT.');
        break;
      default:
        stdout.writeln('Oops! I have no idea what that means.');
        break;
    }
  }
}
