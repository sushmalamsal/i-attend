// import 'package:i_attend/import_all.dart';
// import 'package:i_attend/modules/tasks/widgets/k_task_container.dart';
// import 'package:rive/rive.dart';

// class BookView extends StatelessWidget {
//   const BookView({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ViewModelBuilder<BookViewModel>.reactive(
//       viewModelBuilder: () => BookViewModel(),
//       builder: (context, model, child) {
//         return GestureDetector(
//           onTap: model.onBookTap,
//           child: Stack(children: <Widget>[
//             RiveAnimation.asset(
//               'assets/book_flip.riv',
//               fit: BoxFit.contain,
//               onInit: model.onRiveInit,
//             ),
//             TaskContainer(
//                 taskTitle: "hello",
//                 deadline: "hehe",
//                 description: "bye",
//                 assigningEntity: "hiie", )
//           ]),
//         );
//       },
//     );
//   }
// }
