import 'package:flutter/material.dart';

import '../../../core/mocked_entities/home/home_mocked_entities.dart';
import '../../../widget/app_bar/common_app_bar.dart';
import '../../../widget/bouncy/bouncy.dart';
import '../domain/entity/home_item_entity.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final itemList = HomeMockedEntities.get(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CommonAppBar(
        pageTitle: 'Home',
        centeredTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 15),
          Expanded(
            child: GridView.count(
              padding: const EdgeInsets.only(
                left: 15,
                right: 15,
                top: 10,
              ),
              crossAxisCount: 3,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              children: itemList
                  .map((item) => _mapItem(
                        item,
                        context,
                      ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }

  Bouncy _mapItem(HomeItemEntity item, BuildContext context) {
    return Bouncy(
      duration: const Duration(
        milliseconds: 100,
      ),
      onPressed: () {
        item.route.navigate(context);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(
                -2,
                3,
              ),
            ),
          ],
        ),
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    item.title,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
