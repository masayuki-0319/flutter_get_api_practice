import 'package:dart_speedrun_api/dart_speedrun_api.dart';
import 'package:flutter/material.dart';

class HomepageFeaturedWidget extends StatelessWidget {
  const HomepageFeaturedWidget({
    Key key,
    this.snapshot,
  }) : super(key: key);

  final AsyncSnapshot<List<Series>> snapshot;

  @override
  Widget build(BuildContext context) {
    final data = snapshot.requireData;
    return PageView.builder(
      itemCount: data.length,
      itemBuilder: (ctx, id) {
        return Container(
          margin: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                  blurRadius: 5,
                  color: Colors.grey[400],
                  offset: const Offset(0, 3))
            ],
          ),
          child: Stack(
            children: <Widget>[
              Positioned.fill(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    data[id].assets['cover-large'].uri,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(15),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    ),
                    color: Colors.black45,
                  ),
                  child: Text(
                    data[id].names.international,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 23,
                    ),
                    softWrap: true,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
