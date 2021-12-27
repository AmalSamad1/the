import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';



import 'package:the/blocs/blocs.dart';
import 'package:the/repository/repository.dart';

import '../model/model.dart';

class ApiBloc extends Bloc<ApiEvent, ApiState>{
  final ApiRepository apiRepository;
  ApiBloc({@required this.apiRepository}):assert(apiRepository != null);

  @override
  ApiState get initialState => ApiLoading();

  @override
  Stream<ApiState> mapEventToState(ApiEvent event) async* {
    if (event is FetchPersonal){
      yield ApiLoading();
      try {
        final PersonalNew personal = await apiRepository.getProfile('');
        yield ApiLoaded(personal: personal);
      } catch(_){
        yield ApiError();
      }
    }
  }

}