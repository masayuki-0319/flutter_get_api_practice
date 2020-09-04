import 'package:flutter/material.dart';

class SectionContainer extends StatelessWidget {
  const SectionContainer(
      {Key key, @required this.sectionList, @required this.sectionTitle})
      : super(key: key);

  final Widget sectionList;
  final String sectionTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(
                sectionTitle,
                style: const TextStyle(
                  fontSize: 19,
                  fontWeight:
                  FontWeight.bold
                ),
              ),
              const Spacer(),
              const Icon(Icons.arrow_forward),
              const SizedBox(width: 15),
            ],
          ),
          const SizedBox(
            height: 13,
          ),
          sectionList,
        ],
      ),
    );
  }
}
