// // ignore_for_file: prefer_const_constructors

// import 'package:flutter/material.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:todo/utils/DialogBox.dart';
// import 'package:todo/utils/Todo_items.dart';
// import 'database/database.dart';

// class Home extends StatefulWidget {
//   const Home({super.key});

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   // reference the hive box
//   final _mybox = Hive.box('mybox');
//   Todo_db db_todo = Todo_db();

//   @override
//   void initState() {
//     if (_mybox.get("TODOLIST") == null) {
//       db_todo.InitialData();
//     } else {
//       db_todo.LoadData();
//     }
//     super.initState();
//   }

//   final titlecontroller = TextEditingController();
//   final detailcontroller = TextEditingController();

//   void checkbox_changed(bool? value, int index) {
//     setState(() {
//       db_todo.ToDoList[index][2] = !db_todo.ToDoList[index][2];
//     });
//     db_todo.update_db();
//   }

//   void saveTask() {
//     setState(() {
//       db_todo.ToDoList.add(
//           [titlecontroller.text, detailcontroller.text, false]);
//     });
//     titlecontroller.clear();
//     detailcontroller.clear();
//     Navigator.of(context).pop();
//     db_todo.update_db();
//   }

//   void createTask() {
//     showModalBottomSheet(
//       isScrollControlled: true,
//       context: context,
//       builder: (BuildContext context) {
//         return BottomSheetDialog(
//           onSave: saveTask,
//           onCancel: () => Navigator.of(context).pop(),
//           titleController: titlecontroller,
//           detailsController: detailcontroller,
//           save_or_update: "Save",
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           centerTitle: true,
//           elevation: 0,
//           backgroundColor: Colors.purple,
//           title: Text("To Do"),
//         ),
//         floatingActionButton: FloatingActionButton(
//           onPressed: createTask,
//           child: Icon(Icons.add),
//         ),
//         body: ListView.builder(
//           itemCount: db_todo.ToDoList.length,
//           itemBuilder: (context, index) {
//             return TodoItems(
//               taskTitle: db_todo.ToDoList[index][0],
//               taskDetail: db_todo.ToDoList[index][1],
//               taskCompleted: db_todo.ToDoList[index][2],
//               onChange: (value) => checkbox_changed(value, index),
//               DeleteFunction: (context) {
//                 setState(() {
//                   db_todo.ToDoList.removeAt(index);
//                 });
//                 db_todo.update_db();
//               },
//               EditFuncion: (context) {
//                 showDialog(
//                   context: context,
//                   builder: (context) {
//                     // Fetch initial data
//                     String initialTitle = db_todo.ToDoList[index][0];
//                     String initialDetails = db_todo.ToDoList[index][1];

//                     // Create TextEditingController instances and set initial values
//                     TextEditingController titleController =
//                         TextEditingController(text: initialTitle);
//                     TextEditingController detailsController =
//                         TextEditingController(text: initialDetails);

//                     return BottomSheetDialog(
//                       titleController: titleController,
//                       detailsController: detailsController,
//                       save_or_update: "Update",
//                       onSave: () {
//                         setState(() {
//                           db_todo.ToDoList[index][0] = titleController.text;
//                           db_todo.ToDoList[index][1] = detailsController.text;
//                         });
//                         titleController.clear();
//                         detailsController.clear();
//                         Navigator.of(context).pop();
//                         db_todo.update_db();
//                       },
//                       onCancel: () {
//                         Navigator.of(context).pop();
//                       },
//                     );
//                   },
//                 );
//               },
//             );
//           },
//         ));
//   }
// }
