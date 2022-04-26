void main() {
  print(invert([1, 2, 3, 4, 5]));
}

String spinWords(String str) {
  // your code here
  List<String> list;
  list = str.split(' ');
  String res = '';
  String tmp = '';
  for (int i1 = 0; i1 < list.length; i1++) {
    if (list[i1].length >= 5) {
      tmp = list[i1].split('').reversed.join();
      res += tmp;
    } else {
      res += list[i1];
    }
    if (i1 != list.length - 1) {
      res += ' ';
    }
  }
  return res;
}

String chromosome_check(String sperm) {
  // your code here
  return sperm.contains('Y')
      ? 'Congratulations! You\'re going to have a son.'
      : 'Congratulations! You\'re going to have a daughter.';
}

///Given a set of numbers, return the additive inverse of each.
///Each positive becomes negatives, and the negatives become positives.
List<int> invert(List<int> arr) {
  // your code
  List<int> res = [];
  for (int num in arr) {
    res.add(-num);
  }
  return res;
}
