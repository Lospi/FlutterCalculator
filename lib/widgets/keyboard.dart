import 'package:flutter/material.dart';
import 'package:flutter_calculator/widgets/keyboard_button.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Keyboard extends StatelessWidget {
  const Keyboard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: StaggeredGrid.count(
        crossAxisCount: 4,
        mainAxisSpacing: 5,
        crossAxisSpacing: 4,
        children: [
          StaggeredGridTile.count(
              crossAxisCellCount: 1,
              mainAxisCellCount: 1,
              child: KeyboardButton(
                buttonWidget: Text(
                  "AC",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              )),
          const StaggeredGridTile.count(
              crossAxisCellCount: 1,
              mainAxisCellCount: 1,
              child: KeyboardButton(
                buttonWidget: FaIcon(
                  FontAwesomeIcons.plusMinus,
                  color: Colors.white70,
                ),
              )),
          const StaggeredGridTile.count(
              crossAxisCellCount: 1,
              mainAxisCellCount: 1,
              child: KeyboardButton(
                buttonWidget: Icon(
                  Icons.percent,
                  color: Colors.white70,
                ),
              )),
          const StaggeredGridTile.count(
              crossAxisCellCount: 1,
              mainAxisCellCount: 1,
              child: KeyboardButton(
                buttonWidget: FaIcon(
                  FontAwesomeIcons.divide,
                  color: Colors.white70,
                ),
              )),
          const StaggeredGridTile.count(
              crossAxisCellCount: 1,
              mainAxisCellCount: 1,
              child: KeyboardButton(
                buttonWidget: FaIcon(
                  FontAwesomeIcons.seven,
                  color: Colors.white70,
                ),
              )),
          const StaggeredGridTile.count(
              crossAxisCellCount: 1,
              mainAxisCellCount: 1,
              child: KeyboardButton(
                buttonWidget: FaIcon(
                  FontAwesomeIcons.eight,
                  color: Colors.white70,
                ),
              )),
          const StaggeredGridTile.count(
              crossAxisCellCount: 1,
              mainAxisCellCount: 1,
              child: KeyboardButton(
                buttonWidget: FaIcon(
                  FontAwesomeIcons.nine,
                  color: Colors.white70,
                ),
              )),
          const StaggeredGridTile.count(
            crossAxisCellCount: 1,
            mainAxisCellCount: 1,
            child: KeyboardButton(
              buttonWidget: FaIcon(
                FontAwesomeIcons.xmark,
                color: Colors.white70,
              ),
            ),
          ),
          const StaggeredGridTile.count(
              crossAxisCellCount: 1,
              mainAxisCellCount: 1,
              child: KeyboardButton(
                buttonWidget: FaIcon(
                  FontAwesomeIcons.four,
                  color: Colors.white70,
                ),
              )),
          const StaggeredGridTile.count(
              crossAxisCellCount: 1,
              mainAxisCellCount: 1,
              child: KeyboardButton(
                buttonWidget: FaIcon(
                  FontAwesomeIcons.five,
                  color: Colors.white70,
                ),
              )),
          const StaggeredGridTile.count(
            crossAxisCellCount: 1,
            mainAxisCellCount: 1,
            child: KeyboardButton(
              buttonWidget: FaIcon(
                FontAwesomeIcons.six,
                color: Colors.white70,
              ),
            ),
          ),
          const StaggeredGridTile.count(
              crossAxisCellCount: 1,
              mainAxisCellCount: 1,
              child: KeyboardButton(
                buttonWidget: FaIcon(
                  FontAwesomeIcons.minus,
                  color: Colors.white70,
                ),
              )),
          const StaggeredGridTile.count(
              crossAxisCellCount: 1,
              mainAxisCellCount: 1,
              child: KeyboardButton(
                buttonWidget: FaIcon(
                  FontAwesomeIcons.one,
                  color: Colors.white70,
                ),
              )),
          const StaggeredGridTile.count(
              crossAxisCellCount: 1,
              mainAxisCellCount: 1,
              child: KeyboardButton(
                buttonWidget: FaIcon(
                  FontAwesomeIcons.two,
                  color: Colors.white70,
                ),
              )),
          const StaggeredGridTile.count(
              crossAxisCellCount: 1,
              mainAxisCellCount: 1,
              child: KeyboardButton(
                buttonWidget: FaIcon(
                  FontAwesomeIcons.three,
                  color: Colors.white70,
                ),
              )),
          const StaggeredGridTile.count(
              crossAxisCellCount: 1,
              mainAxisCellCount: 1,
              child: KeyboardButton(
                buttonWidget: FaIcon(
                  FontAwesomeIcons.plus,
                  color: Colors.white70,
                ),
              )),
          const StaggeredGridTile.count(
              crossAxisCellCount: 2,
              mainAxisCellCount: 1,
              child: KeyboardButton(
                buttonWidget: FaIcon(
                  FontAwesomeIcons.zero,
                  color: Colors.white70,
                ),
              )),
          StaggeredGridTile.count(
              crossAxisCellCount: 1,
              mainAxisCellCount: 1,
              child: KeyboardButton(
                buttonWidget: Text(
                  ".",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              )),
          const StaggeredGridTile.count(
              crossAxisCellCount: 1,
              mainAxisCellCount: 1,
              child: KeyboardButton(
                buttonWidget: FaIcon(
                  FontAwesomeIcons.equals,
                  color: Colors.white70,
                ),
              )),
        ],
      ),
    );
  }
}
