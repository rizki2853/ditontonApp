import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/constants.dart';
import '../blocs/search_movie/search_movie_bloc.dart';
import '../widgets/movie_card_list.dart';

class SearchPage extends StatelessWidget {
  static const ROUTE_NAME = '/search';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              onChanged: (query) {
                if (query == '') {
                  query = 'a';
                }
                context.read<SearchMovieBloc>().add(GetSearchMovieEvent(query));
              },
              decoration: InputDecoration(
                hintText: 'Search title',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              textInputAction: TextInputAction.search,
            ),
            SizedBox(height: 16),
            Text(
              'Search Result',
              style: kHeading6,
            ),
            BlocBuilder<SearchMovieBloc, SearchMovieState>(
              builder: (context, state) {
                if (state is SearchMovieLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is SearchMovieLoaded) {
                  return Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemBuilder: (context, index) {
                        final movie = state.result[index];
                        return MovieCard(movie);
                      },
                      itemCount: state.result.length,
                    ),
                  );
                } else if (state is SearchMovieError) {
                  return Expanded(
                    child: Text(state.message),
                  );
                } else {
                  return Center(
                    child: Text('Empty'),
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
