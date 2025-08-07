// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:healthcare_assignment/data/model/user_model.dart';
// import 'package:healthcare_assignment/presentation/screens/home/userpost_viewmodel.dart';
// import 'package:healthcare_assignment/presentation/screens/login/login_viewmodel.dart';
// import 'package:provider/provider.dart';

// class _UserpostViewState extends State<UserpostView> {
//   @override
//   void initState() {
//     super.initState();

//     // Call fetch method after build context is ready
//     Future.microtask(() {
//       Provider.of<UserpostViewmodel>(context, listen: false).fetchUserPost();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final viewModel = Provider.of<UserpostViewmodel>(context);

//     return Scaffold(
//       body: viewModel.isLoading
//           ? const Center(child: CircularProgressIndicator())
//           : ListView.builder(
//               itemCount: viewModel.user?.length, // assuming a list
//               itemBuilder: (context, index) {
//                 final user = viewModel.user[index];
//                 return ListTile(
//                   title: Text(user.title ?? "No Title"),
//                   subtitle: Text(user.body ?? "No Body"),
//                 );
//               },
//             ),
//     );
//   }
// }
