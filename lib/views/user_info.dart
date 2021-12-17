import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class UserInfo extends StatelessWidget {
  UserInfo(this.id, this.name, this.atype, {Key? key}) : super(key: key);

  final String id;
  final String name;
  final String atype;
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                    color: Colors.green,
                    iconSize: 40,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_left)),
              ),
              const Text(
                '-- USER INFO --',
                style: TextStyle(color: Colors.green, fontSize: 24),
              ),
              const SizedBox(
                height: 5,
              ),
              const Divider(
                color: Colors.black87,
                thickness: 1,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      decoration: const ShapeDecoration(
                        color: Colors.green,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(16))),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: const Center(
                        child: Text(
                          ' User Id',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(
                      flex: 1,
                      child: Container(
                          decoration: const ShapeDecoration(
                            color: Colors.green,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                              topRight: Radius.circular(16),
                            )),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: Center(
                            child: Text(
                              id,
                              style: const TextStyle(
                                  fontSize: 18, color: Colors.white),
                            ),
                          ))),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      color: Colors.green,
                      child: const Center(
                        child: Text(
                          ' Name ',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(
                      flex: 1,
                      child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          color: Colors.green,
                          child: Center(
                            child: Text(
                              name,
                              style: const TextStyle(
                                  fontSize: 18, color: Colors.white),
                            ),
                          ))),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      color: Colors.green,
                      child: const Center(
                        child: Text(
                          ' Age ',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(
                      flex: 1,
                      child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          color: Colors.green,
                          child: Center(
                            child: Text(
                              box.read(id).split(' ')[0],
                              style: const TextStyle(
                                  fontSize: 18, color: Colors.white),
                            ),
                          ))),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      color: Colors.green,
                      child: const Center(
                        child: Text(
                          ' Gender ',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(
                      flex: 1,
                      child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          color: Colors.green,
                          child: Center(
                            child: Text(
                              box.read(id).split(' ')[1],
                              style: const TextStyle(
                                  fontSize: 18, color: Colors.white),
                            ),
                          ))),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      decoration: const ShapeDecoration(
                        color: Colors.green,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(16))),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      //color: Colors.green,
                      child: const Center(
                        child: Text(
                          ' atype ',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(
                      flex: 1,
                      child: Container(
                          decoration: const ShapeDecoration(
                            color: Colors.green,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(16))),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: Center(
                            child: Text(
                              atype,
                              style: const TextStyle(
                                  fontSize: 18, color: Colors.white),
                            ),
                          ))),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
