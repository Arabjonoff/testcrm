import 'package:rxdart/subjects.dart';
import 'package:testcrm/src/model/http_result.dart';
import 'package:testcrm/src/model/usd_course/usd.dart';
import '../../repository/repository.dart';

class CourseBloc{
  final Repository _repository = Repository();
  final fetchUsd = PublishSubject<UsdModel>();

  Stream<UsdModel> get getUsd => fetchUsd.stream;

  getAllUsd(String db) async {
    HttpResult result = await _repository.getCourse(db);
    if (result.isSuccess) {
      UsdModel usdModel = UsdModel.fromJson(result.result);
      fetchUsd.sink.add(usdModel);
    }
  }
}
final courseBloc = CourseBloc();
