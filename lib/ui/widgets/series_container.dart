import 'package:flutter/material.dart';
import '../../models/speedrun/speedrun.dart';

class SeriesContainer extends StatelessWidget {
  const SeriesContainer({
    Key key,
    this.snapshot,
  }) : super(key: key);

  final Series snapshot;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (ctx) => DetailsScreen(id: snapshot.id),
        //   ),
        // );
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 2.5,
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                blurRadius: 5,
                color: Colors.grey[400],
                offset: const Offset(0, 3)
            ),
          ],
        ),
        child: Stack(
          children: <Widget>[
            Positioned.fill(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  snapshot.assets['cover-large']['uri'] as String,
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
                  snapshot.nameInt,
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
      ),
    );
  }
}
