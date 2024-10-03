import 'package:flutter_test/flutter_test.dart';
import 'package:quick_lingo/core/network/api_response.dart';

void main() {
  group('ApiResponse', () {
    test('fromJson should return a valid ApiResponse object', () {
      final json = {
        'status': 200,
        'message': 'Success',
        'data': {'key': 'value'}
      };

      final apiResponse = ApiResponse.fromJson(
        json,
        (json) => json as Map<String, dynamic>,
      );

      expect(apiResponse.status, 200);
      expect(apiResponse.messages, 'Success');
      expect(apiResponse.data, {'key': 'value'});
    });

    test('toJson should return a valid JSON map', () {
      final apiResponse = ApiResponse<Map<String, dynamic>>(
        status: 200,
        messages: 'Success',
        data: {'key': 'value'},
      );

      final json = apiResponse.toJson((data) => data as Map<String, dynamic>);

      expect(json['status'], 200);
      expect(json['message'], 'Success');
      expect(json['data'], {'key': 'value'});
    });

    test('fromJson with null data should return a valid ApiResponse object',
        () {
      final json = {'status': 200, 'message': 'Success', 'data': null};

      final apiResponse = ApiResponse.fromJson(
        json,
        (json) => json as Map<String, dynamic>?,
      );

      expect(apiResponse.status, 200);
      expect(apiResponse.messages, 'Success');
      expect(apiResponse.data, null);
    });

    test('toJson with null data should return a valid JSON map', () {
      final apiResponse = ApiResponse<Map<String, dynamic>>(
        status: 200,
        messages: 'Success',
        data: null,
      );

      final json = apiResponse.toJson((data) => data as Map<String, dynamic>);

      expect(json['status'], 200);
      expect(json['message'], 'Success');
      expect(json['data'], null);
    });
  });
}
