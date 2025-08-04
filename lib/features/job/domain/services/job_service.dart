import 'package:dio/dio.dart';
import 'package:job_search_app/core/api_client.dart';
import 'package:job_search_app/core/models/data_response.dart';
import 'package:job_search_app/features/job/domain/models/models.dart';

class JobService {
  static Future<DataResponse<JobModel>> getJobs() async {
    try {
      final response = await apiClient.get('jobs');

      return DataResponse.fromJson(
        response.data,
        (json) => (json as List).map((e) => JobModel.fromJson(e)).toList(),
      );
    } on DioException catch (e) {
      throw Exception('Dio error: ${e.message}');
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }
}
