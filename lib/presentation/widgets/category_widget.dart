import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_viewer/presentation/cubits/category/category_cubit.dart';

class CategoryText extends StatelessWidget {
  const CategoryText({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        return state is CategoryLoading
            ? const Center(child: CircularProgressIndicator())
            : state is CategoryLoaded
            ? Text(
                'Category: ${state.category.name}',
                style: TextStyle(
                  //converting to Hex color by removing '#' then concatenating with '0xff'
                  color: Color(int.parse('0xff${state.category.color.substring(1)}')),
                ),
              )
            : state is CategoryError
            ? Center(child: Text(state.error))
            : const Center(child: Text('Unknown State!'));
      },
    );
  }
}
