import 'package:injectable/injectable.dart';
import '../models/home_model.dart';

abstract class HomeRemoteDataSource {

}

@LazySingleton(as: HomeRemoteDataSource)
class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {

}
