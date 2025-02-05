import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:soko_beauty/core/views/widgets/custom_snackbar.dart';
import 'package:soko_beauty/feautures/auth/data/models/user_model.dart';
import 'package:soko_beauty/feautures/auth/views/services/user_provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:soko_beauty/feautures/auth/views/widgets/auth_buttons.dart';
import 'package:soko_beauty/feautures/auth/views/widgets/custom_textfield.dart';
import 'package:soko_beauty/core/controllers/file_controller.dart';
import 'package:soko_beauty/landing.dart';

class AddAccountInfo extends StatefulWidget {
  final User user;

  AddAccountInfo({required this.user});

  @override
  _AddAccountInfoState createState() => _AddAccountInfoState();
}

class _AddAccountInfoState extends State<AddAccountInfo> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _fnameController = TextEditingController();
  final _lnameController = TextEditingController();
  final _bioController = TextEditingController();
  final _phoneController = TextEditingController();
  final _profilePhotoUrlController = TextEditingController();
  final _imagePicker = ImagePicker();
  DateTime? _selectedDate;
  String? _selectedGender;

  UserProvider userProvider = UserProvider();
  FileController _fileController = FileController();

  Future<void> _submitForm(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      );

      // Upload the image to Firebase Storage
      String profilePhotoUrl = '';
      if (_profilePhotoUrlController.text.isNotEmpty) {
        File imageFile = File(_profilePhotoUrlController.text);
        profilePhotoUrl = await _fileController.uploadFile(
            context, imageFile, '/profile-photos');
      }
      // Create UserModel object
      UserModel user = UserModel(
        id: widget.user.uid,
        email: widget.user.email!,
        username: _usernameController.text,
        fname: _fnameController.text,
        lname: _lnameController.text,
        bio: _bioController.text,
        gender: _selectedGender,
        dob: _selectedDate,
        createdAt: widget.user.metadata.creationTime,
        profilePhotoUrl: profilePhotoUrl,
        phoneNumber: _phoneController.text,
      );

      // Use UserProvider to create the user
      await userProvider.createUser(user);

      CustomSnackbar.show(context, 'success', 'Account created successfully.');

      Navigator.pop(context);

      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LandingPage()));
    }
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _fnameController.dispose();
    _lnameController.dispose();
    _profilePhotoUrlController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: 30),
                    Center(
                      child: Text(
                        'Add Account Information',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Center(
                      child: GestureDetector(
                        onTap: () async {
                          final XFile? image = await _imagePicker.pickImage(
                            source: ImageSource.gallery,
                          );
                          if (image != null) {
                            setState(() {
                              _profilePhotoUrlController.text = image.path;
                            });
                          }
                        },
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Theme.of(context).colorScheme.primary,
                                  width: 4.0,
                                ),
                              ),
                              child: CircleAvatar(
                                backgroundColor: Theme.of(context)
                                    .highlightColor
                                    .withOpacity(0.5),
                                radius: 55,
                                backgroundImage: _profilePhotoUrlController
                                        .text.isNotEmpty
                                    ? FileImage(File(
                                            _profilePhotoUrlController.text))
                                        as ImageProvider<Object>?
                                    : null, //AssetImage('assets/gif/avatar.gif'),
                                child:
                                    _profilePhotoUrlController.text.isNotEmpty
                                        ? null
                                        : Icon(
                                            Icons.person,
                                            size: 60,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                          ),
                              ),
                            ),
                            Positioned(
                              top: 5.0,
                              right: 5.0,
                              child: InkWell(
                                onTap: () {
                                  // Add your edit logic here
                                },
                                child: Container(
                                  padding: EdgeInsets.all(4.0),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                  ),
                                  child: Icon(
                                    Icons.edit,
                                    size: 20,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 25),
                    CustomTextField(
                      labelText: 'Phone Number',
                      controller: _phoneController,
                      trailingIcon: Icons.phone,
                      inputType: TextInputType.phone,
                    ),
                    SizedBox(height: 25),
                    CustomTextField(
                      labelText: 'Username',
                      controller: _usernameController,
                      trailingIcon: Icons.person_outline,
                      inputType: TextInputType.name,
                    ),
                    SizedBox(height: 16),
                    CustomTextField(
                      labelText: 'First Name',
                      controller: _fnameController,
                      trailingIcon: Icons.person_outline,
                      inputType: TextInputType.name,
                    ),
                    SizedBox(height: 16),
                    CustomTextField(
                      labelText: 'Last Name',
                      controller: _lnameController,
                      trailingIcon: Icons.person_outline,
                      inputType: TextInputType.name,
                    ),
                    SizedBox(height: 16),
                    CustomTextField(
                      labelText: 'Bio',
                      controller: _bioController,
                      trailingIcon: Icons.info_outline,
                      inputType: TextInputType.text,
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      readOnly: true, // Prevents manual editing of the field
                      onTap: () async {
                        final DateTime? picked = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime.now(),
                        );
                        if (picked != null && picked != _selectedDate) {
                          setState(() {
                            _selectedDate = picked;
                          });
                        }
                      },
                      controller: TextEditingController(
                        text: _selectedDate == null
                            ? ''
                            : '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}',
                      ),
                      decoration: InputDecoration(
                        labelText: 'Date of Birth',
                        suffixIcon: Icon(Icons
                            .calendar_month), // Icon to indicate date selection
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      // input type
                      keyboardType: TextInputType.datetime,
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Radio(
                          value: "Male",
                          groupValue: _selectedGender,
                          onChanged: (value) {
                            setState(() {
                              _selectedGender = value;
                            });
                          },
                        ),
                        Text('Male'),
                        Radio(
                          value: "Female",
                          groupValue: _selectedGender,
                          onChanged: (value) {
                            setState(() {
                              _selectedGender = value;
                            });
                          },
                        ),
                        Text('Female'),
                        Radio(
                          value: "Other",
                          groupValue: _selectedGender,
                          onChanged: (value) {
                            setState(() {
                              _selectedGender = value;
                            });
                          },
                        ),
                        Text('Other'),
                      ],
                    ),
                    SizedBox(height: 16),
                    AuthButtonPrimary(
                      onPressed: () {
                        _submitForm(context);
                      },
                      text: 'Done',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
