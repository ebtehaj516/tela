import 'package:go_router/go_router.dart';
import 'package:tela/features/games_and_story/model/storymodel.dart';
import 'package:tela/features/person_and_clothes/clothes.dart';
import 'package:tela/features/person_and_clothes/personality.dart';
import '../../features/Home/HomePage.dart';
import '../../features/camera/CameraPicture.dart';
import '../../features/games_and_story/game.dart';
import '../../features/games_and_story/games/Arabic_fill_word.dart';
import '../../features/games_and_story/games/english_fill_word.dart';
import '../../features/games_and_story/history.dart';
import '../../features/games_and_story/stories.dart';
import '../../features/games_and_story/story.dart';
import '../../features/login/login.dart';
import '../../features/register/Siginup.dart';

//Gorouter object for increase performance of tarnsfer between pages in the app
final GoRouter router = GoRouter(
  routes: [
    //router of SignIn page
    GoRoute(
      path: '/',
      builder: (context, state) => const SignIn(),
    ),
    //router of Signup page
    GoRoute(
      path: '/Signup',
      builder: (context, state) => SignUp(
        clothes: state.extra! as List,
      ),
    ),
    //router of HomePage page
    GoRoute(
      path: '/HomePage',
      builder: (context, state) => const HomePage(),
    ),
    //router of Game page
    GoRoute(
      path: '/Game',
      builder: (context, state) => const Game(),
    ),
    //router of Stories page
    GoRoute(
      path: '/Stories',
      builder: (context, state) => const Stories(),
    ),
    //router of Story page
    GoRoute(
      path: '/Story',
      builder: (context, state) =>
          Story(storyModel: state.extra! as StoryModel),
    ),
    //router of History page
    GoRoute(
      path: '/History',
      builder: (context, state) => History(
        second: state.extra! as int,
      ),
    ),
    //router of CameraPicture page
    GoRoute(
      path: '/CameraPicture',
      builder: (context, state) => const CameraPicture(),
    ),
    //router of FillArabic page
    GoRoute(
      path: '/FillArabic',
      builder: (context, state) => const FillArabic(),
    ),
    //router of FillEnglish page
    GoRoute(
      path: '/FillEnglish',
      builder: (context, state) => const FillEnglish(),
    ),
    //router of Personality page
    GoRoute(
      path: '/Personality',
      builder: (context, state) => const Personality(),
    ),
    //router of Clothes page
    GoRoute(
      path: '/Clothes',
      builder: (context, state) => Clothes(
        typePerson: state.extra! as String,
      ),
    ),
  ],
);
