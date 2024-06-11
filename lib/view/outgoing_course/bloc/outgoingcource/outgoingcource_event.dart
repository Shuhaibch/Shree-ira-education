part of 'outgoingcource_bloc.dart';

sealed class OutgoingcourceEvent extends Equatable {
  const OutgoingcourceEvent();

  @override
  List<Object> get props => [];
}

final class GetAllCourcesEvent extends OutgoingcourceEvent {
  final String categoryId;
  final String subCategoryId;

  const GetAllCourcesEvent({
    required this.categoryId,
    required this.subCategoryId,
  });
}

final class GetFilterCourcesEvent extends OutgoingcourceEvent {
  final String subCategoryId;
  final String categoryId;
  final String sortBy;
  final String priceType;

  const GetFilterCourcesEvent({
    required this.subCategoryId,
    required this.categoryId,
    required this.sortBy,
    required this.priceType,
  });
}
