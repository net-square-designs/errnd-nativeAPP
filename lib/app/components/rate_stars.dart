import 'package:flutter/material.dart';

class Rate extends StatelessWidget {
  final int starNo;

  Rate({this.starNo});
  @override
  Widget build(BuildContext context) {
    return getRateAmount();
  }

  void initState() {}

  getRateAmount() {
    if (starNo == 0) {
      return noStar();
    }
    if (starNo == 1) {
      return oneStar();
    }
    if (starNo == 2) {
      return twoStar();
    }
    if (starNo == 3) {
      return threeStar();
    }
    if (starNo == 4) {
      return fourStar();
    }
    if (starNo == 5) {
      return fiveStar();
    }
  }

  Widget fiveStar() {
    return new Row(
      children: <Widget>[
        new Icon(
          Icons.star,
          color: Colors.yellow,
          size: 14,
        ),
        new Icon(
          Icons.star,
          color: Colors.yellow,
          size: 14,
        ),
        new Icon(
          Icons.star,
          color: Colors.yellow,
          size: 14,
        ),
        new Icon(
          Icons.star,
          color: Colors.yellow,
          size: 14,
        ),
        new Icon(
          Icons.star,
          color: Colors.yellow,
          size: 14,
        ),
      ],
    );
  }

  Widget fourStar() {
    return new Row(
      children: <Widget>[
        new Icon(
          Icons.star_border,
          color: Colors.white,
          size: 14,
        ),
        new Icon(
          Icons.star,
          color: Colors.yellow,
          size: 14,
        ),
        new Icon(
          Icons.star,
          color: Colors.yellow,
          size: 14,
        ),
        new Icon(
          Icons.star,
          color: Colors.yellow,
          size: 14,
        ),
        new Icon(
          Icons.star,
          color: Colors.yellow,
          size: 14,
        ),
      ],
    );
  }

  Widget threeStar() {
    return new Row(
      children: <Widget>[
        new Icon(
          Icons.star_border,
          color: Colors.white,
          size: 14,
        ),
        new Icon(
          Icons.star_border,
          color: Colors.white,
          size: 14,
        ),
        new Icon(
          Icons.star,
          color: Colors.yellow,
          size: 14,
        ),
        new Icon(
          Icons.star,
          color: Colors.yellow,
          size: 14,
        ),
        new Icon(
          Icons.star,
          color: Colors.yellow,
          size: 14,
        ),
      ],
    );
  }

  Widget twoStar() {
    return new Row(
      children: <Widget>[
        new Icon(
          Icons.star_border,
          color: Colors.white,
          size: 14,
        ),
        new Icon(
          Icons.star_border,
          color: Colors.white,
          size: 14,
        ),
        new Icon(
          Icons.star_border,
          color: Colors.white,
          size: 14,
        ),
        new Icon(
          Icons.star,
          color: Colors.yellow,
          size: 14,
        ),
        new Icon(
          Icons.star,
          color: Colors.yellow,
          size: 14,
        ),
      ],
    );
  }

  Widget oneStar() {
    return new Row(
      children: <Widget>[
        new Icon(
          Icons.star_border,
          color: Colors.white,
          size: 14,
        ),
        new Icon(
          Icons.star_border,
          color: Colors.white,
          size: 14,
        ),
        new Icon(
          Icons.star_border,
          color: Colors.white,
          size: 14,
        ),
        new Icon(
          Icons.star_border,
          color: Colors.white,
          size: 14,
        ),
        new Icon(
          Icons.star,
          color: Colors.yellow,
          size: 14,
        ),
      ],
    );
  }

  Widget noStar() {
    return new Row(
      children: <Widget>[
        new Icon(
          Icons.star_border,
          color: Colors.white,
          size: 14,
        ),
        new Icon(
          Icons.star_border,
          color: Colors.white,
          size: 14,
        ),
        new Icon(
          Icons.star_border,
          color: Colors.white,
          size: 14,
        ),
        new Icon(
          Icons.star_border,
          color: Colors.white,
          size: 14,
        ),
        new Icon(
          Icons.star_border,
          color: Colors.white,
          size: 14,
        ),
      ],
    );
  }
}
