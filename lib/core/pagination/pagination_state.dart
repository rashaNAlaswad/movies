import '../networking/api_error_model.dart';

sealed class PaginationState<T> {
  const PaginationState();
}

class PaginationInitial<T> extends PaginationState<T> {
  const PaginationInitial();
}

class PaginationLoading<T> extends PaginationState<T> {
  const PaginationLoading();
}

class PaginationSuccess<T> extends PaginationState<T> {
  final List<T> items;
  final int currentPage;
  final bool hasMorePages;

  const PaginationSuccess({
    required this.items,
    required this.currentPage,
    required this.hasMorePages,
  });

  PaginationSuccess<T> copyWith({
    List<T>? items,
    int? currentPage,
    bool? hasMorePages,
  }) {
    return PaginationSuccess<T>(
      items: items ?? this.items,
      currentPage: currentPage ?? this.currentPage,
      hasMorePages: hasMorePages ?? this.hasMorePages,
    );
  }
}

class PaginationLoadingMore<T> extends PaginationState<T> {
  final List<T> items;
  final int currentPage;

  const PaginationLoadingMore({required this.items, required this.currentPage});
}

class PaginationFailure<T> extends PaginationState<T> {
  final ApiErrorModel error;

  const PaginationFailure(this.error);
}
