import 'package:flutter/material.dart';
import '../../models/speedrun/speedrun.dart';

import '../widgets/game_title_image.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key key, this.id}) : super(key: key);
  final String id;

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  SeriesDetail _api;
  Future<Series> seriesDetail;

  @override
  void initState() {
    _api = SeriesDetail();
    seriesDetail = _api.request(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: FutureBuilder<Series>(
          future: seriesDetail,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return _waitLoading();
            }

            final data = snapshot.requireData;
            return SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  GameTitleImage(imgUrl: data.assets['coverLarge'] as String),
                  _spaceBox(height: 11),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      children: <Widget>[
                        Text(
                          data.nameInt,
                          style: Theme.of(context).textTheme.headline1,
                        ),
                        _spaceBox(height: 7),
                        // RichText(
                        //   text: TextSpan(
                        //     children: List.generate(
                        //       data.genre.length,
                        //       (i) {
                        //         return TextSpan(
                        //             text:
                        //                 '${data.genre[i]['name']} ');
                        //       },
                        //     ),
                        //     style: Theme.of(context).textTheme.caption,
                        //   ),
                        // ),
                        // _spaceBox(height: 9),
                        // RatingBar(
                        //   initialRating: data.rating,
                        //   // initialRating: 3,
                        //   direction: Axis.horizontal,
                        //   allowHalfRating: true,
                        //   itemCount: 10,
                        //   // ignore: lines_longer_than_80_chars
                        //   itemPadding: const EdgeInsets.symmetric(horizontal: 4),
                        //   itemBuilder: (context, _) => const Icon(
                        //     Icons.star,
                        //     color: Colors.amber,
                        //   ),
                        //   itemSize: 25,
                        //   onRatingUpdate: (rating) {
                        //     print(rating);
                        //   },
                        // ),
                        _spaceBox(height: 13),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Text(
                                  'Year',
                                  style: Theme.of(context).textTheme.caption,
                                ),
                                Text(
                                  '${DateTime.parse(data.created).year}',
                                  style: Theme.of(context).textTheme.subtitle1,
                                ),
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                Text(
                                  'abbreviation',
                                  style: Theme.of(context).textTheme.caption,
                                ),
                                Text(
                                  data.abbreviation,
                                  style: Theme.of(context).textTheme.subtitle1,
                                ),
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                Text(
                                  'weblink',
                                  style: Theme.of(context).textTheme.caption,
                                ),
                                Text(
                                  data.webLink,
                                  style: Theme.of(context).textTheme.subtitle1,
                                ),
                              ],
                            ),
                          ],
                        ),
                        _spaceBox(height: 13),
                        Text(
                          data.nameJap,
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              .apply(fontSizeFactor: 1.2),
                        ),
                        _spaceBox(height: 13),
                      ],
                    ),
                  ),
                  _spaceBox(height: 13),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _waitLoading() {
    return const Center(child: CircularProgressIndicator());
  }

  Widget _spaceBox({ double height = 15.0 }) {
    return SizedBox(height: height);
  }
}
