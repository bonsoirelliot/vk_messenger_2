class ConversationProfileModel {
  final int id;
  final String firstName;
  final String secondName;
  final String photo;

  ConversationProfileModel({
    required this.id,
    required this.firstName,
    required this.secondName,
    required this.photo,
  });

  factory ConversationProfileModel.fromMap(Map<String, dynamic> map) {
    return ConversationProfileModel(
      id: map['id'] as int,
      firstName: map['first_name'] as String,
      secondName: map['second_name'] as String,
      photo: map['photo_50'] as String,
    );
  }
}
