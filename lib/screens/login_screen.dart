import 'package:flutter/material.dart';
import 'package:kachra_click/screens/user/user_home_screen.dart';
import 'package:kachra_click/screens/worker/worker_home_screen.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();

  String role = 'user';

  void _submit() {
    if (_formKey.currentState!.validate()) {
      print("Logging in as $role");
      if (role == 'user') {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const UserHomeScreen()),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const WorkerHomeScreen()),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 30),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Welcome Back!",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
                ),
                const SizedBox(height: 30),

                _buildTextField(
                  controller: nameController,
                  hint: 'Name',
                  icon: Icons.person,
                  validator: (val) => val!.isEmpty ? 'Enter your name' : null,
                ),

                const SizedBox(height: 16),

                _buildTextField(
                  controller: emailController,
                  hint: 'Email',
                  icon: Icons.email,
                  validator: (val) => val!.isEmpty ? 'Enter email' : null,
                ),

                const SizedBox(height: 16),

                _buildTextField(
                  controller: passController,
                  hint: 'Password',
                  icon: Icons.lock,
                  obscure: true,
                  validator: (val) =>
                      val!.length < 6 ? 'Min 6 characters' : null,
                ),

                const SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ChoiceChip(
                      label: const Text('User'),
                      selected: role == 'user',
                      onSelected: (_) => setState(() => role = 'user'),
                    ),
                    const SizedBox(width: 10),
                    ChoiceChip(
                      label: const Text('Worker'),
                      selected: role == 'worker',
                      onSelected: (_) => setState(() => role = 'worker'),
                    ),
                  ],
                ),

                const SizedBox(height: 30),

                ElevatedButton(
                  onPressed: _submit,
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 60,
                      vertical: 14,
                    ),
                    backgroundColor: Colors.blueAccent,
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 18,
                      letterSpacing: 1,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Roboto',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    required IconData icon,
    bool obscure = false,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: obscure,
      validator: validator,
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: Icon(icon),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}
