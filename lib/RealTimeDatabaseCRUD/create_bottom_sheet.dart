import 'home_screen.dart';
import 'package:flutter/material.dart';

final TextEditingController nameController = TextEditingController();
final TextEditingController matricController = TextEditingController();

void createBottomSheet(BuildContext context) {
  showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.blue[100],
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
            top: 20,
            right: 20,
            left: 20,
            bottom: MediaQuery.of(context).viewInsets.bottom + 20,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Center(
                child: Text(
                  "Create your items",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: "Name",
                  hintText: "eg.Low",
                ),
              ),
              TextField(
                controller: matricController,
                decoration: const InputDecoration(
                  labelText: "Matric Number",
                  hintText: "eg.20020402",
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    final newRef =
                    databaseReference.push();
                    newRef.set({
                      'name': nameController.text.toString(),
                      'matric': matricController.text.toString(),
                      'id': newRef.key
                    });

                    //Add CREATE data function here!
                    //Insert "name", "matric" and "id"

                    nameController.clear();
                    matricController.clear();

                    Navigator.pop(context);
                  },
                  child: const Text("Add"))
            ],
          ),
        );
      });
}
