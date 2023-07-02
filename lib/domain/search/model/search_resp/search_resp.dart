import 'package:json_annotation/json_annotation.dart';
import 'package:netflix_clone/core/constants.dart';


part 'search_resp.g.dart';


@JsonSerializable()
class SearchResp {
	List<SearchResultData>? results;


	SearchResp({ this.results=const []});

	factory SearchResp.fromJson(Map<String, dynamic> json) => SearchResp(
				results: (json['results'] as List<dynamic>?)
						?.map((e) => SearchResultData.fromJson(e as Map<String, dynamic>))
						.toList(),
			);

	Map<String, dynamic> toJson() => {
	
				'results': results?.map((e) => e.toJson()).toList(),
	
		
			};
}


@JsonSerializable()
class SearchResultData {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'poster_path')
  String? posterPath;
  @JsonKey(name: 'original_title')
  String? originalTitle;

  String get posterImageUrl => '$imageAppendUrl$posterPath';

  SearchResultData
({
    this.id,
    this.originalTitle,
    this.posterPath,
  });

  factory SearchResultData.fromJson(Map<String, dynamic> json) => SearchResultData(
        id: json['id'] as int?,
        originalTitle: json['original_title'] as String?,
        posterPath: json['poster_path'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'original_title': originalTitle,
        'poster_path': posterPath,
      };
}

