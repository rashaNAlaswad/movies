import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/pagination/pagination_state.dart';
import '../../domain/entities/movie_entity.dart';
import '../cubit/home_cubit.dart';
import '../widgets/home_error_widget.dart';
import '../widgets/movie_shimmer_loading.dart';
import '../widgets/movies_grid_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  bool _isFetchingMore = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom && !_isFetchingMore) {
      _isFetchingMore = true;
      context.read<HomeCubit>().loadMore().whenComplete(() {
        _isFetchingMore = false;
      });
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Popular Movies'), centerTitle: true),
      body: BlocBuilder<HomeCubit, PaginationState<MovieEntity>>(
        buildWhen: (previous, current) => current is! PaginationLoadingMore,
        builder: (context, state) {
          return switch (state) {
            PaginationLoading() => const MovieShimmerLoading(),
            PaginationSuccess() => MoviesGridView(
              scrollController: _scrollController,
              movies: state.items,
              hasMorePages: state.hasMorePages,
            ),
            PaginationLoadingMore(:final items) => MoviesGridView(
              scrollController: _scrollController,
              movies: items,
              hasMorePages: true,
            ),
            PaginationFailure(:final error) => HomeErrorWidget(
              message: error.message ?? 'Failed to load movies',
              onRetry: () => context.read<HomeCubit>().fetchFirstPage(),
            ),
            _ => const SizedBox.shrink(),
          };
        },
      ),
    );
  }
}
