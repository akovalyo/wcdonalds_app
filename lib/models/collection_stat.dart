class CollectionStat {
  static const workerSymbol = 'wcdonalds_workers';
  static const wanagerSymbol = 'wcdonalds_wanagers';
  final String symbol;
  final String imagePath;
  int floorPrice;
  int totalListed;

  CollectionStat({
    required this.symbol,
    required this.imagePath,
    this.floorPrice = 0,
    this.totalListed = 0,
  });

  void clear() {
    floorPrice = 0;
    totalListed = 0;
  }

  void update(int floor, int listed) {
    floorPrice = floor;
    totalListed = listed;
  }
}
