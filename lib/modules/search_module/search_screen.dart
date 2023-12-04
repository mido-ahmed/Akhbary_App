import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/constant/components/components.dart';
import 'package:news_app/shared/news_cubit/news_app_cubit.dart';

class SearchScreen extends StatelessWidget {
  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsAppCubit, NewsAppState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = NewsAppCubit.get(context);
        var list = NewsAppCubit.get(context).search;
        return Scaffold(
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 50.0,
                  left: 20.0,
                  right: 20.0,
                ),
                child: defaultTextField(
                  onChange: (value) {
                    log(value.toString());
                    cubit.getSearch(value!);
                  },
                  controller: searchController,
                  type: TextInputType.text,
                  validate: (value) {
                    if (value!.isEmpty) {
                      return 'Search must not be empty';
                    }
                    return null;
                  },
                  label: 'Search',
                  prIcon: Icons.search_rounded,
                ),
              ),
              Expanded(
                child: articleBuilder(list, context),
              )
            ],
          ),
        );
      },
    );
  }
}
