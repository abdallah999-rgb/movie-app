import 'package:movie_app/features/search/domain/entities/movie_entity.dart';

import 'Torrents.dart';

/// id : 69858
/// url : "https://yts.mx/movies/tales-from-black-manor-2025"
/// imdb_code : "tt31848767"
/// title : "Tales from Black Manor"
/// title_english : "Tales from Black Manor"
/// title_long : "Tales from Black Manor (2025)"
/// slug : "tales-from-black-manor-2025"
/// year : 2025
/// rating : 0
/// runtime : 0
/// genres : ["Horror"]
/// summary : ""
/// description_full : ""
/// synopsis : ""
/// yt_trailer_code : ""
/// language : "en"
/// mpa_rating : ""
/// background_image : "https://yts.mx/assets/images/movies/tales_from_black_manor_2025/background.jpg"
/// background_image_original : "https://yts.mx/assets/images/movies/tales_from_black_manor_2025/background.jpg"
/// small_cover_image : "https://yts.mx/assets/images/movies/tales_from_black_manor_2025/small-cover.jpg"
/// medium_cover_image : "https://yts.mx/assets/images/movies/tales_from_black_manor_2025/medium-cover.jpg"
/// large_cover_image : "https://yts.mx/assets/images/movies/tales_from_black_manor_2025/large-cover.jpg"
/// state : "ok"
/// torrents : [{"url":"https://yts.mx/torrent/download/22BA31BEF54839B20547EA5D27FE5ED00A37CF52","hash":"22BA31BEF54839B20547EA5D27FE5ED00A37CF52","quality":"720p","type":"web","is_repack":"0","video_codec":"x264","bit_depth":"8","audio_channels":"2.0","seeds":0,"peers":0,"size":"842.73 MB","size_bytes":883666452,"date_uploaded":"2025-06-26 09:32:12","date_uploaded_unix":1750923132},{"url":"https://yts.mx/torrent/download/71BC0846214585FB8CCAD1486240B1BC73694CF9","hash":"71BC0846214585FB8CCAD1486240B1BC73694CF9","quality":"1080p","type":"web","is_repack":"0","video_codec":"x264","bit_depth":"8","audio_channels":"2.0","seeds":0,"peers":0,"size":"1.53 GB","size_bytes":1642824991,"date_uploaded":"2025-06-26 10:21:34","date_uploaded_unix":1750926094}]
/// date_uploaded : "2025-06-26 09:32:12"
/// date_uploaded_unix : 1750923132

class Movie {
  Movie({
    this.id,
    this.url,
    this.imdbCode,
    this.title,
    this.titleEnglish,
    this.titleLong,
    this.slug,
    this.year,
    this.rating,
    this.runtime,
    this.genres,
    this.summary,
    this.descriptionFull,
    this.synopsis,
    this.ytTrailerCode,
    this.language,
    this.mpaRating,
    this.backgroundImage,
    this.backgroundImageOriginal,
    this.smallCoverImage,
    this.mediumCoverImage,
    this.largeCoverImage,
    this.state,
    this.torrents,
    this.dateUploaded,
    this.dateUploadedUnix,
  });

  Movie.fromJson(dynamic json) {
    id = json['id'];
    url = json['url'];
    imdbCode = json['imdb_code'];
    title = json['title'];
    titleEnglish = json['title_english'];
    titleLong = json['title_long'];
    slug = json['slug'];
    year = json['year'];
    rating = ((json['rating'])as num).toDouble() ;
    runtime = json['runtime'];
    genres = json['genres'] != null ? json['genres'].cast<String>() : [];
    summary = json['summary'];
    descriptionFull = json['description_full'];
    synopsis = json['synopsis'];
    ytTrailerCode = json['yt_trailer_code'];
    language = json['language'];
    mpaRating = json['mpa_rating'];
    backgroundImage = json['background_image'];
    backgroundImageOriginal = json['background_image_original'];
    smallCoverImage = json['small_cover_image'];
    mediumCoverImage = json['medium_cover_image'];
    largeCoverImage = json['large_cover_image'];
    state = json['state'];
    if (json['torrents'] != null) {
      torrents = [];
      json['torrents'].forEach((v) {
        torrents?.add(Torrents.fromJson(v));
      });
    }
    dateUploaded = json['date_uploaded'];
    dateUploadedUnix = json['date_uploaded_unix'];
  }

  int? id;
  String? url;
  String? imdbCode;
  String? title;
  String? titleEnglish;
  String? titleLong;
  String? slug;
  int? year;
  double? rating;
  int? runtime;
  List<String>? genres;
  String? summary;
  String? descriptionFull;
  String? synopsis;
  String? ytTrailerCode;
  String? language;
  String? mpaRating;
  String? backgroundImage;
  String? backgroundImageOriginal;
  String? smallCoverImage;
  String? mediumCoverImage;
  String? largeCoverImage;
  String? state;
  List<Torrents>? torrents;
  String? dateUploaded;
  int? dateUploadedUnix;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['url'] = url;
    map['imdb_code'] = imdbCode;
    map['title'] = title;
    map['title_english'] = titleEnglish;
    map['title_long'] = titleLong;
    map['slug'] = slug;
    map['year'] = year;
    map['rating'] = rating;
    map['runtime'] = runtime;
    map['genres'] = genres;
    map['summary'] = summary;
    map['description_full'] = descriptionFull;
    map['synopsis'] = synopsis;
    map['yt_trailer_code'] = ytTrailerCode;
    map['language'] = language;
    map['mpa_rating'] = mpaRating;
    map['background_image'] = backgroundImage;
    map['background_image_original'] = backgroundImageOriginal;
    map['small_cover_image'] = smallCoverImage;
    map['medium_cover_image'] = mediumCoverImage;
    map['large_cover_image'] = largeCoverImage;
    map['state'] = state;
    if (torrents != null) {
      map['torrents'] = torrents?.map((v) => v.toJson()).toList();
    }
    map['date_uploaded'] = dateUploaded;
    map['date_uploaded_unix'] = dateUploadedUnix;
    return map;
  }

  MovieEntity toMovieEntity() {
    return MovieEntity(
      title: title,
      id: id,
      backgroundImage: backgroundImage,
      backgroundImageOriginal: backgroundImageOriginal,
      dateUploaded: dateUploaded,
      dateUploadedUnix: dateUploadedUnix,
      descriptionFull: descriptionFull,
      genres: genres,
      imdbCode: imdbCode,
      language: language,
      largeCoverImage: largeCoverImage,
      mediumCoverImage: mediumCoverImage,
      mpaRating: mpaRating,
      rating: rating,
      smallCoverImage: smallCoverImage,
      state: state,
      summary: summary,
      synopsis: synopsis,
      titleEnglish: titleEnglish,
      titleLong: titleLong,
      url: url,
      year: year,
      ytTrailerCode: ytTrailerCode,
    );
  }
}
