import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/add_notes_cubit/cubit/add_note_cubit.dart';
import 'package:notes_app/views/notes_view.dart';
import 'package:notes_app/views/widgets/simple_bloc_observer.dart';

import 'constant.dart';
import 'models/node_model.dart';

void main() async {
  Bloc.observer = SimpleBlocObserver();

  await Hive.initFlutter();
  Hive.registerAdapter(NodeModelAdapter());
  await Hive.openBox<NodeModel>(kNotesBox);

  
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AddNoteCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
          fontFamily: 'Poppins',
        ),
        home: const NotesView(),
      ),
    );
  }
}
