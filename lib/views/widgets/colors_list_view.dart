import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({super.key, required this.isActive, required this.color});
  final bool isActive;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return isActive
        ?  CircleAvatar(
            backgroundColor: Colors.white,
            radius: 38,
            child: CircleAvatar(
              backgroundColor: color,
              radius: 34,
            ),
          )
        :  CircleAvatar(
            backgroundColor: color,
            radius: 38,
          );
  }
}

class ColorsListView extends StatefulWidget {
  const ColorsListView({super.key});

  @override
  State<ColorsListView> createState() => _ColorsListViewState();
}

class _ColorsListViewState extends State<ColorsListView> {
  int currentIndex = 0;
  List<Color> colors = const [
    Color(0xffB5BA72),
    Color(0xff99907D),
    Color(0xff7D6F86),
    Color(0xff585191),
    Color(0xff4F359B),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: colors.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 6,
        ),
        child: GestureDetector(
          onTap: () {
            currentIndex = index;
            setState(() {});
          },
          child: ColorItem(
            color: colors[index],
            isActive: index == currentIndex,
          ),
        ),
      ),
    );
  }
}
