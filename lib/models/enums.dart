enum SelectedType { product, service }

extension ProductTypeExt on SelectedType {
  int get value {
    switch (this) {
      case SelectedType.product:
        return 1;
      case SelectedType.service:
        return 2;
    }
  }

  String get string {
    switch (this) {
      case SelectedType.product:
        return "product";
      case SelectedType.service:
        return "services";
    }
  }
}

enum ProductTransactionType { buying, selling }

extension ProductTransactionTypeExt on ProductTransactionType {
  int get value {
    switch (this) {
      case ProductTransactionType.buying:
        return 1;
      case ProductTransactionType.selling:
        return 2;
    }
  }

  String get string {
    switch (this) {
      case ProductTransactionType.buying:
        return "buying";
      case ProductTransactionType.selling:
        return "selling";
    }
  }
}

enum ServiceTransactionType { request, render }

extension ServiceTransactionTypeExt on ServiceTransactionType {
  int get value {
    switch (this) {
      case ServiceTransactionType.request:
        return 1;
      case ServiceTransactionType.render:
        return 2;
    }
  }

  String get string {
    switch (this) {
      case ServiceTransactionType.request:
        return "request";
      case ServiceTransactionType.render:
        return "render";
    }
  }
}
