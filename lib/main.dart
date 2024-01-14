import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinergia/features/cities/presentation/bloc/cities_bloc.dart';
import 'package:sinergia/features/select_region/presentation/cubit/select_region_cubit.dart';
import 'package:sinergia/firebase_options.dart';
import 'package:sinergia/injection_container.dart';
import 'package:sinergia/view/pages/home.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await initDependencies(); // init GetIt dependencies, ensure to start firebase before
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  // App root widget
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SelectRegionCubit>(
            create: (context) => sl<SelectRegionCubit>()),
        BlocProvider<CitiesBloc>(create: (context) => sl<CitiesBloc>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Sinergia',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent),
          useMaterial3: true,
        ),
        home: const Home(),
      ),
    );
  }
}
