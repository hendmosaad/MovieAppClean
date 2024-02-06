import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/conestances.dart';
import 'package:movies_app/core/dummy.dart';
import 'package:movies_app/movies/persentation/controllers/bloc/movies_bloc.dart';
import 'package:movies_app/movies/persentation/controllers/bloc/movies_states.dart';
import 'package:shimmer/shimmer.dart';
class TopRatedComponent extends StatelessWidget {
  const TopRatedComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<MoviesBloc,MoviesStates>(
        buildWhen: (previous, current)
        {
          return previous.topRatedStatus!=current.topRatedStatus;
        },
        builder: (context,state){
      print('state.toprated');
      switch (state.topRatedStatus)
      {
        case RequestStatus.isLoaded:
          print('topratedbuilded');
          return FadeIn(
            duration: const Duration(milliseconds: 500),
            child: SizedBox(
              height: 170.0,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                itemCount: state.topRatedMovies.length,
                itemBuilder: (context, index) {
                  final movie = state.topRatedMovies[index];
                  return Container(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: InkWell(
                      onTap: () {
                        /// TODO : NAVIGATE TO  MOVIE DETAILS
                      },
                      child: ClipRRect(
                        borderRadius:
                        const BorderRadius.all(Radius.circular(8.0)),
                        child: CachedNetworkImage(
                          width: 120.0,
                          fit: BoxFit.cover,
                          imageUrl: AppConexstances.imageUrl(movie.backdropPath),
                          placeholder: (context, url) => Shimmer.fromColors(
                            baseColor: Colors.grey[850]!,
                            highlightColor: Colors.grey[800]!,
                            child: Container(
                              height: 170.0,
                              width: 120.0,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                          errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        case RequestStatus.isLoading:
          print('loading');
          return Container(
            height: 400,
            child: Center(
              child: CircularProgressIndicator(),

            ),
          );
        case RequestStatus.error:
          print('error');
          return Container(
            child: Center(
              child: Text('${state.nowPlayingMessege}'),
            ),
          );}
      // return Container();

    });
  }
}
