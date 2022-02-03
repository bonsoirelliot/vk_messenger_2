class PeerModel {
  final int id;
  final String type;
  final int localId;

  PeerModel({
    required this.id,
    required this.type,
    required this.localId,
  });

  factory PeerModel.fromMap(Map<String, dynamic> map) {
    return PeerModel(
      id: map['id'] as int,
      type: map['type'] as String,
      localId: map['local_id'] as int,
    );
  }
}
