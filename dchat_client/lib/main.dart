import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dchat/presentation/blocs/bloc/kontak_bloc.dart';
import 'package:dchat/presentation/pages/main_page.dart';

import 'injector.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Inject all dependecies injector and wait for it is done
  await di.init();
  runApp(const Dchat());
}

class Dchat extends StatelessWidget {
  const Dchat({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => di.sl<KontakBloc>()
            ..add(
              const KontakFetchEvent(),
            ),
        ),
      ],
      child: const MaterialApp(
        home: MainPage(),
      ),
    );
  }
}
