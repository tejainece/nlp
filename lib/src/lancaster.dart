const int _stop = -1, _intact = 0, _continue = 1, _protect = 2;
final RegExp _vowels = new RegExp(r'const [aeiouy]');

const Map<String, List<Map<String, dynamic>>> _rules = const {
  "a": const [
    const {"match": "ia", "replacement": "", "type": 0},
    const {"match": "a", "replacement": "", "type": 0}
  ],
  "b": const [
    const {"match": "bb", "replacement": "b", "type": -1}
  ],
  "c": const [
    const {"match": "ytic", "replacement": "ys", "type": -1},
    const {"match": "ic", "replacement": "", "type": 1},
    const {"match": "nc", "replacement": "nt", "type": 1}
  ],
  "d": const [
    const {"match": "dd", "replacement": "d", "type": -1},
    const {"match": "ied", "replacement": "y", "type": 1},
    const {"match": "ceed", "replacement": "cess", "type": -1},
    const {"match": "eed", "replacement": "ee", "type": -1},
    const {"match": "ed", "replacement": "", "type": 1},
    const {"match": "hood", "replacement": "", "type": 1}
  ],
  "e": const [
    const {"match": "e", "replacement": "", "type": 1}
  ],
  "f": const [
    const {"match": "lief", "replacement": "liev", "type": -1},
    const {"match": "if", "replacement": "", "type": 1}
  ],
  "g": const [
    const {"match": "ing", "replacement": "", "type": 1},
    const {"match": "iag", "replacement": "y", "type": -1},
    const {"match": "ag", "replacement": "", "type": 1},
    const {"match": "gg", "replacement": "g", "type": -1}
  ],
  "h": const [
    const {"match": "th", "replacement": "", "type": 0},
    const {"match": "guish", "replacement": "ct", "type": -1},
    const {"match": "ish", "replacement": "", "type": 1}
  ],
  "i": const [
    const {"match": "i", "replacement": "", "type": 0},
    const {"match": "i", "replacement": "y", "type": 1}
  ],
  "j": const [
    const {"match": "ij", "replacement": "id", "type": -1},
    const {"match": "fuj", "replacement": "fus", "type": -1},
    const {"match": "uj", "replacement": "ud", "type": -1},
    const {"match": "oj", "replacement": "od", "type": -1},
    const {"match": "hej", "replacement": "her", "type": -1},
    const {"match": "verj", "replacement": "vert", "type": -1},
    const {"match": "misj", "replacement": "mit", "type": -1},
    const {"match": "nj", "replacement": "nd", "type": -1},
    const {"match": "j", "replacement": "s", "type": -1}
  ],
  "l": const [
    const {"match": "ifiabl", "replacement": "", "type": -1},
    const {"match": "iabl", "replacement": "y", "type": -1},
    const {"match": "abl", "replacement": "", "type": 1},
    const {"match": "ibl", "replacement": "", "type": -1},
    const {"match": "bil", "replacement": "bl", "type": 1},
    const {"match": "cl", "replacement": "c", "type": -1},
    const {"match": "iful", "replacement": "y", "type": -1},
    const {"match": "ful", "replacement": "", "type": 1},
    const {"match": "ul", "replacement": "", "type": -1},
    const {"match": "ial", "replacement": "", "type": 1},
    const {"match": "ual", "replacement": "", "type": 1},
    const {"match": "al", "replacement": "", "type": 1},
    const {"match": "ll", "replacement": "l", "type": -1}
  ],
  "m": const [
    const {"match": "ium", "replacement": "", "type": -1},
    const {"match": "um", "replacement": "", "type": 0},
    const {"match": "ism", "replacement": "", "type": 1},
    const {"match": "mm", "replacement": "m", "type": -1}
  ],
  "n": const [
    const {"match": "sion", "replacement": "j", "type": 1},
    const {"match": "xion", "replacement": "ct", "type": -1},
    const {"match": "ion", "replacement": "", "type": 1},
    const {"match": "ian", "replacement": "", "type": 1},
    const {"match": "an", "replacement": "", "type": 1},
    const {"match": "een", "replacement": "", "type": 2},
    const {"match": "en", "replacement": "", "type": 1},
    const {"match": "nn", "replacement": "n", "type": -1}
  ],
  "p": const [
    const {"match": "ship", "replacement": "", "type": 1},
    const {"match": "pp", "replacement": "p", "type": -1}
  ],
  "r": const [
    const {"match": "er", "replacement": "", "type": 1},
    const {"match": "ear", "replacement": "", "type": 2},
    const {"match": "ar", "replacement": "", "type": -1},
    const {"match": "ior", "replacement": "", "type": 1},
    const {"match": "or", "replacement": "", "type": 1},
    const {"match": "ur", "replacement": "", "type": 1},
    const {"match": "rr", "replacement": "r", "type": -1},
    const {"match": "tr", "replacement": "t", "type": 1},
    const {"match": "ier", "replacement": "y", "type": 1}
  ],
  "s": const [
    const {"match": "ies", "replacement": "y", "type": 1},
    const {"match": "sis", "replacement": "s", "type": -1},
    const {"match": "is", "replacement": "", "type": 1},
    const {"match": "ness", "replacement": "", "type": 1},
    const {"match": "ss", "replacement": "", "type": 2},
    const {"match": "ous", "replacement": "", "type": 1},
    const {"match": "us", "replacement": "", "type": 0},
    const {"match": "s", "replacement": "", "type": 1},
    const {"match": "s", "replacement": "", "type": -1}
  ],
  "t": const [
    const {"match": "plicat", "replacement": "ply", "type": -1},
    const {"match": "at", "replacement": "", "type": 1},
    const {"match": "ment", "replacement": "", "type": 1},
    const {"match": "ent", "replacement": "", "type": 1},
    const {"match": "ant", "replacement": "", "type": 1},
    const {"match": "ript", "replacement": "rib", "type": -1},
    const {"match": "orpt", "replacement": "orb", "type": -1},
    const {"match": "duct", "replacement": "duc", "type": -1},
    const {"match": "sumpt", "replacement": "sum", "type": -1},
    const {"match": "cept", "replacement": "ceiv", "type": -1},
    const {"match": "olut", "replacement": "olv", "type": -1},
    const {"match": "sist", "replacement": "", "type": 2},
    const {"match": "ist", "replacement": "", "type": 1},
    const {"match": "tt", "replacement": "t", "type": -1}
  ],
  "u": const [
    const {"match": "iqu", "replacement": "", "type": -1},
    const {"match": "ogu", "replacement": "og", "type": -1}
  ],
  "v": const [
    const {"match": "siv", "replacement": "j", "type": 1},
    const {"match": "eiv", "replacement": "", "type": 2},
    const {"match": "iv", "replacement": "", "type": 1}
  ],
  "y": const [
    const {"match": "bly", "replacement": "bl", "type": 1},
    const {"match": "ily", "replacement": "y", "type": 1},
    const {"match": "ply", "replacement": "", "type": 2},
    const {"match": "ly", "replacement": "", "type": 1},
    const {"match": "ogy", "replacement": "og", "type": -1},
    const {"match": "phy", "replacement": "ph", "type": -1},
    const {"match": "omy", "replacement": "om", "type": -1},
    const {"match": "opy", "replacement": "op", "type": -1},
    const {"match": "ity", "replacement": "", "type": 1},
    const {"match": "ety", "replacement": "", "type": 1},
    const {"match": "lty", "replacement": "l", "type": -1},
    const {"match": "istry", "replacement": "", "type": -1},
    const {"match": "ary", "replacement": "", "type": 1},
    const {"match": "ory", "replacement": "", "type": 1},
    const {"match": "ify", "replacement": "", "type": -1},
    const {"match": "ncy", "replacement": "nt", "type": 1},
    const {"match": "acy", "replacement": "", "type": 1}
  ],
  "z": const [
    const {"match": "iz", "replacement": "", "type": 1},
    const {"match": "yz", "replacement": "ys", "type": -1}
  ]
};

