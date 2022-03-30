class FromPost {
  final String? Results;
  final String? Name;
  final String? ImageLink;
  const FromPost(
      {required this.Results, required this.Name, required this.ImageLink});
  factory FromPost.fromJson(Map<String, dynamic> json) {
    return FromPost(
        Results: json['Results'],
        Name: json['Name'],
        ImageLink: json['ImageLink']);
  }
}
