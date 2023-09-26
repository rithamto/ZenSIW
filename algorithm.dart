import 'dart:io';

List<int> quickSort(List<int> list, int left, int right) {
  if (left < right) {
    int pivot = list[(left + right) ~/ 2];
    int i = left;
    int j = right;
    while (i <= j) {
      while (list[i] < pivot) {
        i++;
      }
      while (list[j] > pivot) {
        j--;
      }
      if (i <= j) {
        swap(list, i, j);
        i++;
        j--;
      }
    }
    quickSort(list, left, j);
    quickSort(list, i, right);
  }
  return list;
}

void swap(List<int> list, int i, int j) {
  int temp = list[i];
  list[i] = list[j];
  list[j] = temp;
}

void miniMaxSum(List<int> lst) {
  var minSum = lst[0] + lst[1] + lst[2] + lst[3];
  var maxSum = lst[lst.length - 1] +
      lst[lst.length - 2] +
      lst[lst.length - 3] +
      lst[lst.length - 4];
  print("$minSum" + " $maxSum");
}

void main() {
  print('input list int');
  List<int> K = [];
  String? input = stdin.readLineSync();
  K = input!.split(" ").map((e) => int.parse(e)).toList();
  miniMaxSum(quickSort(K, 0, K.length - 1));
}
