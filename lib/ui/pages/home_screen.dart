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
  SeriesList _api;

  @override
  void initState() {
    super.initState();
    _api = SeriesList();
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

  Widget _middleList(List<Series> data, int id) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.red,
          boxShadow: [
            const BoxShadow(
              color: Colors.red,
              blurRadius: 2.5,
            )
          ],
        ),
        constraints: const BoxConstraints(minWidth: 100),
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(
          horizontal: 7,
          vertical: 5,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Text(data[id].nameInt,
            style: Theme.of(context)
                .textTheme
                .headline4
                .apply(color: Colors.white)));
  }

  Widget _waitLoading() {
    return const Center(child: CircularProgressIndicator());
  }

  Widget _spaceBox() {
    return const SizedBox(height: 15);
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
                if (snapshot.hasData) {
                  return HomepageFeaturedWidget(snapshot: snapshot);
                }

                return _waitLoading();
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 5),
            height: 100,
            child: FutureBuilder<List<Series>>(
              future: seriesList,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (ctx, id) {
                      return _middleList(snapshot.data, id);
                    },
                  );
                }
                return _waitLoading();
              },
            ),
          ),
          _spaceBox(),
          SectionContainer(
            sectionTitle: 'My List',
            child: Container(
              height: MediaQuery.of(context).size.height / 3,
              child: FutureBuilder<List<Series>>(
                future: seriesList,
                builder: (ctx, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data.length,
                      itemBuilder: (ctx, id) {
                        return SeriesContainer(snapshot: snapshot.data[id]);
                      },
                    );
                  }

                  return _waitLoading();
                },
              ),
            ),
          ),
        ],
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
}
