import 'package:flutter/cupertino.dart';
import 'package:ui_collection/modules/schedule/domain/entities/home_card_entity.dart';
import 'package:ui_collection/widget/colors/common_color.dart';

class MenuCardWidget extends StatelessWidget {
  final HomeCardEntity card;
  const MenuCardWidget({Key? key, required this.card}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(vertical: 13.5),
      child: Column(
        children: [
          Icon(
            card.menuIcon,
            size: 30,
            color: CommonColors.green,
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            card.title,
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
          )
        ],
      ),
    );
  }
}
