import 'package:flutter/material.dart';
import 'registration_page.dart';
import 'student_home_page.dart';
import 'tutor_home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String selectedRole = 'Student';
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String? _errorText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[50],
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Login as $selectedRole',
                style: TextStyle(
                  fontSize: 28,
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
                color: const Color.fromARGB(255, 128, 97, 181),
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
              SizedBox(height: 30),
              TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                ),
              ),
              if (_errorText != null) ...[
                SizedBox(height: 10),
                Text(_errorText!, style: TextStyle(color: Colors.red)),
              ],
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  bool userExists = RegistrationPage.registeredUsers.any(
                    (user) =>
                        user['role'] == selectedRole &&
                        user['username'] == _usernameController.text &&
                        user['password'] == _passwordController.text,
                  );

                  if (userExists) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) =>
                                selectedRole == 'Student'
                                    ? StudentHomePage()
                                    : TutorHomePage(),
                      ),
                    );
                  } else {
                    setState(() {
                      _errorText = 'Invalid username or password!';
                    });
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 220, 217, 224),
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text('Login', style: TextStyle(fontSize: 18)),
              ),
              SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegistrationPage()),
                  );
                },
                child: Text(
                  'New here? Register',
                  style: TextStyle(
                    color: const Color.fromARGB(255, 101, 45, 198),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
