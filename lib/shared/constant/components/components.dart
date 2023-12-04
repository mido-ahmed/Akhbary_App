import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:news_app/modules/search_module/search_screen.dart';
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

Widget defaultTextField({
  required TextEditingController controller,
  bool enable = true,
  required TextInputType type,
  Function? onSubmit,
  Function(String? s)? onChange,
  IconData? prIcon,
  IconData? sfIcon,
  Function? onTap,
  bool isPassword = false,
  VoidCallback? suffixPressed,
  required String? Function(String? value)? validate,
  String? label,
  FocusNode? focusNode,
}) =>
    TextFormField(
      cursorColor: NewsAppCubit.isDark ? Colors.white : Colors.black,
      controller: controller,
      focusNode: focusNode,
      enabled: enable,
      onTap: () {
        onTap != null ? onTap() : null;
      },
      keyboardType: type,
      onFieldSubmitted: (value) {
        onSubmit!(value);
      },
      onChanged: (value) {
        if (onChange != null) {
          onChange(value);
        }
      },
      style: TextStyle(
        color: NewsAppCubit.isDark ? Colors.white : Colors.black,
      ),
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
          color: NewsAppCubit.isDark ? Colors.white : Colors.black,
        ),
        iconColor: NewsAppCubit.isDark ? Colors.white : Colors.black,
        prefixIconColor: NewsAppCubit.isDark ? Colors.white : Colors.black,
        suffixIconColor: NewsAppCubit.isDark ? Colors.white : Colors.black,
        prefixIcon: Icon(prIcon),
        suffixIcon: sfIcon != null
            ? IconButton(onPressed: suffixPressed, icon: Icon(sfIcon))
            : null,
        border: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(30)),
          borderSide: BorderSide(
            style: BorderStyle.solid,
            color: NewsAppCubit.isDark ? Colors.white : Colors.black,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(30)),
          borderSide: BorderSide(
            width: 1.0,
            style: BorderStyle.solid,
            color: NewsAppCubit.isDark ? Colors.white : Colors.black,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(30)),
          borderSide: BorderSide(
            style: BorderStyle.solid,
            color: NewsAppCubit.isDark ? Colors.white : Colors.black,
          ),
        ),
      ),
      validator: validate,
    );

void navigateToPage(context, widget) =>
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => widget,
    ));
