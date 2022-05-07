import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/top_rate_tv_show/top_rate_tv_show_bloc.dart';
import '../widgets/tv_card_list.dart';

class TopRatedTvShowPage extends StatefulWidget {
  static const ROUTE_NAME = '/top-rated-tv';

  @override
  _TopRatedTvShowPage createState() => _TopRatedTvShowPage();
}

class _TopRatedTvShowPage extends State<TopRatedTvShowPage> {
  @override
  void initState() {
    super.initState();
    context.read<TopRateTvShowBloc>().add(TopRateTvShow());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Top Rated Tv Show'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<TopRateTvShowBloc, TopRateTvShowState>(
          builder: (context, state) {
            if (state is TopRateTvShowStateLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is TopRateTvShowStateLoaded) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  final tv = state.result[index];
                  return TvCard(tv);
                },
                itemCount: state.result.length,
              );
            } else if (state is TopRateTvShowStateError) {
              return Center(
                key: Key('error_message'),
                child: Text(state.message),
              );
            } else {
              return Center(
                child: Text("Empty"),
              );
            }
          },
        ),
      ),
    );
  }
}
