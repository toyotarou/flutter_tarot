// ignore_for_file: must_be_immutable, non_constant_identifier_names, use_decorated_box

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tarot/screens/alert/tarot_celtic_cross_alert.dart';

import '../screens/alert/tarot_list_alert.dart';
import '../screens/alert/tarot_recently_alert.dart';
import '../screens/tarot_ranking_screen.dart';
import '../state/tarot_all/tarot_all_viewmodel.dart';
import '../utility/utility.dart';
import '_components/_tarot_dialog.dart';
import '_components/drawer_card.dart';

class DefaultLayout extends ConsumerWidget {
  DefaultLayout(
      {super.key,
      required this.widget,
      required this.title,
      required this.isTitleDisplay,
      required this.isDrawerDisplay});

  final String title;
  final Widget widget;
  final bool isTitleDisplay;
  final bool isDrawerDisplay;

  final Utility _utility = Utility();

  late WidgetRef _ref;

  ///
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _ref = ref;

    return Scaffold(
      appBar: isTitleDisplay
          ? AppBar(
              title: Text(title),
              backgroundColor: Colors.transparent,
              flexibleSpace: Stack(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/image/appBarBack.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    decoration:
                        BoxDecoration(color: Colors.black.withOpacity(0.5)),
                  ),
                ],
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    TarotDialog(
                      context: context,
                      widget: TarotRecentlyAlert(),
                    );
                  },
                  icon: const Icon(Icons.pages),
                ),
                IconButton(
                  onPressed: () {
                    TarotDialog(
                      context: context,
                      widget: TarotListAlert(),
                    );
                  },
                  icon: const Icon(Icons.list),
                ),

                //
                // IconButton(
                //   onPressed: () {
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(builder: (context) => TarotHistoryScreen()),
                //     );
                //   },
                //   icon: const Icon(Icons.calendar_today),
                // ),
                //

                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TarotRankingScreen()),
                    );
                  },
                  icon: const Icon(Icons.trending_down_outlined),
                ),

                IconButton(
                  onPressed: () {
                    TarotDialog(
                      context: context,
                      widget: TarotCelticCrossAlert(),
                    );
                  },
                  icon: const Icon(Icons.card_giftcard),
                ),
              ],
            )
          : null,
      body: Stack(
        fit: StackFit.expand,
        children: [
          _utility.getBackGround(),
          SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: widget,
            ),
          ),
        ],
      ),
      drawer: dispDrawer(context),
    );
  }

  ///
  Widget dispDrawer(BuildContext context) {
    final list = <Widget>[];

    _ref.watch(tarotCategoryAllProvider).when(
          data: (value) {
            value.record['big']?.forEach((element) =>
                list.add(DrawerCard(data: element, category: 'big')));

            value.record['cups']?.forEach((element) =>
                list.add(DrawerCard(data: element, category: 'cups')));

            value.record['pentacles']?.forEach((element) =>
                list.add(DrawerCard(data: element, category: 'pentacles')));

            value.record['swords']?.forEach((element) =>
                list.add(DrawerCard(data: element, category: 'swords')));

            value.record['wands']?.forEach((element) =>
                list.add(DrawerCard(data: element, category: 'wands')));
          },
          error: (e, s) => Container(),
          loading: Container.new,
        );

    return Drawer(
      backgroundColor: Colors.black.withOpacity(0.2),
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(right: 10),
          decoration: BoxDecoration(
            border: Border(
              right: BorderSide(
                color: Colors.yellowAccent.withOpacity(0.5),
                width: 5,
              ),
            ),
          ),
          child: Column(
            children: [
              const SizedBox(height: 100),
              Column(children: list),
            ],
          ),
        ),
      ),
    );
  }

  ///
  Widget makeDrawerTitle({required String title}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(color: Colors.grey.withOpacity(0.3)),
      child: Text(title),
    );
  }
}
