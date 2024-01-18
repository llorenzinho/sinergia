part of 'documents_bloc.dart';

abstract class DocumentsState extends Equatable {
  const DocumentsState();  

  @override
  List<Object> get props => [];
}
class DocumentsInitial extends DocumentsState {}
