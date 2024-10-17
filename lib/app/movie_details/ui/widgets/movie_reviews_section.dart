import 'package:app_services/app_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widgets/flutter_widgets.dart';
import 'package:imovie_ui/imovie_ui.dart';

import '../../data/service/movie_details_service.dart';
import '../../interactor/states/movie_details_state.dart';

class MovieReviewsSection extends StatelessWidget {
  final MovieDetailsService service;
  final String id;
  const MovieReviewsSection({
    super.key,
    required this.service,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<MovieDetailsState>(
      future: service.getReviews(id: id),
      builder: (context, snapshot) {
        final state = snapshot.data;
        //
        // Loading state
        if (snapshot.connectionState == ConnectionState.waiting) {
          return ShimmerLoading(
            width: 70,
            height: 20,
            itemCount: 1,
          ).paddingOnly(right: 10);
        }

        //  Error state
        if (state is MoviesDetailsErrorState) {
          return IUIText.heading(
            state.message,
            color: Colors.red,
            fontsize: 12,
          );
        }

        //Reviews Loaded state
        if (state is MovieReviewsLoadedState) {
          return ReviewsPopupWidget(reviews: state.reviews);
        }
        return const Text("No data avaliable");
      },
    );
  }
}
