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
    url:
        "https://www.mintscan.io/cosmos/validators/cosmosvaloper1pjmngrwcsatsuyy8m3qrunaun67sr9x7z5r2qs",
  ),
  Portfolio(
    id: 2,
    title: "Celo",
    category: "Staking",
    image: "assets/images/celo.png",
    url: "https://www.thecelo.com/group/cyphercore",
  ),
  Portfolio(
      id: 3,
      title: "IRISnet",
      category: "Staking",
      image: "assets/images/iris.png",
      url:
          "https://www.mintscan.io/iris/validators/iva1kfhee2nqrg64krqa97q3ufw9d0phzp3jjq3c4j"),
  Portfolio(
      id: 4,
      title: "Osmosis",
      category: "Staking",
      image: "assets/images/osmosis.png",
      url:
          "https://www.mintscan.io/osmosis/validators/osmovaloper1pjmngrwcsatsuyy8m3qrunaun67sr9x74vvvdk"),
  Portfolio(
      id: 5,
      title: "Regen",
      category: "Staking",
      image: "assets/images/regen.png",
      url:
          "https://regen.aneka.io/validators/regenvaloper1t2ek3whhllrlkq44phrc729kpw7dg9wkd5fkhx"),
  Portfolio(
      id: 6,
      title: "Skale",
      category: "Staking",
      image: "assets/images/skale.png",
      url: "https://hubble.figment.io/skale/chains/mainnet/validators/3"),
  Portfolio(
      id: 7,
      title: "Akash",
      category: "Staking",
      image: "assets/images/akash.png",
      url:
          "https://www.mintscan.io/akash/validators/akashvaloper1t2ek3whhllrlkq44phrc729kpw7dg9wkfguwsr"),
];
