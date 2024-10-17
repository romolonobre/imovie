import 'package:app_services/app_services.dart';
import 'package:models/src/review/review.dart';

class ReviewsAdapter extends EntityAdaptor<Review> {
  @override
  Review fromJson(json) {
    dynamic details = json['author_details'];

    return Review(
      name: Helper.getString(details['username']),
      content: Helper.getString(json['content']),
      avatarUrl: Utils.imageBasePath + Helper.getString(details['avatar_path']),
      rating: Helper.getDouble(details['rating']),
      date: Helper.getString(json["created_at"]),
    );
  }

  @override
  List<Review> fromJsonToList(json) {
    if (json == null || json["results"].isEmpty) return [];
    final List<Review> reviews = [];

    json["results"].forEach((e) {
      final Review review = ReviewsAdapter().fromJson(e);
      reviews.add(review);
    });

    return reviews;
  }

  @override
  Map<String, dynamic> toMap(Review value) => {};
}