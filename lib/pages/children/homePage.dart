import 'package:flutter/material.dart';
import 'package:learn/components/new_user_greeting.dart';
import 'package:learn/components/user_profile.dart';
import 'package:learn/utils/fontstyles.dart';
import 'package:learn/widgets.dart';
import 'package:learn/classes.dart';
import 'package:learn/utils/activitiesList.dart';
import 'package:provider/provider.dart';

class ChildrenHomePage extends StatelessWidget {
  final ValueNotifier<double> pagePosition;

  const ChildrenHomePage({required this.pagePosition, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    VolatileChildren child = Provider.of<VolatileChildren>(context);
    return Scaffold(
      appBar: LearnAppBar(
        gradient: const LinearGradient(
          colors: [Color(0xFFFFFFFF), Color(0xFFFFFFFF)],
        ),
        pageIndex: 1,
        pagePosition: pagePosition.value,
        superWidget: _buildStreakSection(),
        child: Container(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
            child: NewUserGreetings(child: child)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Atividades em\nandamento',
              style: TextStyle(
                  color: Color(0xFF0C0620),
                  fontFamily: "Spartan",
                  fontSize: 28,
                  fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 16),
            ActivitieCard(
              activitie: ActivitieCardStatic(
                activitie: activitiesList[child.value.lastActivitie],
                isLocked: false,
                withProgress: true,
                progress: getProgress(child.value.lastActivitie,
                    child.value.activities[child.value.lastActivitie]),
              ),
              child: child,
            ),
            const SizedBox(height: 16),
            AchievementsWidget(
              childAcheivments: child.value.acheivments,
            ),
            const SizedBox(
              height: 80,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStreakSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 232,
          height: 88,
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFFFF657D),
            borderRadius: BorderRadius.circular(24),
          ),
          child: Row(
            children: [
              Image.asset('assets/images/appIcons/flame.png',
                  color: const Color(0XFFFFFFFF)),
              const SizedBox(width: 8),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Streak de 14 dias', style: FontStyles.body2BoldWhite),
                  const SizedBox(height: 8),
                  Text('32 atividades concluídas',
                      style: FontStyles.footone1MediumWhite),
                ],
              ),
            ],
          ),
        ),
        Container(
          width: 112,
          height: 88,
          padding: EdgeInsets.only(left: 16),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFFECF5FF), Color(0xFFCDE3FD)],
            ),
            borderRadius: BorderRadius.circular(24),
          ),
          child: Stack(
            children: [
              Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Text(
                      'Dima II',
                      style: FontStyles.body2MediumBlack,
                    ),
                  )),
              Align(
                alignment: Alignment.bottomRight,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(24),
                  ),
                  child: Image.asset('assets/images/appIcons/daimond.png',
                      height: 44, width: 72, fit: BoxFit.cover),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCard(String title, String subtitle, Color color) {
    return Container(
      width: subtitle.isEmpty ? 112 : 232,
      height: 88,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: FontStyles.body2MediumWhite),
          if (subtitle.isNotEmpty) ...[
            SizedBox(height: 8),
            Text(subtitle, style: FontStyles.footone1MediumWhite),
          ],
        ],
      ),
    );
  }
}
