class MessageModel {
  String? sender;
  String? text;
  bool? seen;
  DateTime? createdon;
  MessageModel({this.seen, this.sender, this.text, this.createdon});
  MessageModel.fromMap(Map<String, dynamic> map) {
    seen = map['seen'];
    sender = map['sender'];
    createdon = map['createdon'];
    text = map['text'];
  }
  Map<String, dynamic> toMap() {
    return {
      'seen': seen,
      'sender': sender,
      'createdon': createdon,
      'text': text
    };
  }
}
