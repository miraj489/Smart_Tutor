import 'package:flutter/material.dart';

class RegistrationPage extends StatefulWidget {
  static List<Map<String, String>> registeredUsers = [];

  const RegistrationPage({super.key});

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();

  String selectedRole = 'Student';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[50],
      appBar: AppBar(
        title: Text('Register'),
        backgroundColor: const Color.fromARGB(255, 223, 220, 227),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 30),
          child: Container(
            padding: EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 12,
                  offset: Offset(0, 6),
                ),
              ],
            ),
            width: double.infinity,
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Icon(
                    Icons.person_add_alt_1,
                    size: 80,
                    color: Colors.deepPurple,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Create an Account',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                    ),
                  ),
                  SizedBox(height: 20),
                  ToggleButtons(
                    isSelected: [
                      selectedRole == 'Student',
                      selectedRole == 'Tutor',
                    ],
                    borderRadius: BorderRadius.circular(10),
                    fillColor: Colors.deepPurple,
                    selectedColor: Colors.white,
                    color: Colors.deepPurple,
                    onPressed: (index) {
                      setState(() {
                        selectedRole = index == 0 ? 'Student' : 'Tutor';
                      });
                    },
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text('Student'),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text('Tutor'),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  _buildTextField(
                    label: 'Username',
                    icon: Icons.person,
                    controller: _usernameController,
                  ),
                  SizedBox(height: 20),
                  _buildTextField(
                    label: 'Password',
                    icon: Icons.lock,
                    controller: _passwordController,
                    obscureText: true,
                  ),
                  SizedBox(height: 20),
                  _buildTextField(
                    label: 'Age',
                    icon: Icons.cake,
                    controller: _ageController,
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 20),
                  _buildTextField(
                    label: 'Phone Number',
                    icon: Icons.phone,
                    controller: _phoneController,
                    keyboardType: TextInputType.phone,
                  ),
                  SizedBox(height: 20),
                  _buildTextField(
                    label: 'Location',
                    icon: Icons.location_on,
                    controller: _locationController,
                  ),
                  SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        RegistrationPage.registeredUsers.add({
                          'role': selectedRole,
                          'username': _usernameController.text.trim(),
                          'password': _passwordController.text.trim(),
                        });

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Registration Successful')),
                        );
                        Navigator.pop(context); // Go back to login page
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 235, 233, 239),
                      minimumSize: Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text('Register', style: TextStyle(fontSize: 18)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required IconData icon,
    required TextEditingController controller,
    TextInputType keyboardType = TextInputType.text,
    bool obscureText = false,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(),
      ),
      validator:
          (value) =>
              value == null || value.isEmpty ? 'Please enter $label' : null,
    );
  }
}
