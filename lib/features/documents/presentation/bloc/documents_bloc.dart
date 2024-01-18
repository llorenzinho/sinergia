import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'documents_event.dart';
part 'documents_state.dart';

class DocumentsBloc extends Bloc<DocumentsEvent, DocumentsState> {
  DocumentsBloc() : super(DocumentsInitial()) {
    on<DocumentsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
