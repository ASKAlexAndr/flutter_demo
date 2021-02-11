import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo/core/app_provider.dart';
import 'package:flutter_demo/core/routes.dart';
import 'package:flutter_demo/src/blocs/auth/auth_bloc.dart';
import 'package:flutter_demo/src/repositories/auth_repository.dart';

class RootPage extends StatefulWidget {
  RootPage({Key key}) : super(key: key);

  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  AuthBloc authBloc;

  // @override
  // void initState() {
  //   super.initState();
  //   authBloc = AuthBloc(AppProvider.getApplication(context));
  //   // bloc.fetchCatalog();
  // }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthBloc>(
      create: (BuildContext context) =>
          AuthBloc(AppProvider.getApplication(context)),
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          switch (state.status) {
            case AuthStatus.authenticated:
              AppProvider.getRouter(context)
                  .navigateTo(context, Routes.catalog);
              break;
            default:
              AppProvider.getRouter(context)
                  .navigateTo(context, Routes.authPhone);
              break;
          }
        },
      ),
    );
  }
}
