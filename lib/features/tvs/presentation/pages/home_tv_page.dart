import 'package:cached_network_image/cached_network_image.dart';
import 'package:ditonton/features/tvs/presentation/blocs/now_playing_tv_show/now_playing_tv_show_bloc.dart';
import 'package:ditonton/features/tvs/presentation/blocs/top_rate_tv_show/top_rate_tv_show_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../common/constants.dart';
import '../../../movies/presentation/pages/about_page.dart';
import '../../../movies/presentation/pages/watchlist_movies_page.dart';
import '../../domain/entities/tv.dart';
import '../blocs/popular/popular_tv_show_bloc.dart';
import 'now_playing_tv_show_page.dart';
import 'popular_tv_show_page.dart';
import 'top_rated_tv_show_page.dart';
import 'tv_search_page.dart';
import 'tv_show_detail_page.dart';
import 'watchlist_tv_page.dart';

class HomeTvPage extends StatefulWidget {
  static const ROUTE_NAME = '/home-tv';
  @override
  _HomeTvPageState createState() => _HomeTvPageState();
}

class _HomeTvPageState extends State<HomeTvPage> {
  @override
  void initState() {
    super.initState();
    context.read<PopularTvShowBloc>().add(PopularTvShow());
    context.read<TopRateTvShowBloc>().add(TopRateTvShow());
    context.read<NowPlayingTvShowBloc>().add(NowPlayingTvShow());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/circle-g.png'),
              ),
              accountName: Text('Ditonton'),
              accountEmail: Text('ditonton@dicoding.com'),
            ),
            ListTile(
              leading: Icon(Icons.movie),
              title: Text('Movies'),
              onTap: () {
                Navigator.pushNamed(context, "/home");
              },
            ),
            ListTile(
              leading: Icon(Icons.movie),
              title: Text('TV Show'),
              onTap: () {
                Navigator.pushNamed(context, HomeTvPage.ROUTE_NAME);
              },
            ),
            ListTile(
              leading: Icon(Icons.save_alt),
              title: Text('Watchlist Movie'),
              onTap: () {
                Navigator.pushNamed(context, WatchlistMoviesPage.ROUTE_NAME);
              },
            ),
            ListTile(
              leading: Icon(Icons.save_alt),
              title: Text('Watchlist Tv Show'),
              onTap: () {
                Navigator.pushNamed(context, WatchlistTvPage.ROUTE_NAME);
              },
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, AboutPage.ROUTE_NAME);
              },
              leading: Icon(Icons.info_outline),
              title: Text('About'),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Ditonton'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, TVSearchPage.ROUTE_NAME);
            },
            icon: Icon(Icons.search),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSubHeading(
                title: 'Popular Tv Show',
                onTap: () =>
                    Navigator.pushNamed(context, PopularTvShowPage.ROUTE_NAME),
              ),
              BlocBuilder<PopularTvShowBloc, PopularTvShowState>(
                  builder: (context, state) {
                if (state is PopularTvShowStateLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is PopularTvShowStateLoaded) {
                  final result = state.result;
                  return TvList(result);
                } else {
                  return Text('Failed');
                }
              }),
              _buildSubHeading(
                title: 'On The Air Tv Show',
                onTap: () => Navigator.pushNamed(
                    context, NowPlayingTvShowPage.ROUTE_NAME),
              ),
              BlocBuilder<NowPlayingTvShowBloc, NowPlayingTvShowState>(
                  builder: (context, state) {
                if (state is NowPlayingStateLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is NowPlayingStateLoaded) {
                  final result = state.result;
                  return TvList(result);
                } else {
                  return Text('Failed');
                }
              }),
              _buildSubHeading(
                title: 'Top Rated Tv Show',
                onTap: () =>
                    Navigator.pushNamed(context, TopRatedTvShowPage.ROUTE_NAME),
              ),
              BlocBuilder<TopRateTvShowBloc, TopRateTvShowState>(
                  builder: (context, state) {
                if (state is TopRateTvShowStateLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is TopRateTvShowStateLoaded) {
                  final result = state.result;
                  return TvList(result);
                } else {
                  return Text('Failed');
                }
              }),
            ],
          ),
        ),
      ),
    );
  }

  Row _buildSubHeading({required String title, required Function() onTap}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: kHeading6,
        ),
        InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [Text('See More'), Icon(Icons.arrow_forward_ios)],
            ),
          ),
        ),
      ],
    );
  }
}

class TvList extends StatelessWidget {
  final List<TV> tv;

  TvList(this.tv);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final movie = tv[index];
          return Container(
            padding: const EdgeInsets.all(8),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  TvShowDetailPage.ROUTE_NAME,
                  arguments: movie.id,
                );
              },
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                child: CachedNetworkImage(
                  imageUrl: '$BASE_IMAGE_URL${movie.posterPath}',
                  placeholder: (context, url) => Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
            ),
          );
        },
        itemCount: tv.length,
      ),
    );
  }
}
