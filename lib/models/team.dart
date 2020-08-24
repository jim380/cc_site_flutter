import 'package:flutter/material.dart';

class Team {
  final String name, bio, userPic;
  final int id;
  final Color color;

  Team({this.name, this.bio, this.userPic, this.id, this.color});
}

// List of demo feedbacks
List<Team> members = [
  Team(
    id: 1,
    name: "Jay Jie",
    bio:
        "Jay fell into the blockchain rabbit hole in 2016 and hasn’t been able to get out. He loves his pitbull and enjoys weight training.",
    userPic: "images/jay.jpg",
    color: Color(0xFFD9FFFC),
  ),
  Team(
    id: 2,
    name: "Ken Trueba",
    bio:
        "Coming from sales management Ken fulfills the missing element of the team. He enjoys cooking and hiking with his dogs.",
    userPic: "images/ken.jpg",
    color: Color(0xFFE4FFC7),
  ),
  Team(
    id: 3,
    name: "Artem Akatev",
    bio:
        "Artem juggles web development, blockchain, and cryptography. He enjoys working on cars, and playing basketball.",
    userPic: "images/art.jpeg",
    color: Color(0xFFFFF3DD),
  ),
  Team(
    id: 4,
    name: "Jason Maehr",
    bio:
        "Wharton School of Business graduate, ex-Wall Streeter, Jason looks out for the team with his experience. And kindness.",
    userPic: "images/jason.png",
    color: Color(0xFFFFE0E0),
  ),
];

String bio =
    'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore mag aliqua enim ad minim veniam.';
