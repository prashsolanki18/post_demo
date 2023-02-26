import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:sunflower_lab_test/app/app_strings.dart';
import 'package:sunflower_lab_test/data/network/client/api_client.dart';
import 'package:sunflower_lab_test/data/network/models/post_list.dart';

/// Post related all api will be done here
class PostRepository {
  Future<Either<String, List<PostList>>> getPostList() async {
    try {
      var url = Uri.parse(ApiClient.apiBaseUrl + ApiClient.posts);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        return Right(List<PostList>.from(json.decode(response.body).map((x) => PostList.fromJson(x))));
      } else {
        return const Left(AppStrings.somethingWentWrong);
      }
    } catch (e) {
      return const Left(AppStrings.somethingWentWrong);
    }
  }
}
