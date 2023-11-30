import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/constant/components/components.dart';
import 'package:news_app/shared/news_cubit/news_app_cubit.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsAppCubit, NewsAppState>(
      listener: (context, state) {},
      builder: (context, state) {
        var businessList = NewsAppCubit.get(context).business;
        return articleBuilder(businessList , context);
      },
    );
  }
}
