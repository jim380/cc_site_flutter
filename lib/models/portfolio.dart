class Portfolio {
  final String image, category, title;
  final int id;

  Portfolio({this.id, this.image, this.category, this.title});
}

// Demo List of my works
List<Portfolio> portfolio = [
  Portfolio(
    id: 1,
    title: "Cosmos",
    category: "Staking",
    image: "images/cosmos.png",
  ),
  Portfolio(
    id: 2,
    title: "Celo",
    category: "Staking",
    image: "images/celo.png",
  ),
  Portfolio(
    id: 3,
    title: "IRISnet",
    category: "Staking",
    image: "images/iris.png",
  ),
  Portfolio(
    id: 4,
    title: "Wanchain",
    category: "Staking",
    image: "images/wanchain.png",
  ),
];
