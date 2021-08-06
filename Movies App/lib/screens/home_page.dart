import 'package:flutter/material.dart';
import '../widgets/movie_tabs.dart';
import '../widgets/movie_carousel_widget.dart';
import '../domain/entity/movie_entity.dart';
import '../models/api_response.dart';
import '../models/movie_model.dart';
import '../services/api_service.dart';
import '../services/api_services.dart';
import '../core_services/gateway_service.dart';

// ignore: must_be_immutable
class MyHomePage extends StatefulWidget {
  Gateway? gateway;
  IApi? api;

  MyHomePage(this.gateway) {
    // gateway = Gateway(ServiceConfig());
    api = ApiServices(gateway);
  }

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool loadData = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Future Providers'),
      //   centerTitle: true,
      //   // leading: Image.asset('assets/pngs/logo.png'),
      // ),
      body: FutureBuilder(
        future: widget.api!.getTrending(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<MovieEntity>? _movies =
                (snapshot.data as ApiResponse<List<MovieEntity>>?)!.model;
            return buildBody(context, _movies);
          }
          if (snapshot.hasError) {
            return Center(
              child: Text('${snapshot.error}'),
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
      // Center(
      //   child: loadData
      //       ? FutureBuilder(
      //           future: Provider.of<PostProvider>(context, listen: false)
      //               .fetchAllPosts(),
      //           builder: (context, snapshot) {
      //             if (snapshot.hasData) {
      //               List<PostModel> sd = snapshot.data as List<PostModel>;
      //               return Text('${sd.length}');
      //             } else if (snapshot.hasError) {
      //               return Text('${snapshot.error}');
      //             }
      //             return CircularProgressIndicator();
      //           },
      //         )
      //       : Text(''),
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // setState(() {
          //   loadData = true;
          // });
          IApi api = ApiServices(widget.gateway);
          ApiResponse _apiResponse = await api.getTrending();
          List<MovieModel> _list =
              _apiResponse.statusCode == 200 ? _apiResponse.model : null;
          print('_list.length');
          print(_list.length);
          print(_list);

          _apiResponse = await api.getPopular();
          _list = _apiResponse.statusCode == 200 ? _apiResponse.model : null;
          print('popular _list.length');
          print(_list.length);
          print(_list);

          _apiResponse = await api.getUpcoming();
          _list = _apiResponse.statusCode == 200 ? _apiResponse.model : null;
          print('upcoming _list.length');
          print(_list.length);
          print(_list);

          _apiResponse = await api.getPlayingNow();
          _list = _apiResponse.statusCode == 200 ? _apiResponse.model : null;
          print('playing now _list.length');
          print(_list.length);
          print(_list);
        },
        tooltip: 'Get records',
        child: Icon(Icons.download),
      ),
    );
  }

  Widget buildBody(BuildContext context, List<MovieEntity>? movies) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          FractionallySizedBox(
            alignment: Alignment.topCenter,
            heightFactor: 0.6,
            child: MovieCarouselWidget(
              movies: movies!,
              defaultIndex: 0,
            ),
          ),
          FractionallySizedBox(
            alignment: Alignment.bottomCenter,
            heightFactor: 0.4,
            child: MovieTabs(
              movies: movies,
            ),
          ),
        ],
      ),
    );
  }

  // BlocProvider<MovieCarouselBloc>(
  //   create: (context) => _movieCarouselBloc!,
  //   child: Scaffold(
  //     body: BlocBuilder<MovieCarouselBloc, MovieCarouselBlocState>(
  //       bloc: _movieCarouselBloc!,
  //       builder: (context, state) {
  //         print('state');
  //         print(state);
  //         print(state is MovieCarouselLoaded);
  //         if (state is MovieCarouselLoaded) {
  //           return Stack(
  //             fit: StackFit.expand,
  //             children: [
  //               FractionallySizedBox(
  //                 alignment: Alignment.topCenter,
  //                 heightFactor: 0.6,
  //                 child: MovieCarouselWidget(
  //                   movies: state.movies!,
  //                   defaultIndex: state.defaultIndex,
  //                 ),
  //               ),
  //               FractionallySizedBox(
  //                 alignment: Alignment.bottomCenter,
  //                 heightFactor: 0.4,
  //                 child: Placeholder(
  //                   color: Colors.white,
  //                 ),
  //               ),
  //             ],
  //           );
  //         }
  //         return SizedBox.shrink();
  //       },
  //     ),
  //   ),
  // );
//   }
}
