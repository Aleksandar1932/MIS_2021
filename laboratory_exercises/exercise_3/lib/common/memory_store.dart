class MemoryStore<T> {
  List<T> items = [];

  void add(T item) {
    items.add(item);
  }

  void remove(T item) {
    items.remove(item);
  }

  void clear() {
    items.clear();
  }

  bool contains(T item) {
    return items.contains(item);
  }

  List<T> getItems() {
    return items;
  }
}
