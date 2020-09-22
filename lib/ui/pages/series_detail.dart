import 'package:dart_speedrun_api/dart_speedrun_api.dart';
import 'package:flutter/material.dart';
import '../widgets/game_title_image.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key key, this.id}) : super(key: key);
  final String id;

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  SeriesApi _api;
  Future<Series> seriesDetail;

  @override
  void initState() {
    _api = SeriesApi();
    seriesDetail = _api.requestDetail(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return FutureBuilder<Series>(
      future: seriesDetail,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return _waitLoading();
        }

        final data = snapshot.requireData;
        return SingleChildScrollView(
          child: Column(
            children: <Widget>[
              GameTitleImage(
                imageUrl: data.assets['cover-large'].uri,
                title: data.names.international,
              ),
              _spaceBox(height: 11),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: <Widget>[
                    Text(
                      data.names.international,
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    _spaceBox(height: 7),
                    _spaceBox(height: 13),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Text(
                              'Year: ',
                              style: Theme.of(context).textTheme.caption,
                            ),
                            Text(
                              'null',
                              // '${DateTime?.parse(data.created)?.year}',
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
                              data.weblink,
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              _spaceBox(height: 13),
            ],
          ),
        );
      },
    );
  }

  Widget _waitLoading() {
    return const Center(child: CircularProgressIndicator());
  }

  Widget _spaceBox({double height = 15.0}) {
    return SizedBox(height: height);
  }
}
