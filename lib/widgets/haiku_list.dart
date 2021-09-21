import 'package:flutter/material.dart';
import 'package:fortis_haiku_mobile/widgets/haiku_cards.dart';

import 'models/haiku.dart';

class HaikuList extends StatelessWidget {
  final List<Haiku> haikus;
  HaikuList({required this.haikus});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 550,
      child: ListView.builder(
        itemBuilder: (ctx, i) {
          return HaikuCard(haiku: haikus[i].haiku, author: haikus[i].author);
        },
        itemCount: haikus.length,
      ),
    );
  }
}
