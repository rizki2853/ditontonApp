import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/constants.dart';
import '../blocs/search_tv_show/search_tv_show_bloc.dart';
import '../widgets/tv_card_list.dart';

class TVSearchPage extends StatelessWidget {
  static const ROUTE_NAME = '/tv-search';

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
                context.read<SearchTvShowBloc>().add(SearchTvShow(query));
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
            BlocBuilder<SearchTvShowBloc, SearchTvShowState>(
              builder: (context, state) {
                if (state is SearchTvShowStateLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is SearchTvShowStateLoaded) {
                  return Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemBuilder: (context, index) {
                        final tv = state.result[index];
                        return TvCard(tv);
                      },
                      itemCount: state.result.length,
                    ),
                  );
                } else if (state is SearchTvShowStateError) {
                  return Expanded(
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
          ],
        ),
      ),
    );
  }
}
