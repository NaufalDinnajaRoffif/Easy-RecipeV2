final String tableSave = 'recipes';

class Save {
  static final List<String> values = [
    id,
    image,
    time,
    title,
    difficulty,
  ];

  static final String id = 'id';
  static final String image = 'image';
  static final String time = 'time';
  static final String title = 'title';
  static final String difficulty = 'difficulty';
}

class SaveModel {
  final int? id;
  final String image;
  final String time;
  final String title;
  final String difficulty;

  SaveModel({
    this.id,
    required this.image,
    required this.time,
    required this.title,
    required this.difficulty,
  });

  static SaveModel fromJson(Map<String, Object?> json) => SaveModel(
    id: json[Save.id] as int?,
    image: json[Save.image] as String,
    time: json[Save.time] as String,
    title: json[Save.title] as String,
    difficulty: json[Save.difficulty] as String,
  );

  Map<String, Object?> toJson() => {
    Save.id: id,
    Save.image: image,
    Save.time: time,
    Save.title: title,
    Save.difficulty: difficulty,
  };

  SaveModel copy({
    int? id,
    String? imageUrl,
    String? time,
    String? title,
    String? difficulty,
  }) =>
      SaveModel(
          id: id ?? this.id,
          image: imageUrl ?? this.image,
          time: time ?? this.time,
          title: title ?? this.title,
          difficulty: difficulty ?? this.difficulty);
}
