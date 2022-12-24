import 'package:flutter/material.dart';

class InputView extends StatelessWidget {
  const InputView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.black12,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  textAlign: TextAlign.end,
                  "1 + 2 + 3",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                const Divider(
                  color: Colors.white10,
                  thickness: 1,
                ),
                Text(
                  textAlign: TextAlign.end,
                  "6",
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ],
            ),
          )),
    );
  }
}
