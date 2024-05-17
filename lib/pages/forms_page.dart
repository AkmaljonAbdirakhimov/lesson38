import 'package:flutter/material.dart';

class FormsPage extends StatefulWidget {
  const FormsPage({super.key});

  @override
  State<FormsPage> createState() => _FormsPageState();
}

class _FormsPageState extends State<FormsPage> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  String email = "";
  String name = "";
  String surname = "";
  String? nameError;
  String? emailError;

  @override
  void initState() {
    super.initState();

    nameController.text = "Alijon";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Forms"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Form(
              key: formKey,
              child: Column(
                children: [
                  const Text("TEXT FORM FIELDS"),
                  const SizedBox(height: 10),
                  TextFormField(
                    // textInputAction: TextInputAction.done,
                    initialValue: "Alijon",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Iltimos ism kiriting";
                      } else if (value.length < 4) {
                        return "Iltimos uzunroq ism kiriting";
                      }

                      return null;
                    },
                    onSaved: (newValue) {
                      name = newValue!;
                    },
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      suffixIcon: const Icon(Icons.person),
                      hintText: "Ism",
                      labelText: "Ism",
                      errorText: nameError,
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    initialValue: "Valijonov",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Iltimos familiya kiriting";
                      } else if (value.length < 4) {
                        return "Iltimos uzunroq familiya kiriting";
                      }

                      return null;
                    },
                    onSaved: (newValue) {
                      surname = newValue!;
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.person),
                      hintText: "Familiya",
                      labelText: "Familiya",
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    initialValue: "alijon@valijonov.uz",
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) {},
                    onSaved: (newValue) {
                      email = newValue!;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Iltimos email kiriting";
                      } else if (value.length < 4) {
                        return "Iltimos uzunroq email kiriting";
                      } else if (!value.contains("@")) {
                        return "To'g'ri email kiriting";
                      }

                      return null;
                    },
                    decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        suffixIcon: const Icon(Icons.email),
                        // focusedBorder: OutlineInputBorder(
                        //   borderSide: BorderSide(color: Colors.red),
                        // ),
                        hintText: "Email pochta",
                        labelText: "Email pochta",
                        errorText: emailError),
                  ),
                  const SizedBox(height: 10),
                  Text(email),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        print("Hammasi joyida!");
                        print(name);
                        print(surname);
                        print(email);
                      }
                    },
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.amber),
                    child: const Text("SEND"),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),
            Column(
              children: [
                const Text("TEXT FIELDS"),
                const SizedBox(height: 10),
                TextField(
                  // textInputAction: TextInputAction.done,
                  controller: nameController,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    suffixIcon: const Icon(Icons.person),
                    hintText: "Ism",
                    labelText: "Ism",
                    errorText: nameError,
                  ),
                ),
                const SizedBox(height: 10),
                const TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.person),
                    hintText: "Familiya",
                    labelText: "Familiya",
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  onChanged: (value) {
                    email = value;

                    setState(() {});
                  },
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      suffixIcon: const Icon(Icons.email),
                      // focusedBorder: OutlineInputBorder(
                      //   borderSide: BorderSide(color: Colors.red),
                      // ),
                      hintText: "Email pochta",
                      labelText: "Email pochta",
                      errorText: emailError),
                ),
                const SizedBox(height: 10),
                Text(email),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    String emailText = emailController.text.trim();
                    String nameText = nameController.text.trim();

                    if (emailText.isEmpty) {
                      emailError = "Iltimos email kiriting";
                    } else {
                      emailError = null;
                    }
                    if (nameText.isEmpty) {
                      nameError = "Iltimos name kiriting";
                    } else {
                      nameError = null;
                    }
                    setState(() {});
                  },
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.amber),
                  child: const Text("SEND"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
