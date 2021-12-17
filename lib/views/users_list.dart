import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:outshade_task/models/user.dart';
import 'package:outshade_task/services/received_data.dart';
import 'package:outshade_task/views/user_info.dart';

class UsersList extends StatefulWidget {
  const UsersList({Key? key}) : super(key: key);

  @override
  _UsersListState createState() => _UsersListState();
}

class _UsersListState extends State<UsersList> with WidgetsBindingObserver {
  UserList users = UserList.fromJson(jsonList);

  final _formKey = GlobalKey<FormState>();
  final box = GetStorage();

  _listCall() {
    users = UserList.fromJson(jsonList);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
              itemCount: users.users.length,
              itemBuilder: (_, index) => Card(
                    color: Colors.green[100],
                    child: ListTile(
                      title: MaterialButton(
                          onPressed: () {
                            box.read(users.users[index].id) == null
                                ? showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      int age = -1;
                                      String gender = "male";
                                      return StatefulBuilder(
                                        builder: (_, setState) => AlertDialog(
                                          shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10.0))),
                                          backgroundColor: Colors.white,
                                          title: const Center(
                                              child: Text(
                                            'Add user info',
                                            style:
                                                TextStyle(color: Colors.green),
                                          )),
                                          content: SizedBox(
                                            height: 150,
                                            child: Form(
                                              key: _formKey,
                                              child: Column(
                                                children: [
                                                  TextFormField(
                                                    onChanged: (val) {
                                                      age = int.parse(val);
                                                    },
                                                    textInputAction:
                                                        TextInputAction.next,
                                                    cursorColor: Colors.white,
                                                    validator: (value) {
                                                      if (value!.isNotEmpty) {
                                                        return null;
                                                      }
                                                      return "Enter valid age";
                                                    },
                                                    keyboardType:
                                                        TextInputType.number,
                                                    autocorrect: true,
                                                    expands: false,
                                                    style: const TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                    decoration: InputDecoration(
                                                      filled: true,
                                                      fillColor: Colors.green,
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16.0),
                                                        borderSide:
                                                            const BorderSide(
                                                          color: Colors.blue,
                                                        ),
                                                      ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16.0),
                                                        borderSide:
                                                            const BorderSide(
                                                          color: Colors.green,
                                                          width: 2.0,
                                                        ),
                                                      ),
                                                      errorBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16.0),
                                                        borderSide:
                                                            const BorderSide(
                                                          color: Colors.red,
                                                          width: 2.0,
                                                        ),
                                                      ),
                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16.0),
                                                        borderSide:
                                                            const BorderSide(
                                                                width: 0.0),
                                                      ),
                                                      contentPadding:
                                                          const EdgeInsets
                                                                  .symmetric(
                                                              horizontal: 16.0,
                                                              vertical: 2.0),
                                                      hintText: "Age",
                                                      hintStyle:
                                                          const TextStyle(
                                                              fontSize: 12,
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  Container(
                                                    decoration:
                                                        const ShapeDecoration(
                                                      color: Colors.green,
                                                      // gradient: LinearGradient[],
                                                      // color: Colors.green,
                                                      shape: RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius.circular(
                                                                      16.0))),
                                                    ),
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 16.0,
                                                          vertical: 10.0),
                                                      child: Align(
                                                        alignment:
                                                            Alignment.center,
                                                        child:
                                                            DropdownButtonHideUnderline(
                                                          child: DropdownButton<
                                                              String>(
                                                            isExpanded: true,
                                                            isDense: true,
                                                            elevation: 1,
                                                            icon: const Icon(
                                                              Icons
                                                                  .arrow_drop_down_rounded,
                                                              color:
                                                                  Colors.white,
                                                              size: 24,
                                                            ),
                                                            hint: Text(
                                                              'Gender :  ' +
                                                                  gender,
                                                              style: const TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                            ),
                                                            //focusColor: Colors.green,
                                                            //dropdownColor: Colors.white,
                                                            style: const TextStyle(
                                                                fontSize: 12,
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                            items: <String>[
                                                              'male',
                                                              'female',
                                                              'other'
                                                            ].map(
                                                                (String value) {
                                                              return DropdownMenuItem<
                                                                      String>(
                                                                  value: value,
                                                                  child: Text(
                                                                    value,
                                                                    style: const TextStyle(
                                                                        color: Colors
                                                                            .black),
                                                                  ));
                                                            }).toList(),
                                                            onChanged: (value) {
                                                              setState(() {
                                                                print(value);
                                                                gender = value
                                                                    .toString();
                                                              });
                                                              setState(() {});
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          actions: [
                                            Center(
                                              child: ElevatedButton(
                                                  child: const Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 10.0,
                                                            horizontal: 10.0),
                                                    child: Text(
                                                      "Sign In",
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                  style: ButtonStyle(
                                                      backgroundColor:
                                                          MaterialStateProperty
                                                              .all(
                                                                  Colors.green),
                                                      shape: MaterialStateProperty.all(
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          16.0),
                                                              side: const BorderSide(
                                                                  color: Colors
                                                                      .green)))),
                                                  onPressed: () {
                                                    if (_formKey.currentState!
                                                            .validate() ==
                                                        true) {
                                                      final box = GetStorage();
                                                      box.write(
                                                          users.users[index].id,
                                                          age.toString() +
                                                              ' ' +
                                                              gender);
                                                      print(box.read(users
                                                          .users[index].id));
                                                      print(users
                                                          .users[index].atype);
                                                      Navigator.pop(context);
                                                      Navigator.push(
                                                          _,
                                                          MaterialPageRoute(
                                                              builder: (_) => UserInfo(
                                                                  users
                                                                      .users[
                                                                          index]
                                                                      .id,
                                                                  users
                                                                      .users[
                                                                          index]
                                                                      .name,
                                                                  users
                                                                      .users[
                                                                          index]
                                                                      .atype))).then(
                                                          (value) {
                                                        _listCall();
                                                        setState() {}
                                                        ;
                                                      });
                                                    }
                                                  }),
                                            ),
                                          ],
                                        ),
                                      );
                                    })
                                : Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => UserInfo(
                                            users.users[index].id,
                                            users.users[index].name,
                                            users.users[index].atype)));
                          },
                          child: Text(users.users[index].name)),
                      trailing: box.read(users.users[index].id) == null
                          ? MaterialButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      int age = -1;
                                      String gender = "male";
                                      return StatefulBuilder(
                                        builder: (_, setState) => AlertDialog(
                                          shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10.0))),
                                          backgroundColor: Colors.white,
                                          title: const Center(
                                              child: Text(
                                            'Add user info',
                                            style:
                                                TextStyle(color: Colors.green),
                                          )),
                                          content: SizedBox(
                                            height: 150,
                                            child: Form(
                                              key: _formKey,
                                              child: Column(
                                                children: [
                                                  TextFormField(
                                                    onChanged: (val) {
                                                      age = int.parse(val);
                                                    },
                                                    textInputAction:
                                                        TextInputAction.next,
                                                    cursorColor: Colors.white,
                                                    validator: (value) {
                                                      if (value!.isNotEmpty) {
                                                        return null;
                                                      }
                                                      return "Enter valid age";
                                                    },
                                                    keyboardType:
                                                        TextInputType.number,
                                                    autocorrect: true,
                                                    expands: false,
                                                    style: const TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                    decoration: InputDecoration(
                                                      filled: true,
                                                      fillColor: Colors.green,
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16.0),
                                                        borderSide:
                                                            const BorderSide(
                                                          color: Colors.blue,
                                                        ),
                                                      ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16.0),
                                                        borderSide:
                                                            const BorderSide(
                                                          color: Colors.green,
                                                          width: 2.0,
                                                        ),
                                                      ),
                                                      errorBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16.0),
                                                        borderSide:
                                                            const BorderSide(
                                                          color: Colors.red,
                                                          width: 2.0,
                                                        ),
                                                      ),
                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16.0),
                                                        borderSide:
                                                            const BorderSide(
                                                                width: 0.0),
                                                      ),
                                                      contentPadding:
                                                          const EdgeInsets
                                                                  .symmetric(
                                                              horizontal: 16.0,
                                                              vertical: 2.0),
                                                      hintText: "Age",
                                                      hintStyle:
                                                          const TextStyle(
                                                              fontSize: 12,
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  Container(
                                                    decoration:
                                                        const ShapeDecoration(
                                                      color: Colors.green,
                                                      // gradient: LinearGradient[],
                                                      // color: Colors.green,
                                                      shape: RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius.circular(
                                                                      16.0))),
                                                    ),
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 16.0,
                                                          vertical: 10.0),
                                                      child: Align(
                                                        alignment:
                                                            Alignment.center,
                                                        child:
                                                            DropdownButtonHideUnderline(
                                                          child: DropdownButton<
                                                              String>(
                                                            isExpanded: true,
                                                            isDense: true,
                                                            elevation: 1,
                                                            icon: const Icon(
                                                              Icons
                                                                  .arrow_drop_down_rounded,
                                                              color:
                                                                  Colors.white,
                                                              size: 24,
                                                            ),
                                                            hint: Text(
                                                              'Gender :  ' +
                                                                  gender,
                                                              style: const TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                            ),
                                                            style: const TextStyle(
                                                                fontSize: 12,
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                            items: <String>[
                                                              'male',
                                                              'female',
                                                              'other'
                                                            ].map(
                                                                (String value) {
                                                              return DropdownMenuItem<
                                                                      String>(
                                                                  value: value,
                                                                  child: Text(
                                                                    value,
                                                                    style: const TextStyle(
                                                                        color: Colors
                                                                            .black),
                                                                  ));
                                                            }).toList(),
                                                            onChanged: (value) {
                                                              setState(() {
                                                                print(value);
                                                                gender = value
                                                                    .toString();
                                                              });
                                                              setState(() {});
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          actions: [
                                            Center(
                                              child: ElevatedButton(
                                                  child: const Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 10.0,
                                                            horizontal: 10.0),
                                                    child: Text(
                                                      "Sign In",
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                  style: ButtonStyle(
                                                      backgroundColor:
                                                          MaterialStateProperty
                                                              .all(
                                                                  Colors.green),
                                                      shape: MaterialStateProperty.all(
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          16.0),
                                                              side: const BorderSide(
                                                                  color: Colors
                                                                      .green)))),
                                                  onPressed: () {
                                                    if (_formKey.currentState!
                                                            .validate() ==
                                                        true) {
                                                      final box = GetStorage();
                                                      box.write(
                                                          users.users[index].id,
                                                          age.toString() +
                                                              ' ' +
                                                              gender);
                                                      Navigator.pop(context);
                                                      print(
                                                          'User Id: ${users.users[index].id} signed In');
                                                      Navigator.push(
                                                          _,
                                                          MaterialPageRoute(
                                                              builder: (_) => UserInfo(
                                                                  users
                                                                      .users[
                                                                          index]
                                                                      .id,
                                                                  users
                                                                      .users[
                                                                          index]
                                                                      .name,
                                                                  users
                                                                      .users[
                                                                          index]
                                                                      .atype))).then(
                                                          (value) {
                                                        _listCall();
                                                        setState() {}
                                                        ;
                                                      });
                                                    }
                                                  }),
                                            ),
                                          ],
                                        ),
                                      );
                                    });
                              },
                              child: const Text(
                                'Sign In',
                                style: TextStyle(color: Colors.green),
                              ),
                            )
                          : MaterialButton(
                              onPressed: () {
                                setState(() {
                                  box.remove(users.users[index].id);
                                  print(
                                      'user id: ${users.users[index].id} signed Out');
                                });
                              },
                              child: const Text(
                                'Sign Out',
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                      leading: Text(users.users[index].id),
                    ),
                  )),
        ),
      ),
    );
  }
}
