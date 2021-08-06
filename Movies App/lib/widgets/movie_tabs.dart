import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../core_services/gateway_service.dart';
import '../core_services/service_config.dart';
import '../providers/movie_category_provider.dart';
import '../services/api_service.dart';
import '../services/api_services.dart';
import 'package:provider/provider.dart';
import '../domain/entity/movie_entity.dart';
import '../models/api_constants.dart';
import '../models/api_response.dart';
import '../models/movie_model.dart';
import '../themes/app_color.dart';
import '../extensions/string_extensions.dart';

class MovieTabs extends StatefulWidget {
  final List<MovieEntity> movies;

  const MovieTabs({required this.movies});

  @override
  _MovieTabsState createState() => _MovieTabsState();
}

class _MovieTabsState extends State<MovieTabs> {
  int _selectedCategoryIndex = 0;

  final List<Map<String, dynamic>> _category = const [
    {
      'name': 'Popular',
      'index': 0,
    },
    {
      'name': 'Now',
      'index': 1,
    },
    {
      'name': 'Soon',
      'index': 2,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 4),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              for (var index = 0; index < 3; index++)
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedCategoryIndex = index;
                    });
                    Provider.of<MovieCategoryProvider>(context, listen: false)
                        .setIndex(index);
                  },
                  child: Column(
                    children: [
                      Text(
                        '${_category[index]['name']}',
                        style: TextStyle(
                          color: _selectedCategoryIndex == index
                              ? AppColor.royalBlue
                              : Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      _selectedCategoryIndex == index
                          ? SizedBox(
                              height: 5,
                            )
                          : SizedBox(),
                      _selectedCategoryIndex == index
                          ? Container(
                              height: 1,
                              width: 70,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(1)),
                                gradient: LinearGradient(
                                  colors: [
                                    AppColor.violet,
                                    AppColor.royalBlue,
                                  ],
                                ),
                              ),
                            )
                          : SizedBox(),
                    ],
                  ),
                ),
            ],
          ),
          Consumer<MovieCategoryProvider>(
            builder:
                (context, MovieCategoryProvider movieCategoryProvider, child) {
              return CategoryMoviesList(
                categoryIndex: movieCategoryProvider.getIndex,
              );
            },
          ),
        ],
      ),
    );
  }
}

class CategoryMoviesList extends StatelessWidget {
  final int categoryIndex;

  const CategoryMoviesList({required this.categoryIndex});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getMovies(categoryIndex),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Align(
              alignment: Alignment.bottomCenter,
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text('${snapshot.error}'),
            );
          }
          if (snapshot.hasData) {
            final List<MovieEntity>? movies =
                (snapshot.data as ApiResponse<List<MovieEntity>>).model;
            return Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {},
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: CachedNetworkImage(
                                imageUrl:
                                    '${ApiConstants.BASE_IMAGE_URL}${movies![index].posterPath}',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 4),
                            child: Text(
                              '${movies[index].title.intelliTrim()}',
                              maxLines: 1,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      width: 20,
                    );
                  },
                  itemCount: movies!.length,
                ),
              ),
            );
          }
          return Align(
            alignment: Alignment.bottomCenter,
            child: CircularProgressIndicator(),
          );
        });
  }

  Future<ApiResponse<List<MovieModel>>> getMovies(int categoryIndex) {
    Gateway gateway = Gateway(ServiceConfig());
    IApi api = ApiServices(gateway);
    switch (categoryIndex) {
      case 0:
        return api.getPopular();
      case 1:
        return api.getPlayingNow();
      case 2:
        return api.getUpcoming();
      default:
        return api.getTrending();
    }
  }
}
