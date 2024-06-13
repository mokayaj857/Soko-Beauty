enum VideoTab {
  all,
  products,
  services,
}

extension VideoTabsExtension on VideoTab {
  String get name {
    switch (this) {
      case VideoTab.products:
        return 'Products';
      case VideoTab.services:
        return 'Services';
      case VideoTab.all:
        return 'For You';
      default:
        return '';
    }
  }
}
