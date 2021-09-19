import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HaikuCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Column(
          children: [
            SvgPicture.network(
              'https://avatars.dicebear.com/api/male/neil.svg',
              fit: BoxFit.contain,
              height: 40,
            ),
            Text(
              "CEO PJC",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        title: Text(
          'Paumanhin sa \n Matagal na pahinga \n Dito na ako.',
          textAlign: TextAlign.left,
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
