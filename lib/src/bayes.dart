/// Classifies text using a variant of the Bayes algorithm.
///
/// API design inspired by:
/// https://miguelmota.com/blog/naive-bayes-classifier-in-javascript/
abstract class Bayes {
  /// Determines the most likely class of an [input] string.
  ///
  /// Returns `null` if the algorithm cannot classify the string.
  ///
  /// Provide a [confidence] number to determine how likely the bot is
  /// to return a class.
  String classify(String input, double confidence);

  /// Determines the probabilities that an input string is of certain classes.
  Map<String, double> classifyMulti(String input, double confidence);

  /// Computes probabilities that any given text falls into pre-defined classes.
  void train();

  /// Provides sample input to the classifier, preparing it to better recognize text.
  void teach(String className, Iterable<String> references);
}