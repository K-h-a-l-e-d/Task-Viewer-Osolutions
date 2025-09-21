import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_viewer/presentation/cubits/category/category_cubit.dart';
import 'package:task_viewer/presentation/widgets/error_text.dart';

class CategoryText extends StatelessWidget {
  const CategoryText({super.key, required this.categoryId});

  final int categoryId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoryCubit()..getCategoryById(categoryId),
      child: BlocBuilder<CategoryCubit, CategoryState>(
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
              ? ErrorText(apiError: state.apiError)
              : const Center(child: Text('Unknown State!'));
        },
      ),
    );
  }
}
