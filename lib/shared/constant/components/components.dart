import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:news_app/shared/news_cubit/news_app_cubit.dart';

Widget buildArticleItem(var article, context) {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        Container(
          width: 120.0,
          height: 120.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            image: DecorationImage(
              image: NetworkImage(
                  "${article['urlToImage'] ?? 'https://t3.ftcdn.net/jpg/04/62/93/66/360_F_462936689_BpEEcxfgMuYPfTaIAOC1tCDurmsno7Sp.jpg'}"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(width: 20.0),
        Expanded(
          child: SizedBox(
            height: 120.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    "${article['title']}",
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    style: NewsAppCubit.isDark
                        ? const TextStyle(
                            color: Colors.white,
                            fontSize: 17.0,
                            fontWeight: FontWeight.w700,
                          )
                        : const TextStyle(
                            color: Colors.black,
                            fontSize: 17.0,
                            fontWeight: FontWeight.w700,
                          ),
                  ),
                ),
                Text(
                  "${article['publishedAt']}",
                  style: NewsAppCubit.isDark
                      ? const TextStyle(
                          color: Colors.grey,
                          fontSize: 15.0,
                          fontWeight: FontWeight.w700,
                        )
                      : const TextStyle(
                          color: Colors.grey,
                          fontSize: 15.0,
                          fontWeight: FontWeight.w700,
                        ),
                ),
              ],
            ),
          ),
        )
      ],
    ),
  );
}

Widget myDivider() => Container(
      width: double.infinity,
      height: 1,
      color: NewsAppCubit.isDark ? Colors.grey : Colors.black,
    );

Widget articleBuilder(list, context) => ConditionalBuilder(
      condition: list.isNotEmpty,
      builder: (context) => ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemCount: list.length,
        itemBuilder: (context, index) => buildArticleItem(list[index], context),
        separatorBuilder: (BuildContext context, int index) => myDivider(),
      ),
      fallback: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
