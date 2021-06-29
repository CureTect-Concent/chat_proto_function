class ChattingModel{
  final String pk;
  final String name;
  final String text;
  final int uploadTime;

  ChattingModel(this.pk, this.name, this.text, this.uploadTime);

  factory ChattingModel.fromJson(Map<String,dynamic>json){ //json에서 chattingmodel로 데이터 받아오기
    return ChattingModel(json['pk'], json['name'], json['text'], json['uploadTime']);
  }
  Map<String,dynamic> toJson(){ //chattingmodel에서 json으로 변환
    return <String, dynamic>{
      'pk':pk,
      'name':name,
      'text':text,
      'uploadTime':uploadTime,
    };
  }
}