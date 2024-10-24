import 'package:blog_posts/Blog_provider.dart';
import 'package:blog_posts/Homepage.dart';
import 'package:blog_posts/cubit/Blog_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'components/custom_navigator.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => Blog_provider()),
    BlocProvider(create: (_) => BlogCubit())
  ], child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    print(BlocProvider.of<BlogCubit>(context).state.themeMode);
    return BlocBuilder<BlogCubit, state_class>(builder: (context, state) {
      return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: themes().light,
          darkTheme: themes().dark,
          //themeMode: Provider.of<Blog_provider>(context).themeMode,
          themeMode: BlocProvider.of<BlogCubit>(context).state.themeMode,
          home: CustomNavigator());
    });
  }
}

({ThemeData light, ThemeData dark}) themes() {
  ThemeData lightTheme = ThemeData.light(
    useMaterial3: true,
  );

  ThemeData darkTheme = ThemeData.dark(useMaterial3: true);
  return (
    light: lightTheme.copyWith(
        colorScheme: ColorScheme.fromSeed(
            seedColor: Color(0xFFFFDE3F), brightness: Brightness.light),
        textTheme: lightTheme.textTheme
            .apply(fontFamily: 'Edu VIC WA NT Beginner')), //offline textheme
    dark: darkTheme.copyWith(
      colorScheme: ColorScheme.fromSeed(
          seedColor: Color(0xFFFFDE3F), brightness: Brightness.dark),
      textTheme: GoogleFonts.eduVicWaNtBeginnerTextTheme(
          darkTheme.textTheme), //online text theme
    )
  );
}
