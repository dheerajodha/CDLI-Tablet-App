import 'package:json_annotation/json_annotation.dart';
part 'Cuneiform_Data.g.dart';

@JsonSerializable()
class CuneiformData {
  String url;
  String thumbnail;
  String theme;
  String date;
  String title;
  String blurb;
  String description;

  CuneiformData({this.url, this.theme, this.thumbnail, this.date, this.title, this.description, this.blurb});
  factory CuneiformData.fromJson(Map<String, dynamic> json) => _$CuneiformDataFromJson(json);

  Map<String, dynamic> toJson() => _$CuneiformDataToJson(this);
}

@JsonSerializable()
class CuneiformDataList {
  List<CuneiformData> cuneiformData;

  CuneiformDataList({this.cuneiformData});
  factory CuneiformDataList.fromJson(List<dynamic> json) {
    return CuneiformDataList(
        cuneiformData: json
            .map((e) => CuneiformData.fromJson(e as Map<String, dynamic>))
            .toList());
  }
}