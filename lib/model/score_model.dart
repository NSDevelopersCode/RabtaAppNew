class ScoreDate {
  final int score;
  final DateTime date;
  final String catagory;

  ScoreDate({required this.score, required this.date, required this.catagory});

  // Convert a ScoreDate object to a Map
  Map<String, dynamic> toJson() {
    return {
      'score': score,
      'date': date.toIso8601String(),
      'catagory': catagory,
    };
  }

  // Convert a Map to a ScoreDate object
  factory ScoreDate.fromJson(Map<String, dynamic> json) {
    return ScoreDate(
      catagory: json['catagory'],
      score: json['score'],
      date: DateTime.parse(json['date']),
    );
  }
}
