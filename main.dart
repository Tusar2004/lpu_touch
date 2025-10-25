import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(LPUTouchApp());
}

class LPUTouchApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LPU Touch',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.deepOrange),
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => WelcomeScreen(),
        '/login': (context) => LoginScreen(),
        '/signup': (context) => SignupScreen(),
        '/dashboard': (context) => DashboardScreen(),
        '/notifications': (context) => NotificationsScreen(),
        '/profile': (context) => ProfileScreen(),
        '/attendance': (context) => AttendanceScreen(),
        '/results': (context) => ResultsScreen(),
        '/timetable': (context) => TimetableScreen(),
        '/fee': (context) => FeeScreen(),
        '/assignments': (context) => AssignmentsScreen(),
        '/exams': (context) => ExamsScreen(),
        '/events': (context) => EventsScreen(),
        '/quick_links': (context) => QuickLinksScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.deepOrange.shade400, Colors.amber.shade200],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(flex: 2),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: FlutterLogo(size: 100),
            ),
            SizedBox(height: 20),
            Text(
              'LPU TOUCH',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 1.5,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Student Portal',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white.withOpacity(0.9),
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        elevation: 5,
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/login');
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.deepOrange,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: Colors.white, width: 2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/signup');
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Spacer(flex: 2),
            Text(
              'By continuing, you agree to our Terms of Service',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 12,
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _regNoController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _rememberMe = false;
  bool _isLoading = false;

  @override
  void dispose() {
    _regNoController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      await Future.delayed(Duration(seconds: 2));

      setState(() {
        _isLoading = false;
      });

      Navigator.pushReplacementNamed(context, '/dashboard');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.deepOrange.shade400, Colors.amber.shade200],
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                SizedBox(height: 40),
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: FlutterLogo(size: 60),
                ),
                SizedBox(height: 20),
                Text(
                  'LPU TOUCH',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 1.5,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Student Portal',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white.withOpacity(0.9),
                  ),
                ),
                SizedBox(height: 40),
                Card(
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Text(
                            'Login to Continue',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.deepOrange,
                            ),
                          ),
                          SizedBox(height: 24),
                          TextFormField(
                            controller: _regNoController,
                            decoration: InputDecoration(
                              labelText: 'Registration Number',
                              prefixIcon: Icon(Icons.person_outline,
                                  color: Colors.deepOrange),
                              hintText: 'Enter your registration number',
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your registration number';
                              }
                              if (value.length < 8) {
                                return 'Registration number must be at least 8 characters';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.number,
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            controller: _passwordController,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              prefixIcon: Icon(Icons.lock_outline,
                                  color: Colors.deepOrange),
                              hintText: 'Enter your password',
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _isPasswordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.deepOrange,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _isPasswordVisible = !_isPasswordVisible;
                                  });
                                },
                              ),
                            ),
                            obscureText: !_isPasswordVisible,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your password';
                              }
                              if (value.length < 6) {
                                return 'Password must be at least 6 characters';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Checkbox(
                                    value: _rememberMe,
                                    onChanged: (value) {
                                      setState(() {
                                        _rememberMe = value!;
                                      });
                                    },
                                    activeColor: Colors.deepOrange,
                                  ),
                                  Text('Remember me'),
                                ],
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Forgot Password?',
                                  style: TextStyle(color: Colors.deepOrange),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: _isLoading ? null : _login,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.deepOrange,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                elevation: 5,
                              ),
                              child: _isLoading
                                  ? CircularProgressIndicator(
                                  color: Colors.white)
                                  : Text(
                                'LOGIN',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account? ",
                      style: TextStyle(color: Colors.white),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/signup');
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _regNoController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
  bool _isLoading = false;

  @override
  void dispose() {
    _regNoController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _signup() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      await Future.delayed(Duration(seconds: 2));

      setState(() {
        _isLoading = false;
      });

      Navigator.pushReplacementNamed(context, '/dashboard');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
        backgroundColor: Colors.deepOrange.shade400,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepOrange.shade400, Colors.amber.shade200],
          ),
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Center(
                  child: Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.person_add,
                      size: 40,
                      color: Colors.deepOrange,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Center(
                  child: Text(
                    'Create Account',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Center(
                  child: Text(
                    'Fill in your details to get started',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white.withOpacity(0.9),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                TextFormField(
                  controller: _regNoController,
                  decoration: InputDecoration(
                    labelText: 'Registration Number',
                    prefixIcon: Icon(Icons.person_outline),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your registration number';
                    }
                    if (value.length < 8) {
                      return 'Registration number must be at least 8 characters';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    prefixIcon: Icon(Icons.email_outlined),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!value.contains('@') || !value.contains('.')) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.lock_outline),
                    filled: true,
                    fillColor: Colors.white,
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                    ),
                  ),
                  obscureText: !_isPasswordVisible,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _confirmPasswordController,
                  decoration: InputDecoration(
                    labelText: 'Confirm Password',
                    prefixIcon: Icon(Icons.lock_outline),
                    filled: true,
                    fillColor: Colors.white,
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isConfirmPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                        });
                      },
                    ),
                  ),
                  obscureText: !_isConfirmPasswordVisible,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please confirm your password';
                    }
                    if (value != _passwordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: _isLoading ? null : _signup,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepOrange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: _isLoading
                        ? CircularProgressIndicator(color: Colors.white)
                        : Text(
                      'SIGN UP',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    child: Text.rich(
                      TextSpan(
                        text: "Already have an account? ",
                        children: [
                          TextSpan(
                            text: 'Login',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
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
}

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentIndex = 0;
  final String studentName = 'Tusar Goswami';
  final String regNo = '12315905';
  final String program = 'P132: B.Tech. (Computer Science and Engineering)(2023)';
  final String profileImage = 'https://assets.leetcode.com/users/__tusar27/avatar_1738990676.png';

  final List<Map<String, dynamic>> drawerItems = [
    {'title': '10 to Thrive', 'icon': Icons.star_border},
    {'title': 'Alumni Mentor Selection', 'icon': Icons.qr_code_2},
    {'title': 'Assignment (CA)', 'icon': Icons.assignment},
    {'title': 'Back to Basics', 'icon': Icons.refresh},
    {'title': 'Book Appointment', 'icon': Icons.work_outline},
    {'title': 'Campus Tour', 'icon': Icons.threesixty},
    {'title': 'Continue Exit Undertaking', 'icon': Icons.logout},
    {'title': 'Doctor Appointment', 'icon': Icons.medical_services},
    {'title': 'Document Upload', 'icon': Icons.upload_file},
    {'title': 'Elective polling', 'icon': Icons.poll_rounded},
    {'title': 'Entry Exit Logs', 'icon': Icons.exit_to_app},
    {'title': 'Evaluation of Teaching', 'icon': Icons.mark_as_unread},
    {'title': 'Exam Attendance', 'icon': Icons.assignment_add},
    {'title': 'Fee Payment', 'icon': Icons.money},
    {'title': 'Fee Payment Schedule', 'icon': Icons.schedule_sharp},
  ];

  final List<Map<String, dynamic>> dashboardItems = [
    {'title': 'Announce', 'icon': Icons.campaign, 'badge': 7},
    {'title': 'Edu Revolution', 'icon': Icons.computer},
    {'title': 'Fee Statement', 'icon': Icons.receipt},
    {'title': 'Attendance', 'icon': Icons.fact_check, 'badge': '0%'},
    {'title': 'Assignment', 'icon': Icons.assignment, 'badge': 0},
    {'title': 'Results', 'icon': Icons.bar_chart, 'badge': '7.77'},
    {'title': 'Exams', 'icon': Icons.event_note, 'badge': 1},
    {'title': 'RMS Status', 'icon': Icons.calendar_today},
    {'title': 'Events', 'icon': Icons.star_border},
    {'title': '10 to Thrive', 'icon': Icons.rocket_launch},
    {'title': 'Back to Basics', 'icon': Icons.loop, 'badge': 2},
    {'title': 'Assignment (CA)', 'icon': Icons.table_chart, 'badge': 'X'},
    {'title': 'Hostel Leave Slip', 'icon': Icons.meeting_room, 'badge': 'X'},
    {'title': 'Mess Food Scanner', 'icon': Icons.qr_code, 'badge': 'X'},
    {'title': 'Time table', 'icon': Icons.access_time, 'badge': 'X'},
    {'title': 'Food Shops', 'icon': Icons.storefront, 'badge': 'X'},
  ];

  final List<Map<String, dynamic>> timetableData = [
    {
      'subject': 'PETV77',
      'type': 'Assignment-1',
      'status': 'Going On',
      'time': '06-07 PM',
      'room': 'Online',
      'faculty': 'Dr. Sourav Kumar Attar'
    },
    {
      'subject': 'CSEN403',
      'type': 'Lecture',
      'status': 'Upcoming',
      'time': '07-08 PM',
      'room': 'Block 34-502',
      'faculty': 'Dr. Rajesh Kumar'
    },
    {
      'subject': 'CSEN404',
      'type': 'Tutorial',
      'status': 'Later',
      'time': '09-10 AM',
      'room': 'Block 34-503',
      'faculty': 'Dr. Priya Sharma'
    },
  ];

  final List<Map<String, dynamic>> quickLinks = [
    {'title': 'University Website', 'icon': Icons.language},
    {'title': 'LMS', 'icon': Icons.school},
    {'title': 'ERP', 'icon': Icons.business},
    {'title': 'Library', 'icon': Icons.library_books},
    {'title': 'Hostel', 'icon': Icons.home},
    {'title': 'Transport', 'icon': Icons.directions_bus},
    {'title': 'Medical', 'icon': Icons.local_hospital},
    {'title': 'Career Services', 'icon': Icons.work},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 40),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.deepOrange.shade400, Colors.amber.shade200],
                ),
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(profileImage),
                  ),
                  SizedBox(height: 10),
                  Text(
                    studentName,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(regNo),
                  Text(
                    program,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  contentPadding: EdgeInsets.zero,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: drawerItems.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Icon(drawerItems[index]['icon']),
                    title: Text(drawerItems[index]['title']),
                    onTap: () {},
                  );
                },
              ),
            ),
            Container(
              margin: EdgeInsets.all(12),
              width: double.infinity,
              height: 48,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                gradient: LinearGradient(
                  colors: [Colors.deepOrange.shade400, Colors.amber.shade200],
                ),
              ),
              child: TextButton.icon(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/');
                },
                icon: Icon(Icons.logout, color: Colors.white),
                label: Text('LOGOUT', style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.deepOrange.shade400,
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        title: Text('Dashboard', textAlign: TextAlign.center),
        centerTitle: true,
        actions: [
          Stack(
            children: [
              IconButton(
                icon: Icon(Icons.notifications_none),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NotificationsScreen()),
                  );
                },
              ),
              Positioned(
                top: 4,
                right: 6,
                child: Container(
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  constraints: BoxConstraints(minWidth: 16, minHeight: 16),
                  child: Text(
                    '12',
                    style: TextStyle(color: Colors.white, fontSize: 10),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          if (index == 1) {
            Navigator.pushNamed(context, '/events');
          } else if (index == 2) {
            Navigator.pushNamed(context, '/quick_links');
          } else if (index == 3) {
            Navigator.pushNamed(context, '/profile');
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.auto_awesome),
            label: 'Happenings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'RMS',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        selectedItemColor: Colors.deepOrange,
        unselectedItemColor: Colors.grey,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Today's Timetable",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Chip(label: Text("Your Dost")),
                ],
              ),
            ),
            SizedBox(
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: timetableData.length,
                itemBuilder: (context, index) {
                  final item = timetableData[index];
                  return InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/timetable');
                    },
                    child: Container(
                      width: 180,
                      margin: EdgeInsets.only(left: 12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        gradient: LinearGradient(
                          colors: [Colors.deepOrange.shade400, Colors.amber.shade200],
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item['subject'],
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Text(item['type']),
                            SizedBox(height: 8),
                            Row(
                              children: [
                                CircleAvatar(
                                    radius: 4, backgroundColor: Colors.black),
                                SizedBox(width: 6),
                                Text(item['status']),
                              ],
                            ),
                            Spacer(),
                            Text(
                              item['time'],
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Quick Access',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  IconButton(
                    icon: Icon(Icons.add_circle_outline),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('Add More Tiles'),
                          content: Text('Select tiles to add to your dashboard'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text('Cancel'),
                            ),
                            ElevatedButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text('Add'),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 0.9,
                ),
                itemCount: dashboardItems.length,
                itemBuilder: (context, index) {
                  final item = dashboardItems[index];
                  return InkWell(
                    onTap: () {
                      _handleDashboardItemTap(context, item['title']);
                    },
                    child: Stack(
                      children: [
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 3,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  item['icon'],
                                  size: 36,
                                  color: Colors.deepOrange,
                                ),
                                SizedBox(height: 8),
                                Text(
                                  item['title'],
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                        if (item.containsKey('badge'))
                          Positioned(
                            top: 4,
                            right: 4,
                            child: Container(
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: item['badge'] == 'X'
                                    ? Colors.red
                                    : Colors.deepOrange,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                '${item['badge']}',
                                style:
                                TextStyle(color: Colors.white, fontSize: 10),
                              ),
                            ),
                          ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleDashboardItemTap(BuildContext context, String title) {
    switch (title) {
      case 'Attendance':
        Navigator.pushNamed(context, '/attendance');
        break;
      case 'Results':
        Navigator.pushNamed(context, '/results');
        break;
      case 'Time table':
        Navigator.pushNamed(context, '/timetable');
        break;
      case 'Fee Statement':
        Navigator.pushNamed(context, '/fee');
        break;
      case 'Assignment':
        Navigator.pushNamed(context, '/assignments');
        break;
      case 'Exams':
        Navigator.pushNamed(context, '/exams');
        break;
      case 'Events':
        Navigator.pushNamed(context, '/events');
        break;
      case 'Announce':
        Navigator.pushNamed(context, '/notifications');
        break;
      default:
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('$title feature coming soon!')),
        );
    }
  }
}

class ProfileScreen extends StatelessWidget {
  final String studentName = 'Tusar Goswami';
  final String regNo = '12315905';
  final String program = 'P132: B.Tech. (Computer Science and Engineering)(2023)';
  final String profileImage = 'https://assets.leetcode.com/users/__tusar27/avatar_1738990676.png';
  final String email = 'tusar.12315905@lpu.in';
  final String mobile = '+91 9876543210';
  final String dob = '01/01/2000';
  final String address = 'Hostel Block 32, Room No. 505, Lovely Professional University, Phagwara, Punjab - 144411';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Colors.deepOrange.shade400,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(profileImage),
                  ),
                  SizedBox(height: 16),
                  Text(
                    studentName,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text(regNo),
                  Text(program),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 16),
                      Icon(Icons.star, color: Colors.amber, size: 16),
                      Icon(Icons.star, color: Colors.amber, size: 16),
                      Icon(Icons.star, color: Colors.amber, size: 16),
                      Icon(Icons.star_half, color: Colors.amber, size: 16),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Personal Information',
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 16),
                    _buildProfileItem(Icons.email, 'Email', email),
                    _buildProfileItem(Icons.phone, 'Mobile', mobile),
                    _buildProfileItem(Icons.cake, 'Date of Birth', dob),
                    _buildProfileItem(
                        Icons.location_on, 'Address', address, maxLines: 3),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Academic Information',
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 16),
                    _buildProfileItem(Icons.school, 'Program', program),
                    _buildProfileItem(
                        Icons.calendar_today, 'Batch', '2023 - 2027'),
                    _buildProfileItem(
                        Icons.class_, 'Current Semester', '3rd Semester'),
                    _buildProfileItem(Icons.account_balance, 'School',
                        'School of Computer Science and Engineering'),
                    _buildProfileItem(Icons.people, 'Mentor', 'Dr. Rajesh Kumar'),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text('LOGOUT'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileItem(IconData icon, String label, String value,
      {int maxLines = 1}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.deepOrange),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                SizedBox(height: 4),
                Text(
                  value,
                  style: TextStyle(fontSize: 16),
                  maxLines: maxLines,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AttendanceScreen extends StatelessWidget {
  final Map<String, dynamic> overallAttendance = {
    'percentage': 85.0,
    'present': 34,
    'total': 40,
    'status': 'Good',
  };

  final List<Map<String, dynamic>> subjectAttendance = [
    {
      'subject': 'CSEN403',
      'present': 12,
      'total': 15,
      'percentage': 80.0,
      'status': 'Average'
    },
    {
      'subject': 'CSEN404',
      'present': 10,
      'total': 10,
      'percentage': 100.0,
      'status': 'Excellent'
    },
    {
      'subject': 'PETV77',
      'present': 12,
      'total': 15,
      'percentage': 80.0,
      'status': 'Average'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Attendance'),
        backgroundColor: Colors.deepOrange.shade400,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      'Overall Attendance',
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 16),
                    CircularProgressIndicator(
                      value: overallAttendance['percentage'] / 100,
                      backgroundColor: Colors.grey.shade200,
                      color: _getAttendanceColor(
                          overallAttendance['percentage']),
                      strokeWidth: 10,
                      semanticsLabel: 'Overall attendance',
                    ),
                    SizedBox(height: 16),
                    Text(
                      '${overallAttendance['percentage']}%',
                      style: TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '${overallAttendance['present']} / ${overallAttendance['total']} classes',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 8),
                    Chip(
                      label: Text(
                        overallAttendance['status'],
                        style: TextStyle(color: Colors.white),
                      ),
                      backgroundColor: _getAttendanceColor(
                          overallAttendance['percentage']),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Subject-wise Attendance',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: subjectAttendance.length,
              itemBuilder: (context, index) {
                final subject = subjectAttendance[index];
                return Card(
                  margin: EdgeInsets.only(bottom: 12),
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          subject['subject'],
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8),
                        LinearProgressIndicator(
                          value: subject['percentage'] / 100,
                          backgroundColor: Colors.grey.shade200,
                          color: _getAttendanceColor(subject['percentage']),
                        ),
                        SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${subject['percentage']}%',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '${subject['present']} / ${subject['total']} classes',
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Chip(
                            label: Text(
                              subject['status'],
                              style: TextStyle(color: Colors.white),
                            ),
                            backgroundColor:
                            _getAttendanceColor(subject['percentage']),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Color _getAttendanceColor(double percentage) {
    if (percentage >= 85) return Colors.green;
    if (percentage >= 75) return Colors.blue;
    if (percentage >= 65) return Colors.orange;
    return Colors.red;
  }
}

class ResultsScreen extends StatelessWidget {
  final List<Map<String, dynamic>> semesterResults = [
    {
      'semester': '1st Semester',
      'sgpa': 7.77,
      'status': 'Pass',
      'date': 'Dec 2023'
    },
    {
      'semester': '2nd Semester',
      'sgpa': 8.25,
      'status': 'Pass',
      'date': 'May 2024'
    },
  ];

  final List<Map<String, dynamic>> subjectResults = [
    {
      'subject': 'CSEN403',
      'internal': 28,
      'external': 52,
      'total': 80,
      'grade': 'A'
    },
    {
      'subject': 'CSEN404',
      'internal': 25,
      'external': 45,
      'total': 70,
      'grade': 'B+'
    },
    {
      'subject': 'PETV77',
      'internal': 30,
      'external': 60,
      'total': 90,
      'grade': 'A+'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Results'),
        backgroundColor: Colors.deepOrange.shade400,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      'Semester-wise Results',
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 16),
                    ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: semesterResults.length,
                      itemBuilder: (context, index) {
                        final result = semesterResults[index];
                        return ListTile(
                          title: Text(result['semester']),
                          subtitle: Text(result['date']),
                          trailing: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'SGPA: ${result['sgpa']}',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Chip(
                                label: Text(
                                  result['status'],
                                  style: TextStyle(color: Colors.white),
                                ),
                                backgroundColor: result['status'] == 'Pass'
                                    ? Colors.green
                                    : Colors.red,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      'Current Semester Results',
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 16),
                    DataTable(
                      columns: [
                        DataColumn(label: Text('Subject')),
                        DataColumn(label: Text('Internal')),
                        DataColumn(label: Text('External')),
                        DataColumn(label: Text('Total')),
                        DataColumn(label: Text('Grade')),
                      ],
                      rows: subjectResults.map((result) {
                        return DataRow(cells: [
                          DataCell(Text(result['subject'])),
                          DataCell(Text(result['internal'].toString())),
                          DataCell(Text(result['external'].toString())),
                          DataCell(Text(result['total'].toString())),
                          DataCell(
                            Container(
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: _getGradeColor(result['grade']),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(
                                result['grade'],
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ]);
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getGradeColor(String grade) {
    switch (grade) {
      case 'A+':
        return Colors.green.shade800;
      case 'A':
        return Colors.green;
      case 'B+':
        return Colors.blue;
      case 'B':
        return Colors.blue.shade300;
      case 'C+':
        return Colors.orange;
      case 'C':
        return Colors.orange.shade300;
      case 'D':
        return Colors.red.shade300;
      case 'E':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
}

class TimetableScreen extends StatelessWidget {
  final List<Map<String, dynamic>> weeklyTimetable = [
    {
      'day': 'Monday',
      'classes': [
        {
          'subject': 'CSEN403',
          'type': 'Lecture',
          'time': '09:00 - 10:00',
          'room': '34-502',
          'faculty': 'Dr. Rajesh Kumar'
        },
        {
          'subject': 'CSEN404',
          'type': 'Tutorial',
          'time': '11:00 - 12:00',
          'room': '34-503',
          'faculty': 'Dr. Priya Sharma'
        },
      ]
    },
    {
      'day': 'Tuesday',
      'classes': [
        {
          'subject': 'PETV77',
          'type': 'Assignment',
          'time': '06:00 - 07:00',
          'room': 'Online',
          'faculty': 'Dr. Sourav Kumar Attar'
        },
      ]
    },
    {
      'day': 'Wednesday',
      'classes': [
        {
          'subject': 'CSEN403',
          'type': 'Lab',
          'time': '02:00 - 04:00',
          'room': '34-505',
          'faculty': 'Dr. Rajesh Kumar'
        },
      ]
    },
    {
      'day': 'Thursday',
      'classes': [
        {
          'subject': 'CSEN404',
          'type': 'Lecture',
          'time': '10:00 - 11:00',
          'room': '34-502',
          'faculty': 'Dr. Priya Sharma'
        },
      ]
    },
    {
      'day': 'Friday',
      'classes': [
        {
          'subject': 'PETV77',
          'type': 'Tutorial',
          'time': '03:00 - 04:00',
          'room': '34-504',
          'faculty': 'Dr. Sourav Kumar Attar'
        },
      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Time Table'),
        backgroundColor: Colors.deepOrange.shade400,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      'Current Week Time Table',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      '3rd Semester (2023-2027)',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'School of Computer Science and Engineering',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: weeklyTimetable.length,
              itemBuilder: (context, index) {
                final day = weeklyTimetable[index];
                return Card(
                  margin: EdgeInsets.only(bottom: 12),
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ExpansionTile(
                    title: Text(
                      day['day'],
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    children: day['classes'].map<Widget>((cls) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 8
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  cls['subject'],
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                                Chip(
                                  label: Text(cls['type']),
                                  backgroundColor: Colors.deepOrange.shade100,
                                ),
                              ],
                            ),
                            SizedBox(height: 8),
                            Text('Time: ${cls['time']}'),
                            Text('Room: ${cls['room']}'),
                            Text('Faculty: ${cls['faculty']}'),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// Enhanced Screen Classes with Detailed Content

class NotificationsScreen extends StatelessWidget {
  final List<Map<String, dynamic>> notifications = [
    {
      'title': 'Mid-Term Examination Schedule',
      'message': 'The mid-term examination schedule for 3rd semester has been released. Check your timetable.',
      'time': '2 hours ago',
      'type': 'academic',
      'read': false
    },
    {
      'title': 'Library Book Due Reminder',
      'message': 'Your borrowed book "Data Structures and Algorithms" is due tomorrow. Please return or renew it.',
      'time': '5 hours ago',
      'type': 'library',
      'read': false
    },
    {
      'title': 'Hostel Fee Payment',
      'message': 'Last date for hostel fee payment is 15th December 2024. Pay online through the portal.',
      'time': '1 day ago',
      'type': 'fee',
      'read': true
    },
    {
      'title': 'Cultural Fest Registration',
      'message': 'Registrations for LPU Cultural Fest 2024 are now open. Register before 20th November.',
      'time': '2 days ago',
      'type': 'event',
      'read': true
    },
    {
      'title': 'Campus Placement Drive',
      'message': 'Google is visiting campus on 25th November for placements. Register on the placement portal.',
      'time': '3 days ago',
      'type': 'placement',
      'read': true
    },
  ];

  Color _getNotificationColor(String type) {
    switch (type) {
      case 'academic':
        return Colors.blue;
      case 'library':
        return Colors.green;
      case 'fee':
        return Colors.orange;
      case 'event':
        return Colors.purple;
      case 'placement':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  IconData _getNotificationIcon(String type) {
    switch (type) {
      case 'academic':
        return Icons.school;
      case 'library':
        return Icons.library_books;
      case 'fee':
        return Icons.payment;
      case 'event':
        return Icons.event;
      case 'placement':
        return Icons.work;
      default:
        return Icons.notifications;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
        backgroundColor: Colors.deepOrange.shade400,
        actions: [
          IconButton(
            icon: Icon(Icons.filter_list),
            onPressed: () {
              // Filter functionality
            },
          ),
          IconButton(
            icon: Icon(Icons.mark_email_read),
            onPressed: () {
              // Mark all as read
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final notification = notifications[index];
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            color: notification['read'] ? Colors.white : Colors.blue.shade50,
            elevation: 2,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: _getNotificationColor(notification['type']),
                child: Icon(
                  _getNotificationIcon(notification['type']),
                  color: Colors.white,
                  size: 20,
                ),
              ),
              title: Text(
                notification['title'],
                style: TextStyle(
                  fontWeight: notification['read'] ? FontWeight.normal : FontWeight.bold,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(notification['message']),
                  SizedBox(height: 4),
                  Text(
                    notification['time'],
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
              trailing: notification['read'] ? null : Icon(Icons.circle, color: Colors.blue, size: 12),
              onTap: () {
                // Handle notification tap
              },
            ),
          );
        },
      ),
    );
  }
}

class FeeScreen extends StatelessWidget {
  final Map<String, dynamic> feeSummary = {
    'totalFee': 150000,
    'paid': 120000,
    'due': 30000,
    'dueDate': '2024-12-15',
    'status': 'Partially Paid'
  };

  final List<Map<String, dynamic>> feeBreakdown = [
    {'item': 'Tuition Fee', 'amount': 100000, 'status': 'Paid'},
    {'item': 'Hostel Fee', 'amount': 40000, 'status': 'Paid'},
    {'item': 'Mess Fee', 'amount': 20000, 'status': 'Due'},
    {'item': 'Library Fee', 'amount': 5000, 'status': 'Due'},
    {'item': 'Exam Fee', 'amount': 5000, 'status': 'Paid'},
  ];

  final List<Map<String, dynamic>> paymentHistory = [
    {'date': '2024-08-01', 'amount': 60000, 'mode': 'Online', 'receipt': 'RCPT001'},
    {'date': '2024-07-15', 'amount': 60000, 'mode': 'Online', 'receipt': 'RCPT002'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fee Statement'),
        backgroundColor: Colors.deepOrange.shade400,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            // Fee Summary Card
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      'Fee Summary',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildFeeItem('Total Fee', '₹${feeSummary['totalFee']}'),
                        _buildFeeItem('Paid', '₹${feeSummary['paid']}', Colors.green),
                        _buildFeeItem('Due', '₹${feeSummary['due']}', Colors.orange),
                      ],
                    ),
                    SizedBox(height: 16),
                    LinearProgressIndicator(
                      value: feeSummary['paid'] / feeSummary['totalFee'],
                      backgroundColor: Colors.grey.shade200,
                      color: Colors.green,
                    ),
                    SizedBox(height: 8),
                    Text('${(feeSummary['paid'] / feeSummary['totalFee'] * 100).toStringAsFixed(1)}% Paid'),
                    SizedBox(height: 16),
                    Chip(
                      label: Text(
                        'Due Date: ${feeSummary['dueDate']}',
                        style: TextStyle(color: Colors.white),
                      ),
                      backgroundColor: Colors.deepOrange,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),

            // Fee Breakdown
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Fee Breakdown',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 16),
                    ...feeBreakdown.map((item) => Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(item['item']),
                          Row(
                            children: [
                              Text('₹${item['amount']}'),
                              SizedBox(width: 8),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  color: item['status'] == 'Paid' ? Colors.green : Colors.orange,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text(
                                  item['status'],
                                  style: TextStyle(color: Colors.white, fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),

            // Payment History
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Payment History',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 16),
                    ...paymentHistory.map((payment) => Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: ListTile(
                        leading: Icon(Icons.receipt, color: Colors.green),
                        title: Text('₹${payment['amount']}'),
                        subtitle: Text('${payment['date']} • ${payment['mode']}'),
                        trailing: Text(payment['receipt']),
                      ),
                    )),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),

            // Pay Now Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to payment page
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrange,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'PAY NOW',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeeItem(String label, String amount, [Color? color]) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 14, color: Colors.grey),
        ),
        SizedBox(height: 4),
        Text(
          amount,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: color ?? Colors.black,
          ),
        ),
      ],
    );
  }
}

class AssignmentsScreen extends StatelessWidget {
  final List<Map<String, dynamic>> assignments = [
    {
      'subject': 'CSEN403 - Data Structures',
      'title': 'Binary Search Tree Implementation',
      'dueDate': '2024-11-20',
      'status': 'Pending',
      'priority': 'High',
      'marks': 20
    },
    {
      'subject': 'CSEN404 - Algorithms',
      'title': 'Sorting Algorithms Analysis',
      'dueDate': '2024-11-25',
      'status': 'In Progress',
      'priority': 'Medium',
      'marks': 15
    },
    {
      'subject': 'PETV77 - Soft Skills',
      'title': 'Group Discussion Video Submission',
      'dueDate': '2024-11-18',
      'status': 'Completed',
      'priority': 'High',
      'marks': 10
    },
    {
      'subject': 'CSEN403 - Data Structures',
      'title': 'Linked List Operations',
      'dueDate': '2024-11-15',
      'status': 'Submitted',
      'priority': 'Low',
      'marks': 15
    },
  ];

  Color _getStatusColor(String status) {
    switch (status) {
      case 'Completed':
      case 'Submitted':
        return Colors.green;
      case 'In Progress':
        return Colors.orange;
      case 'Pending':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  Color _getPriorityColor(String priority) {
    switch (priority) {
      case 'High':
        return Colors.red;
      case 'Medium':
        return Colors.orange;
      case 'Low':
        return Colors.green;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Assignments'),
        backgroundColor: Colors.deepOrange.shade400,
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              // Add new assignment
            },
          ),
          IconButton(
            icon: Icon(Icons.filter_list),
            onPressed: () {
              // Filter assignments
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Summary Cards
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: _buildSummaryCard('Total', assignments.length.toString(), Icons.assignment),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: _buildSummaryCard('Pending',
                      assignments.where((a) => a['status'] == 'Pending').length.toString(),
                      Icons.pending_actions,
                      color: Colors.orange
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: _buildSummaryCard('Completed',
                      assignments.where((a) => a['status'] == 'Completed' || a['status'] == 'Submitted').length.toString(),
                      Icons.check_circle,
                      color: Colors.green
                  ),
                ),
              ],
            ),
          ),

          // Assignments List
          Expanded(
            child: ListView.builder(
              itemCount: assignments.length,
              itemBuilder: (context, index) {
                final assignment = assignments[index];
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  elevation: 2,
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: _getStatusColor(assignment['status']),
                      child: Icon(
                        assignment['status'] == 'Completed' || assignment['status'] == 'Submitted'
                            ? Icons.check : Icons.assignment,
                        color: Colors.white,
                      ),
                    ),
                    title: Text(
                      assignment['title'],
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(assignment['subject']),
                        SizedBox(height: 4),
                        Row(
                          children: [
                            Icon(Icons.calendar_today, size: 12),
                            SizedBox(width: 4),
                            Text('Due: ${assignment['dueDate']}'),
                            SizedBox(width: 12),
                            Icon(Icons.grade, size: 12),
                            SizedBox(width: 4),
                            Text('${assignment['marks']} marks'),
                          ],
                        ),
                      ],
                    ),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                          decoration: BoxDecoration(
                            color: _getPriorityColor(assignment['priority']),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            assignment['priority'],
                            style: TextStyle(color: Colors.white, fontSize: 10),
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          assignment['status'],
                          style: TextStyle(
                            fontSize: 12,
                            color: _getStatusColor(assignment['status']),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    onTap: () {
                      // View assignment details
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add new assignment
        },
        backgroundColor: Colors.deepOrange,
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _buildSummaryCard(String title, String value, IconData icon, {Color color = Colors.blue}) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Icon(icon, color: color, size: 24),
            SizedBox(height: 8),
            Text(
              value,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              title,
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}

class ExamsScreen extends StatelessWidget {
  final List<Map<String, dynamic>> upcomingExams = [
    {
      'subject': 'CSEN403 - Data Structures',
      'type': 'Mid-Term',
      'date': '2024-11-25',
      'time': '09:00 AM - 12:00 PM',
      'room': 'Block 34-501',
      'seatNo': 'B34-501-25'
    },
    {
      'subject': 'CSEN404 - Algorithms',
      'type': 'Mid-Term',
      'date': '2024-11-27',
      'time': '02:00 PM - 05:00 PM',
      'room': 'Block 34-502',
      'seatNo': 'B34-502-18'
    },
  ];

  final List<Map<String, dynamic>> examResults = [
    {
      'subject': 'Mathematics',
      'type': 'End-Term',
      'date': '2024-05-15',
      'marks': 85,
      'grade': 'A',
      'status': 'Passed'
    },
    {
      'subject': 'Physics',
      'type': 'End-Term',
      'date': '2024-05-18',
      'marks': 78,
      'grade': 'B+',
      'status': 'Passed'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exams'),
        backgroundColor: Colors.deepOrange.shade400,
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            TabBar(
              labelColor: Colors.deepOrange,
              unselectedLabelColor: Colors.grey,
              indicatorColor: Colors.deepOrange,
              tabs: [
                Tab(text: 'Upcoming Exams'),
                Tab(text: 'Results'),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  // Upcoming Exams Tab
                  ListView.builder(
                    itemCount: upcomingExams.length,
                    itemBuilder: (context, index) {
                      final exam = upcomingExams[index];
                      return Card(
                        margin: EdgeInsets.all(16),
                        elevation: 4,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    exam['subject'],
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Chip(
                                    label: Text(
                                      exam['type'],
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    backgroundColor: Colors.deepOrange,
                                  ),
                                ],
                              ),
                              SizedBox(height: 12),
                              _buildExamDetail('Date', exam['date']),
                              _buildExamDetail('Time', exam['time']),
                              _buildExamDetail('Room', exam['room']),
                              _buildExamDetail('Seat No', exam['seatNo']),
                              SizedBox(height: 16),
                              Row(
                                children: [
                                  Icon(Icons.warning, color: Colors.orange, size: 16),
                                  SizedBox(width: 4),
                                  Text(
                                    'Please carry your university ID card',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.orange,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),

                  // Results Tab
                  ListView.builder(
                    itemCount: examResults.length,
                    itemBuilder: (context, index) {
                      final result = examResults[index];
                      return Card(
                        margin: EdgeInsets.all(16),
                        elevation: 4,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    result['subject'],
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Chip(
                                    label: Text(
                                      result['status'],
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    backgroundColor: result['status'] == 'Passed'
                                        ? Colors.green
                                        : Colors.red,
                                  ),
                                ],
                              ),
                              SizedBox(height: 12),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  _buildResultItem('Marks', '${result['marks']}/100'),
                                  _buildResultItem('Grade', result['grade']),
                                  _buildResultItem('Type', result['type']),
                                ],
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Date: ${result['date']}',
                                style: TextStyle(fontSize: 12, color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExamDetail(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Text(
            '$label: ',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(value),
        ],
      ),
    );
  }

  Widget _buildResultItem(String label, String value) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 12, color: Colors.grey),
        ),
        SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class EventsScreen extends StatelessWidget {
  final List<Map<String, dynamic>> events = [
    {
      'title': 'LPU Cultural Fest 2024',
      'description': 'Annual cultural festival with performances, competitions, and food stalls',
      'date': '2024-12-15',
      'time': '10:00 AM - 10:00 PM',
      'venue': 'Main Ground',
      'type': 'Cultural',
      'registered': true
    },
    {
      'title': 'Tech Summit 2024',
      'description': 'Technology conference with industry experts and workshops',
      'date': '2024-11-30',
      'time': '09:00 AM - 06:00 PM',
      'venue': 'Block 34 Auditorium',
      'type': 'Technical',
      'registered': false
    },
    {
      'title': 'Sports Week',
      'description': 'Inter-department sports competition',
      'date': '2024-12-05',
      'time': '08:00 AM - 05:00 PM',
      'venue': 'Sports Complex',
      'type': 'Sports',
      'registered': true
    },
  ];

  Color _getEventColor(String type) {
    switch (type) {
      case 'Cultural':
        return Colors.purple;
      case 'Technical':
        return Colors.blue;
      case 'Sports':
        return Colors.green;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Events'),
        backgroundColor: Colors.deepOrange.shade400,
      ),
      body: ListView.builder(
        itemCount: events.length,
        itemBuilder: (context, index) {
          final event = events[index];
          return Card(
            margin: EdgeInsets.all(16),
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          event['title'],
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Chip(
                        label: Text(
                          event['type'],
                          style: TextStyle(color: Colors.white),
                        ),
                        backgroundColor: _getEventColor(event['type']),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(
                    event['description'],
                    style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                  ),
                  SizedBox(height: 16),
                  _buildEventDetail(Icons.calendar_today, event['date']),
                  _buildEventDetail(Icons.access_time, event['time']),
                  _buildEventDetail(Icons.location_on, event['venue']),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      event['registered']
                          ? Chip(
                        label: Text(
                          'Registered',
                          style: TextStyle(color: Colors.white),
                        ),
                        backgroundColor: Colors.green,
                      )
                          : Chip(
                        label: Text(
                          'Not Registered',
                          style: TextStyle(color: Colors.white),
                        ),
                        backgroundColor: Colors.grey,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Register for event
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: event['registered']
                              ? Colors.grey
                              : Colors.deepOrange,
                        ),
                        child: Text(
                          event['registered'] ? 'View Details' : 'Register Now',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildEventDetail(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Icon(icon, size: 16, color: Colors.grey),
          SizedBox(width: 8),
          Text(text),
        ],
      ),
    );
  }
}

class QuickLinksScreen extends StatelessWidget {
  final List<Map<String, dynamic>> quickLinks = [
    {
      'title': 'University Website',
      'icon': Icons.language,
      'url': 'https://www.lpu.in',
      'description': 'Official university website'
    },
    {
      'title': 'LMS Portal',
      'icon': Icons.school,
      'url': 'https://lms.lpu.in',
      'description': 'Learning Management System'
    },
    {
      'title': 'ERP Login',
      'icon': Icons.business,
      'url': 'https://erp.lpu.in',
      'description': 'Enterprise Resource Planning'
    },
    {
      'title': 'Library Portal',
      'icon': Icons.library_books,
      'url': 'https://library.lpu.in',
      'description': 'Digital library resources'
    },
    {
      'title': 'Hostel Services',
      'icon': Icons.home,
      'url': 'https://hostel.lpu.in',
      'description': 'Hostel management portal'
    },
    {
      'title': 'Transport',
      'icon': Icons.directions_bus,
      'url': 'https://transport.lpu.in',
      'description': 'Bus schedules and routes'
    },
    {
      'title': 'Medical',
      'icon': Icons.local_hospital,
      'url': 'https://medical.lpu.in',
      'description': 'Health services portal'
    },
    {
      'title': 'Career Services',
      'icon': Icons.work,
      'url': 'https://careers.lpu.in',
      'description': 'Placement and career guidance'
    },
    {
      'title': 'Student Clubs',
      'icon': Icons.people,
      'url': 'https://clubs.lpu.in',
      'description': 'Student organizations'
    },
    {
      'title': 'Cafeteria Menu',
      'icon': Icons.restaurant,
      'url': 'https://cafe.lpu.in',
      'description': 'Daily food menu'
    },
    {
      'title': 'Sports Complex',
      'icon': Icons.sports,
      'url': 'https://sports.lpu.in',
      'description': 'Sports facilities booking'
    },
    {
      'title': 'Complaints Portal',
      'icon': Icons.feedback,
      'url': 'https://complaints.lpu.in',
      'description': 'Submit complaints and feedback'
    },
  ];

  Future<void> _launchURL(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quick Links'),
        backgroundColor: Colors.deepOrange.shade400,
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(16),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 1.2,
        ),
        itemCount: quickLinks.length,
        itemBuilder: (context, index) {
          final link = quickLinks[index];
          return Card(
            elevation: 4,
            child: InkWell(
              onTap: () => _launchURL(link['url']),
              borderRadius: BorderRadius.circular(12),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      link['icon'],
                      size: 32,
                      color: Colors.deepOrange,
                    ),
                    SizedBox(height: 8),
                    Text(
                      link['title'],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      link['description'],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.grey,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
