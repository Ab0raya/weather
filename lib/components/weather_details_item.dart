import 'package:flutter/material.dart';

class WeatherDetailsItem extends StatelessWidget {
  const WeatherDetailsItem({
    Key? key,
    required this.textColor,
    required this.firstElement,
    required this.firstText,
    required this.secElement,
    required this.secText,
    required this.thirdElement,
    required this.thirdText,
    required this.width,
  }) : super(key: key);
  final Color? textColor;
  final int firstElement;
  final int secElement;
  final String thirdElement;
  final String firstText;
  final String secText;
  final String thirdText;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 125,
        width: width,
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(30)),
        child: Padding(
          padding:
              const EdgeInsets.only(left: 30, top: 15, right: 30, bottom: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    firstText,
                    style: TextStyle(
                        color: textColor,
                        fontSize: 30,
                        fontFamily: 'Reem Kufi Fun'),
                  ),
                  Text(
                    '$firstElement',
                    style: TextStyle(
                        color: textColor,
                        fontSize: 30,
                        fontFamily: 'Reem Kufi Fun'),
                  ),
                ],
              ),
              SizedBox(
                  height: 100,
                  child: VerticalDivider(
                    color: Colors.white.withOpacity(0.3),
                    thickness: 3,
                  )),
              Column(
                children: [
                  Text(
                    secText,
                    style: TextStyle(
                        color: textColor,
                        fontSize: 30,
                        fontFamily: 'Reem Kufi Fun'),
                  ),
                  Text(
                    '$secElement',
                    style: TextStyle(
                        color: textColor,
                        fontSize: 30,
                        fontFamily: 'Reem Kufi Fun'),
                  ),
                ],
              ),
              SizedBox(
                  height: 100,
                  child: VerticalDivider(
                    color: Colors.white.withOpacity(0.3),
                    thickness: 3,
                  )),
              Column(
                children: [
                  Text(
                    thirdText,
                    style: TextStyle(
                        color: textColor,
                        fontSize: 30,
                        fontFamily: 'Reem Kufi Fun'),
                  ),
                  Text(
                    thirdElement,
                    style: TextStyle(
                        color: textColor,
                        fontSize: 30,
                        fontFamily: 'Reem Kufi Fun'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
