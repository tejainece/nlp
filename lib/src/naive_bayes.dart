import 'bayes.dart';
import 'stemmer.dart';
import 'tokenizer.dart';

/// A naive implementation of the Bayes algorithm.
class NaiveBayes extends Bayes {
  final Stemmer stemmer;
  final Tokenizer tokenizer;

  final Map<String, List<String>> _classes = {};
  final Map<String, double> _classProbabilities = {};

  NaiveBayes(this.stemmer, this.tokenizer);

  @override
  void teach(String className, Iterable<String> references) {
    var list = _classes.putIfAbsent(className, () => []);
    for (var ref in references) list.addAll(tokenizer(ref));
  }

  @override
  void train() {
    // Compute class probabilities
    var totalProbabilities = _classes.keys.fold<int>(0, (sum, k) => sum + _classes[k].length);

    for (var key in _classes.keys)
      _classProbabilities[key] = _classes[key].length / totalProbabilities;
  }

  @override
  Map<String, double> classifyMulti(String input, double confidence) {
    Map<String, double> probabilities = {};
    var totalProbabilities = _classes.keys.fold<int>(0, (sum, k) => sum + _classes[k].length);

    for (var stem in tokenizer(input)) {
      Map<String, double> influence = {};

      // Compute commonality
      var occurrences = _classes.keys.fold<int>(0, (sum, k) {
        var n = _classes[k].where((s) => s == stem).length;

        if (n > 0) {
          influence.putIfAbsent(k, () => 0.0);
          influence[k] += n.toDouble();
        }

        return sum + n;
      });

      var commonality = occurrences / totalProbabilities;
      var commonalityFactor = 1 * commonality;

      for (var key in influence.keys) {
        probabilities.putIfAbsent(key, () => 0.0);
        probabilities[key] += influence[key] * commonalityFactor;
      }
    }

    return probabilities;
  }

  @override
  String classify(String input, double confidence) {
    var probabilities = classifyMulti(input, confidence);

    if (probabilities.isEmpty)
      return null;

    var chosen = probabilities.keys.reduce((a, b) {
      return probabilities[b] > probabilities[a] ? b : a;
    });

    return probabilities[chosen] >= confidence ? chosen : null;
  }
}
