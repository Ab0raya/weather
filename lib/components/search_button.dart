import 'package:flutter/material.dart';

class SearchButton extends StatelessWidget {
  final Function()? tapped;
  final double width;
  final Color? color;

  const SearchButton(
      {required this.tapped, required this.width, required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: tapped,
        child: Container(
          height: 80,
          width: width,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            children: [
              Icon(
                Icons.search,
                color: color,
                size: 50,
              ),
              Text(
                'City Search',
                style: TextStyle(
                    color: color, fontSize: 30, fontFamily: 'Reem Kufi Fun'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
