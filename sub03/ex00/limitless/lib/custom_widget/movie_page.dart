import 'package:flutter/material.dart';

final List<Map<String, String>> movieData = [
  {
    'posterPath':
        '<https://image.tmdb.org/t/p/w500/1Lh9LER4xRQ3INFFi2dfS2hpRwv.jpg>'
  },
  {
    'posterPath':
        '<https://image.tmdb.org/t/p/w500/oF80bdLeRri6PFm0yAT0gRNQoDG.jpg>'
  },
  {
    'posterPath':
        '<https://image.tmdb.org/t/p/w500/8SAWREjfLyArr2pYo1gHihCthY8.jpg>'
  },
  {
    'posterPath':
        '<https://image.tmdb.org/t/p/w500/1UkbPQspPbq1FPbFP4VV1ELCfSN.jpg>'
  },
  {
    'posterPath':
        '<https://image.tmdb.org/t/p/w500/aNtAP8ZzUMdnCPoqYgVOcgI0Eh4.jpg>'
  },
  {
    'posterPath':
        '<https://image.tmdb.org/t/p/w500/yXNVcG0C7Oymg9F9ecXa9MWVwj8.jpg>'
  },
  {
    'posterPath':
        '<https://image.tmdb.org/t/p/w500/68ZwnPALUeweaFdT1z75oXJ4Xie.jpg>'
  },
  {
    'posterPath':
        '<https://image.tmdb.org/t/p/w500/l8HyObVj8fPrzacAPtGWWLDhcfh.jpg>'
  },
  {
    'posterPath':
        '<https://image.tmdb.org/t/p/w500/bZrStEjqKMRCywomPZiPkOWZpXL.jpg>'
  },
  {
    'posterPath':
        '<https://image.tmdb.org/t/p/w500/qfB6QNaCtmGDy9ujvBOUs7UaPx.jpg>'
  },
  {
    'posterPath':
        '<https://image.tmdb.org/t/p/w500/eRLlrhbdYE7XN6VtcZKy6o2BsOw.jpg>'
  },
  {
    'posterPath':
        '<https://image.tmdb.org/t/p/w500/52SgH0kLiSpWdJDOZvhAyy34uhe.jpg>'
  },
  {
    'posterPath':
        '<https://image.tmdb.org/t/p/w500/yjdOpEtlzlAnw4Kw0NGw25VrbIb.jpg>'
  },
  {
    'posterPath':
        '<https://image.tmdb.org/t/p/w500/xs7Dx72wr2H14uxu0H0R9ljDZk7.jpg>'
  },
  {
    'posterPath':
        '<https://image.tmdb.org/t/p/w500/zPDY58lk0YIxr9qsnGV64PEnjkI.jpg>'
  },
  {
    'posterPath':
        '<https://image.tmdb.org/t/p/w500/pMyOSRURkxF6YId9vOTGsBH1jRb.jpg>'
  },
  {
    'posterPath':
        '<https://image.tmdb.org/t/p/w500/jlmuSzTXOppShgYZbeetWTFTi6P.jpg>'
  },
  {
    'posterPath':
        '<https://image.tmdb.org/t/p/w500/xJY3ttefDnnn6doYQo5QOROgdvV.jpg>'
  },
  {
    'posterPath':
        '<https://image.tmdb.org/t/p/w500/w7PJ7fBEYOuaAMKfYa4zmw45v3N.jpg>'
  },
  {
    'posterPath':
        '<https://image.tmdb.org/t/p/w500/AviYDX3NuuyVQdZoLmLxNKp3zm8.jpg>'
  },
];

class MovieGrid extends StatelessWidget {
  const MovieGrid({Key? key, required this.movieData}) : super(key: key);

  final List<Map<String, String>> movieData;

  Widget _gridBody() {
    return GridView.count(
      padding: EdgeInsets.all(8),
      crossAxisCount: 2,
      crossAxisSpacing: 8,
      mainAxisSpacing: 8,
      children: movieData
          .map((e) => Image(
                image: Image.network(e['posterPath']!
                        .substring(1, e['posterPath']!.length - 1))
                    .image,
                fit: BoxFit.cover,
              ))
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          title: Text(
            'Movie of the Week',
            style: TextStyle(
              fontSize: 32,
              fontFamily: 'Fruktur',
              color: Color.fromARGB(255, 106, 243, 108),
            ),
          ),
          backgroundColor: Colors.white,
        ),
        SliverGrid.count(
          // padding: EdgeInsets.all(8),
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          children: movieData
              .map((e) => Image(
                    image: Image.network(e['posterPath']!
                            .substring(1, e['posterPath']!.length - 1))
                        .image,
                    fit: BoxFit.cover,
                  ))
              .toList(),
        )
      ],
    );
  }
}

class MoviePage extends StatelessWidget {
  const MoviePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Movie Poster',
          style: TextStyle(fontFamily: 'Fruktur'),
        ),
        centerTitle: false,
      ),
      body: MovieGrid(
        movieData: movieData,
      ),
    );
  }
}
