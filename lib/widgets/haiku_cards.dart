import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HaikuCard extends StatelessWidget {
  final String haiku;
  final String author;

  HaikuCard({required this.haiku, required this.author});
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      elevation: 2,
      child: ListTile(
        leading: Column(
          children: [
            SvgPicture.network(
              'https://avatars.dicebear.com/api/croodles-neutral/${this.author}.svg',
              fit: BoxFit.contain,
              height: 40,
            ),
            Text(
              '${this.author}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        title: Text(
          '${this.haiku}',
          textAlign: TextAlign.left,
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
