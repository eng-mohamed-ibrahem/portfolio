import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/features/works/presentation/cubit/works_cubit.dart';

class WorksView extends StatelessWidget {
  const WorksView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorksCubit, WorksState>(
      builder: (context, state) {
        if (state is WorksLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is WorksLoaded) {
          return ListView.builder(
            itemCount: state.works.length,
            itemBuilder: (context, index) {
              final work = state.works[index];
              return ListTile(
                title: Text(work.title),
                subtitle: Text(work.company),
              );
            },
          );
        } else if (state is WorksError) {
          return Center(child: Text(state.message));
        } else {
          return const Center(child: Text('Initial State'));
        }
      },
    );
  }
}
