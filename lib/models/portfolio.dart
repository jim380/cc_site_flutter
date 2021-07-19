class Portfolio {
  final String? image, category, title, url;
  final int? id;

  Portfolio({this.id, this.image, this.category, this.title, this.url});
}

// Demo List of my works
List<Portfolio> portfolio = [
  Portfolio(
    id: 1,
    title: "Cosmos",
    category: "Staking",
    image: "assets/images/cosmos.png",
    url: "",
  ),
  Portfolio(
    id: 2,
    title: "Celo",
    category: "Staking",
    image: "assets/images/celo.png",
    url: "",
  ),
  Portfolio(
      id: 3,
      title: "IRISnet",
      category: "Staking",
      image: "assets/images/iris.png",
      url: ""),
  Portfolio(
    id: 4,
    title: "Wanchain",
    category: "Staking",
    image: "assets/images/wanchain.png",
  ),
  Portfolio(
    id: 5,
    title: "Band Protocol",
    category: "Staking",
    image: "assets/images/band.png",
  ),
  Portfolio(
      id: 6,
      title: "Skale",
      category: "Staking",
      image: "assets/images/skale.png",
      url: ""),
  Portfolio(
      id: 7,
      title: "Akash",
      category: "Staking",
      image: "assets/images/akash.png",
      url: ""),
];
