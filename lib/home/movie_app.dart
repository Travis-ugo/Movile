import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';

import 'movie.dart';
import 'movie_exception.dart';
import 'movie_service.dart';

final moviesFutureProvider = FutureProvider.autoDispose<List<Movie>>(
  (ref) async {
    ref.maintainState = true;
    final movieService = ref.read(movieServiceProvider);
    final movies = await movieService.getMovies();
    return movies;
  },
);

class HomePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text('Movilies'),
      ),
      body: watch(moviesFutureProvider).when(
        error: (e, s) {
          if (e is MovieException) {
            return _ErrorBody(message: e.message);
          }
          return _ErrorBody(message: 'Oops somethng went wrong boy');
        },
        loading: () => Center(child: CircularProgressIndicator()),
        data: (movies) {
          return RefreshIndicator(
            onRefresh: () {
              return context.refresh(moviesFutureProvider);
            },
            child: GridView.extent(
              maxCrossAxisExtent: 200,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 0.7,
              children: movies.map((movie) => Text(movie.title)).toList(),
            ),
          );
        },
      ),
    );
  }
}

class _ErrorBody extends StatelessWidget {
  const _ErrorBody({
    Key key,
    @required this.message,
  })  : assert(message != null, 'A non-nul string must be provided'),
        super(key: key);
  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(message),
          ElevatedButton(
            onPressed: () => context.refresh(moviesFutureProvider),
            child: Text('try again'),
          )
        ],
      ),
    );
  }
}

class _MovieBox extends StatelessWidget {
  final Movie movie;

  const _MovieBox({Key key, this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
