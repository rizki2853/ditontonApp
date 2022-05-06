import 'package:equatable/equatable.dart';

import 'tv_show_model.dart';

class TvResponse extends Equatable {
  final List<TVShowModel> tvShowList;

  TvResponse({required this.tvShowList});

  factory TvResponse.fromJson(Map<String, dynamic> json) => TvResponse(
        tvShowList: List<TVShowModel>.from((json["results"] as List)
            .map((x) => TVShowModel.fromJson(x))
            .where((element) => element.posterPath != null)),
      );

  Map<String, dynamic> toJson() => {
        "results": List<dynamic>.from(tvShowList.map((x) => x.toJson())),
      };

  @override
  List<Object> get props => [tvShowList];
}
