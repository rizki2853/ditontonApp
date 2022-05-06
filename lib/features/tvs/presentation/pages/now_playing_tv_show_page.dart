import 'package:ditonton/features/tvs/presentation/blocs/now_playing_tv_show/now_playing_tv_show_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/tv_card_list.dart';

class NowPlayingTvShowPage extends StatefulWidget {
  static const ROUTE_NAME = '/now-playing-tv-show';

  @override
  State<NowPlayingTvShowPage> createState() => _NowPlayingTvShowPageState();
}

class _NowPlayingTvShowPageState extends State<NowPlayingTvShowPage> {
  @override
  void initState() {
    super.initState();
    context.read<NowPlayingTvShowBloc>().add(NowPlayingTvShow());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('On The Air Tv Show'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<NowPlayingTvShowBloc, NowPlayingTvShowState>(
          builder: (context, state) {
            if (state is NowPlayingStateLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is NowPlayingStateLoaded) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  final tv = state.result[index];
                  return TvCard(tv);
                },
                itemCount: state.result.length,
              );
            } else if (state is NowPlayingStateError) {
              return Center(
                key: Key('error_message'),
                child: Text(state.message),
              );
            } else {
              return Expanded(
                child: Center(
                  child: Text("Empty"),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
