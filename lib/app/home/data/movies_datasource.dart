// ignore_for_file: control_flow_in_finally

import 'package:http/http.dart';
import 'package:imovie_app/app/commons/api_request.dart';
import 'package:imovie_app/app/commons/tmdb_api_response.dart';

import '../../commons/error_handle.dart';

class MoviesDatasource extends APIRequest {
  Future<TMDBApiResponse> call({required String endpoint}) async {
    Response? response;
    try {
      response = await this.get(endpoint);
    } catch (error, stackTrace) {
      Errorhandler.report(error, stackTrace, "getSeasonVideos");
    } finally {
      return TMDBApiResponse(response);
    }
  }
}