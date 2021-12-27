import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:the/blocs/blocs.dart';
import 'package:the/home/home.dart';
import 'package:the/repository/repository.dart';

class HomePage extends StatelessWidget {
  final ApiRepository apiRepository;
  HomePage({Key key, this.apiRepository}):assert(apiRepository != null);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: BlocProvider(create: (context)=> ApiBloc(apiRepository: apiRepository),
        child:Home()
      ),
    );
  }
}
