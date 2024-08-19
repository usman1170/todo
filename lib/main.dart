import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:todo/data/hive_data_store.dart';
import 'package:todo/models/task_model.dart';
import 'package:todo/provider/time_provider.dart';
import 'package:todo/screens/bottom_bar.dart';
import 'package:todo/theme/app_theme.dart';
import 'package:todo/theme/bloc/theme_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getApplicationDocumentsDirectory(),
  );
  await Hive.initFlutter();
  Hive.registerAdapter<TaskModel>(TaskModelAdapter());
  var box = await Hive.openBox<TaskModel>(HiveDataStore.boxName);
  box.values.forEach((task) {
    if (task.createdTime.day != DateTime.now().day) {
      task.delete();
    } else {}
  });
  runApp(BaseWidget(child: const MyApp()));
}

class BaseWidget extends InheritedWidget {
  BaseWidget({super.key, required this.child}) : super(child: child);
  final HiveDataStore hiveDataStore = HiveDataStore();
  final Widget child;
  static BaseWidget of(BuildContext context) {
    final base = context.dependOnInheritedWidgetOfExactType<BaseWidget>();
    if (base != null) {
      return base;
    } else {
      throw StateError("could not find the ancaster widget of base widget");
    }
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return false;
  }
}

late Size mq;

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeMode>(builder: (context, state) {
        return ChangeNotifierProvider(
          create: (_) => TimeProvider(),
          child: MaterialApp(
            title: 'To Do',
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: state,
            debugShowCheckedModeBanner: false,
            home: const BottomBar(),
          ),
        );
      }),
    );
  }
}
