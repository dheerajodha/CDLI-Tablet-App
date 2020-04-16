// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Cuneiform_Data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CuneiformData _$CuneiformDataFromJson(Map<String, dynamic> json) {
  return CuneiformData(
      url: json['url'] as String,
      theme: json['theme'] as String,
      thumbnail: json['thumbnail-url'] as String,
      date: json['date'] as String,
      title: json['blurb-title'] as String,
      description: json['full-info'] as String,
      blurb: json['blurb'] as String);
}

Map<String, dynamic> _$CuneiformDataToJson(CuneiformData instance) =>
    <String, dynamic>{
      'url': instance.url,
      'thumbnail': instance.thumbnail,
      'theme': instance.theme,
      'date': instance.date,
      'title': instance.title,
      'blurb': instance.blurb,
      'description': instance.description
    };

CuneiformDataList _$CuneiformDataListFromJson(Map<String, dynamic> json) {
  return CuneiformDataList(
      cuneiformData: (json['cuneiformData'] as List)
          ?.map((e) => e == null
              ? null
              : CuneiformData.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$CuneiformDataListToJson(CuneiformDataList instance) =>
    <String, dynamic>{'cuneiformData': instance.cuneiformData};
