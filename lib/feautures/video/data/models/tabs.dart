enum VideoTab {
  products,
  services,
  all,
}

extension VideoTabsExtension on VideoTab {
  String get name {
    switch (this) {
      case VideoTab.products:
        return 'Products';
      case VideoTab.services:
        return 'Services';
      case VideoTab.all:
        return 'All';
      default:
        return '';
    }
  }
}
