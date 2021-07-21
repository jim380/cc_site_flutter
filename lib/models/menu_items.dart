import 'package:equatable/equatable.dart';

class Menu extends Equatable {
  final String? title;
  final SelectionSource? source;

  Menu({this.title, this.source});

  @override
  List<Object> get props => [title!, source!];
}

enum SelectionSource { fromScroll, fromButtonClick, fromBrowserAddressBar }

// Demo List of my works
List<Menu> menu = [
  Menu(
    title: "About Us",
  ),
  Menu(
    title: "Services",
  ),
  Menu(
    title: "Blog",
  ),
  Menu(
    title: "Contact",
  ),
];
