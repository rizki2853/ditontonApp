import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/popular/popular_tv_show_bloc.dart';
import '../widgets/tv_card_list.dart';

class PopularTvShowPage extends StatefulWidget {
  static const ROUTE_NAME = '/popular-tv';

  @override
  _PopularTvShowPage createState() => _PopularTvShowPage();
}

class _PopularTvShowPage extends State<PopularTvShowPage> {
  @override
  void initState() {
    super.initState();
    context.read<PopularTvShowBloc>().add(PopularTvShow());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Popular Tv Show'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<PopularTvShowBloc, PopularTvShowState>(
          builder: (context, state) {
            if (state is PopularTvShowStateLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is PopularTvShowStateLoaded) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  final tvShow = state.result[index];
                  return TvCard(tvShow);
                },
                itemCount: state.result.length,
              );
            } else if (state is PopularTvShowStateError) {
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