/// Stems a word using the Lancaster algorithm.
///
/// Directly ported from https://github.com/wooorm/lancaster-stemmer/blob/master/index.js.
String lancaster(String word) {
  return _applyRules(word.toLowerCase(), true);}

String _applyRules(String value, bool isIntact) {
  var ruleset = _rules[value.codeUnitAt(value.length - 1)];
  var breakpoint;
  var index;
  var length;
  Map<String, dynamic> rule;
  var next;

  if (ruleset?.isNotEmpty != true) {
    return value;
  }

  index = -1;
  length = ruleset.length;

  while (++index < length) {
    rule = ruleset[index];

    if (!isIntact && rule['type'] == _intact) {
      continue;
    }

    breakpoint = value.length - rule['match'].length;

    if (breakpoint < 0 || value.substring(breakpoint) != rule['match']) {
      continue;
    }

    if (rule['type'] == _protect) {
      return value;
    }

    next = value.substring(0, breakpoint) + rule['replacement'];

    if (!_acceptable(next)) {
      continue;
    }

    if (rule['type'] == _continue) {
      return _applyRules(next, false);
    }

    return next;
  }

  return value;
}

/// Detect if a value is acceptable to return, or should
/// be stemmed further.
bool _acceptable(value) {
  return _vowels.hasMatch(value.charAt(0)) ?
  value.length > 1 : value.length > 2 && _vowels.hasMatch(value);
}
