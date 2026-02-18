
//
//
// class UserScreen extends StatefulWidget {
//   @override
//   _UserScreenState createState() => _UserScreenState();
// }
//
// class _UserScreenState extends State<UserScreen> {
//  // final HiveService _hiveService = HiveService();
//   final _nameController = TextEditingController();
//   final _ageController = TextEditingController();
//
//   void _addUser() {
//     final name = _nameController.text;
//     final age = int.tryParse(_ageControlle r.text) ?? 0;
//
//     if (name.isNotEmpty) {
//       _hiveService.addUser(UserModel(name: name, age: age));
//       _nameController.clear();
//       _ageController.clear();
//     }
//   }
//
//   void _updateUser(int index) {
//     final name = _nameController.text;
//     final age = int.tryParse(_ageController.text) ?? 0;
//
//     if (name.isNotEmpty) {
//       _hiveService.updateUser(index, UserModel(name: name, age: age));
//       _nameController.clear();
//       _ageController.clear();
//     }
//   }
//
//   void _deleteUser(int index) {
//     _hiveService.deleteUser(index);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Hive CRUD Example")),
//       body: Padding(
//         padding: EdgeInsets.all(16),
//         child: Column(
//           children: [
//             TextField(controller: _nameController, decoration: InputDecoration(labelText: "Name")),
//             VerticalSpace(height: 10),
//             TextField(controller: _ageController, decoration: InputDecoration(labelText: "Age"), keyboardType: TextInputType.number),
//             SizedBox(height: 10),
//             ElevatedButton(onPressed: _addUser, child: Text("Add User")),
//             SizedBox(height: 20),
//             Expanded(
//               child: ValueListenableBuilder(
//                 valueListenable: HiveBoxes.userBox().listenable(),
//                 builder: (context, box, _) {
//                   final users = box.values.toList();
//                   return ListView.builder(
//                     itemCount: users.length,
//                     itemBuilder: (context, index) {
//                       final user = users[index];
//                       return ListTile(
//                         title: Text(user.name),
//                         subtitle: Text("Age: ${user.age}"),
//                         trailing: Row(
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             IconButton(
//                               icon: Icon(Icons.edit),
//                               onPressed: () {
//                                 _nameController.text = user.name;
//                                 _ageController.text = user.age.toString();
//                                 _updateUser(index);
//                               },
//                             ),
//                             IconButton(
//                               icon: Icon(Icons.delete),
//                               onPressed: () => _deleteUser(index),
//                             ),
//                           ],
//                         ),
//                       );
//                     },
//                   );
//                 },
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
