import 'package:flutter/material.dart';

import '../../models/speedrun/speedrun.dart';
import '../widgets/homepage_featured_widget.dart';
import '../widgets/section_container.dart';
import '../widgets/series_container.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<List<Series>> seriesList;

  @override
  void initState() {
    super.initState();
    final _api = SeriesList();
    seriesList = _api.getSeriesList();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: _buildAppBar(),
        body: _buildBody(),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      actions: <Widget>[
        IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {})
      ],
      leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.black), onPressed: () {}),
      title: const Text(
        'Speedrun.com (Informal)',
        style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
    );
  }

  SingleChildScrollView _buildBody() {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height / 3,
            child: FutureBuilder<List<Series>>(
              future: seriesList,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return _waitLoading();
                }

                return HomepageFeaturedWidget(snapshot: snapshot);
            },
            ),
          ),
          _spaceBox(),
          SectionContainer(
            sectionTitle: 'My List',
            sectionList: Container(
              height: MediaQuery.of(context).size.height / 3,
              child: FutureBuilder<List<Series>>(
                future: seriesList,
                builder: (ctx, snapshot) {
                  if (!snapshot.hasData) {
                    return _waitLoading();
                  }

                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data.length,
                    itemBuilder: (ctx, id) {
                      return SeriesContainer(snapshot: snapshot.data[id]);
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _waitLoading() {
    return const Center(child: CircularProgressIndicator());
  }

  Widget _spaceBox() {
    return const SizedBox(height: 15);
  }
}
