import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/models/node_model.dart';

import '../../constant.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());
  List<NodeModel>? notes;
  fetchAllNotes() {
    var notesBox = Hive.box<NodeModel>(kNotesBox);
     notes = notesBox.values.toList();
    
  }
}
