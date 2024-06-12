import 'package:flutter/material.dart';
import 'package:soko_beauty/core/views/widgets/custom_empty_state_msg.dart';
import 'package:soko_beauty/core/views/widgets/file__upload.dart';
import 'package:soko_beauty/core/views/widgets/options_appbar.dart';

class ShopsTab extends StatelessWidget {
  const ShopsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: EmptyStateMessage(
      message: 'You have no shops yet.',
      onPressed: () {
        showModalBottomSheet(
          elevation: 1,
          barrierColor: Colors.black.withOpacity(0.26),
          backgroundColor: Colors.transparent,
          context: context,
          builder: (context) {
            return CreateShopForm();
          },
        );
      },
      buttonText: "Create Shop",
      icon: Icons.storefront_outlined,
    ));
  }
}

class CreateShopForm extends StatefulWidget {
  @override
  _CreateShopFormState createState() => _CreateShopFormState();
}

class _CreateShopFormState extends State<CreateShopForm> {
  final _formKey = GlobalKey<FormState>();
  String? _shopName;
  String? _shopDescription;
  final _shopImageController = TextEditingController();
  

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // Process the form data (e.g., send to the server)
      print('Shop Name: $_shopName');
      print('Shop Description: $_shopDescription');
     
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Create Shop'),
        actions: [
          IconButton(
            icon: Icon(Icons.close,
                color: Theme.of(context).highlightColor.withOpacity(0.8)),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Shop Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a shop name';
                  }
                  return null;
                },
                onSaved: (value) {
                  _shopName = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Shop Description'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a shop description';
                  }
                  return null;
                },
                onSaved: (value) {
                  _shopDescription = value;
                },
              ),
              FileUploadDropZone(
                title: 'Shop Image or Logo',
                controller: _shopImageController,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: OptionsAppBar(
        cancelTitle: 'Cancel',
        formKey: _formKey,
        AcceptTitle: 'Continue',
        onCancelClicked: () {},
        onAcceptClicked: () {
          if (_formKey.currentState!.validate()) {}
        },
      ),
    );
  }
}
