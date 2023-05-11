import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../../core/core.dart';
import '../../directory/directory.dart';

class DirectoryService {
  final Dio dio;
  DirectoryService({required this.dio});

  Future<List<HealthProvider>> getHealthProvidersRemotely() async {
    try {
      final headers = {
        'Authorization': 'Bearer ${AppConstants.apiToken}',
        'Access-Control-Allow-Origin': '*',
        'Content-Type': 'application/json'
      };

      final result = await dio.get('/directory',
          options: Options(
            headers: headers,
            contentType: 'application/json',
          ));

      final remoteEntityProviders = (result.data as List)
          .map(
            (remoteEntity) => HealthProviderRemoteEntity.fromMap(remoteEntity),
          )
          .toList();

      final healthProviders = remoteEntityProviders
          .map((entity) => HealthProvider.fromRemoteEntity(entity))
          .toList();
      return healthProviders;
    } catch (e) {
      debugPrint(e.toString());
      throw GetHealthProvidersRemotelyException(
        'No se ha podido cargar el directorio médico.\nInténtalo de nuevo más tarde.',
      );
    }
  }
}

class GetHealthProvidersRemotelyException implements Exception {
  final String message;
  GetHealthProvidersRemotelyException(this.message);
}
