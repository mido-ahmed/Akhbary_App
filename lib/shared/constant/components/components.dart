import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';

Widget buildArticleItem(var article) {
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
              image: NetworkImage("${article['urlToImage']}")  ,
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
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Text(
                  "${article['publishedAt']}",
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
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
      color: Colors.black,
    );

Widget articleBuilder(list) => ConditionalBuilder(
      condition: list.isNotEmpty,
      builder: (context) => ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemCount: list.length,
        itemBuilder: (context, index) => buildArticleItem(list[index]),
        separatorBuilder: (BuildContext context, int index) => myDivider(),
      ),
      fallback: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
