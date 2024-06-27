extension ListExtensions<T> on List<T?> {
  List<T> discardNulls() {
    List<T> nonNullList = [];
    for (var i in this) {
      if (i != null) {
        nonNullList.add(i);
      }
    }
    return nonNullList;
  }

  T? findOrNull(bool Function(T) check) {
    for (var i in this) {
      if (i != null && check(i)) return i;
    }
    return null;
  }
}
