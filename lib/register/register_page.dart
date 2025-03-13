import 'package:coba1/register/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _fullnameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _birthdateController = TextEditingController();

  bool _isPasswordHidden = true;
  String? _selectedGender;

  Future<void> _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      setState(() {
        _birthdateController.text = DateFormat('dd-MM-yyyy').format(pickedDate);
      });
    }
  }

  void _register() {
    String fullname = _fullnameController.text;
    String username = _usernameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;
    String birthdate = _birthdateController.text;
    String gender = _selectedGender ?? "";
    String phone = _phoneController.text;
    String address = _addressController.text;

    print("Tombol Register ditekan");

    if (fullname.isEmpty ||
        username.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        birthdate.isEmpty ||
        gender.isEmpty ||
        phone.isEmpty ||
        address.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Semua field harus diisi!')),
      );
    } else {
      print('Fullname: $fullname');
      print('Username: $username');
      print('Email: $email');
      print('Password: $password');
      print('Birthdate: $birthdate');
      print('Gender: $gender');
      print('Phone: $phone');
      print('Address: $address');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Registrasi berhasil!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman Register'),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 25),
        backgroundColor: const Color(0xFFE2B0D7),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: _fullnameController,
              decoration: InputDecoration(
                icon: Icon(Icons.person),
                labelText: 'Fullname',
                hintText: 'Masukkan Nama Lengkap Anda',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                icon: Icon(Icons.person),
                labelText: 'Username',
                hintText: 'Masukkan Username Anda',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                icon: Icon(Icons.email),
                labelText: 'Email',
                hintText: 'Masukkan Email Anda',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _passwordController,
              obscureText: _isPasswordHidden,
              decoration: InputDecoration(
                icon: Icon(Icons.lock),
                labelText: 'Password',
                hintText: 'Masukkan Password Anda',
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(
                    _isPasswordHidden ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: () {
                    setState(() {
                      _isPasswordHidden = !_isPasswordHidden;
                    });
                  },
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _birthdateController,
              readOnly: true,
              decoration: InputDecoration(
                icon: Icon(Icons.calendar_today),
                labelText: 'Tanggal Lahir',
                hintText: 'Pilih Tanggal Lahir',
                border: OutlineInputBorder(),
              ),
              onTap: () => _selectDate(context),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Icon(Icons.wc_sharp),
                SizedBox(width: 15),
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: _selectedGender,
                    decoration: InputDecoration(
                      labelText: "Gender",
                      border: OutlineInputBorder(),
                    ),
                    items: ['Laki-laki', 'Perempuan']
                        .map((gender) => DropdownMenuItem(
                              value: gender,
                              child: Text(gender),
                            ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedGender = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            TextField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(15),
              ],
              decoration: InputDecoration(
                icon: Icon(Icons.phone),
                labelText: 'No. Telepon',
                hintText: 'Masukkan No. Telepon Anda',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _addressController,
              decoration: InputDecoration(
                icon: Icon(Icons.location_on),
                labelText: 'Alamat',
                hintText: 'Masukkan Alamat Anda',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _register,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFE2B0D7),
                  foregroundColor: Colors.white,
                ),
                child: Text('Register'),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Sudah memiliki akun? "),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginPage(),
                      ),
                    );
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(
                      color: const Color.fromARGB(255, 216, 88, 148),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
