
class ChatModel {
  String? prompt;
  String? answer;
  String? id;

  ChatModel({this.prompt, this.answer, this.id});

  ChatModel.fromJson(Map<String, dynamic> json) {
    if(json["prompt"] is String) {
      prompt = json["prompt"];
    }
    if(json["answer"] is String) {
      answer = json["answer"];
    }
    if(json["_id"] is String) {
      id = json["_id"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["prompt"] = prompt;
    _data["answer"] = answer;
    _data["_id"] = id;
    return _data;
  }
}