import 'package:flutter/material.dart';

class Poketmon {
  Poketmon({
    required this.name,
    this.level = 0,
    this.skill = const ['empty'],
    required this.imgURL,
    required this.primaryColor,
    required this.seconderyColor,
  }) {
    image = Image.network(imgURL);
  }

  final String name;
  final List<String> skill;
  final int level;
  final String imgURL;
  final Color primaryColor;
  final Color seconderyColor;
  Image? image;
}

class PoketmonSkill extends StatelessWidget {
  const PoketmonSkill({
    Key? key,
    required this.skill,
  }) : super(key: key);

  final String skill;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.check_circle_outline),
        Padding(
          padding: EdgeInsets.all(8),
          child: Text(skill),
        )
      ],
    );
  }
}

class PoketmonSkillList extends StatelessWidget {
  const PoketmonSkillList({Key? key, this.skills}) : super(key: key);

  final List<String>? skills;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: skills == null
          ? [Text('아무것도 들어있지 않습니다.')]
          : skills!.map((skill) {
              return PoketmonSkill(skill: skill);
            }).toList(),
    );
  }
}

class TitleSubTitle extends StatelessWidget {
  const TitleSubTitle({Key? key, required this.title, required this.subTitle})
      : super(key: key);

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    const titleStyle = TextStyle(fontSize: 24, color: Colors.white);
    const subTitleStyle = TextStyle(fontSize: 40, color: Colors.white);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: titleStyle,
        ),
        Text(
          subTitle,
          style: subTitleStyle,
        ),
      ],
    );
  }
}

class PoketmonDetails extends StatelessWidget {
  const PoketmonDetails(
      {Key? key, required this.imageURL, required this.poketmon})
      : super(key: key);

  final Poketmon poketmon;
  final String imageURL;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(24),
          child: CircleAvatar(
            backgroundImage: poketmon.image!.image,
            maxRadius: 120,
          ),
        ),
        const Divider(
          color: Colors.grey,
          thickness: 1,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TitleSubTitle(title: 'Name', subTitle: poketmon.name),
              TitleSubTitle(title: 'Level', subTitle: 'Lv.${poketmon.level}'),
              PoketmonSkillList(
                skills: poketmon.skill,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
