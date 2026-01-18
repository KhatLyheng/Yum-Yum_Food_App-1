import 'package:assignment_yum_yum_app/Components/HomeScreen.dart';
import 'package:assignment_yum_yum_app/const_Colors/const.dart';
import 'package:flutter/material.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key,required this.LogoApp});
  final LogoApp;


  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with TickerProviderStateMixin{
  late AnimationController _controller, _controllerScale,_controllerFade;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _animationScale;
  late Animation<double> _animationFade;
  @override
  void initState() {
    _controller = AnimationController(vsync: this,duration: Duration(milliseconds: 1000));
    _controllerScale = AnimationController(vsync: this,duration: Duration(milliseconds: 1000));
    _controllerFade = AnimationController(vsync: this,duration: Duration(milliseconds: 1500));
    _animationScale =Tween<double>(begin: 1.0,end: 0.25).animate(CurvedAnimation(parent: _controllerScale, curve: Curves.easeIn));
    _animationFade =Tween<double>(begin: 0.0,end: 1.0).animate(CurvedAnimation(parent: _controllerScale, curve: Curves.easeIn));
   _slideAnimation = Tween<Offset>(
     begin: Offset(0.05,1.8),
     end: Offset.zero,
   ).animate(
     CurvedAnimation(parent: _controller, curve: Curves.easeInOut)
   );
   _controllerScale.forward();
   _controller.forward();
   Future.delayed(Duration(seconds: 1),(){
     _controllerFade.forward();
   });
    super.initState();
  }
  @override
  void dispose() {
    _controller.dispose();
    _controllerScale.dispose();
    _controllerFade.dispose();
    // TODO: implement dispose
    super.dispose();
  }
  bool isEmail = false;

  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  var selectlst = 0;
  bool onCheckbox = true;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.topLeft,
                children: [
                  Container(height: size.height*0.25,width: size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        ScaleTransition(alignment: Alignment.topLeft,scale: _animationScale,child: SlideTransition(position: _slideAnimation,child: Image.asset(widget.LogoApp,color: kbackgroundColor,))),
                                          ],
                                        )),
                  FadeTransition(
                    opacity: _animationFade,
                    child: Container(
                      height: size.height*0.89,
                      width: size.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            height: size.height*0.82,
                            width: size.width,
                            child: Form(
                              key: _formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 20),

                                  Center(
                                    child: Text(
                                      'SIGN IN',
                                      style: TextStyle(
                                        fontSize: 26,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.orange.shade700,
                                      ),
                                    ),
                                  ),

                                  const SizedBox(height: 20),

                                  /// Email / Phone Toggle
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade100,
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: Row(
                                      children: [
                                        _buildToggleButton('Email', isEmail, () {
                                          setState(() => isEmail = true);
                                        }),
                                        _buildToggleButton('Phone', !isEmail, () {
                                          setState(() => isEmail = false);
                                        }),
                                      ],
                                    ),
                                  ),

                                  const SizedBox(height: 25),

                                  Text(isEmail ? 'Email' : 'Phone'),
                                  const SizedBox(height: 8),

                                  TextFormField(
                                    controller: isEmail ? emailController : phoneController,
                                    keyboardType: isEmail
                                        ? TextInputType.emailAddress
                                        : TextInputType.phone,
                                    decoration: InputDecoration(
                                      hintText: isEmail
                                          ? 'youremail@gmail.com'
                                          : '012 345 678',
                                      filled: true,
                                      fillColor: Colors.grey.shade100,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: BorderSide.none,
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return isEmail
                                            ? 'Email is required'
                                            : 'Phone is required';
                                      }
                                      return null;
                                    },
                                  ),

                                   SizedBox(height: 20),
                                   Text('Password'),
                                   SizedBox(height: 8),
                                  TextFormField(
                                    controller: passwordController,
                                    obscureText: onCheckbox,
                                    decoration: InputDecoration(
                                      hintText: 'password',
                                      filled: true,
                                      fillColor: Colors.grey.shade100,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: BorderSide.none,
                                      ),
                                    ),
                                    validator: (value) =>
                                    value!.isEmpty ? 'Password required' : null,
                                  ),

                                  const SizedBox(height: 15),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Checkbox(value: onCheckbox, onChanged: (bool? value){
                                            setState(() {
                                              onCheckbox = value!;
                                            });
                                          }),
                                          Text(
                                            'Remember me',
                                            style: TextStyle(color: Colors.blue),
                                          ),
                                        ],
                                      ),
                                      const Text(
                                        'Forget password?',
                                        style: TextStyle(color: Colors.blue),
                                      ),
                                    ],
                                  ),

                                  const SizedBox(height: 20),

                                  /// Continue Button
                                  SizedBox(
                                    width: double.infinity,
                                    height: 50,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.orange,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(14),
                                        ),
                                      ),
                                      onPressed: () {
                                        if (_formKey.currentState!.validate()) {
                                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Homescreen()));
                                        }
                                      },
                                      child:  Text(
                                        'Continue',
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    ),
                                  ),

                                  const SizedBox(height: 25),

                                  /// OR Divider
                                  Row(
                                    children: const [
                                      Expanded(child: Divider()),
                                      Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 10),
                                        child: Text('Or'),
                                      ),
                                      Expanded(child: Divider()),
                                    ],
                                  ),

                                  const SizedBox(height: 20),

                                  /// Social Icons (placeholder)
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: const [
                                      Icon(Icons.facebook, size: 30, color: Colors.blue),
                                      Icon(Icons.g_mobiledata, size: 30),
                                      Icon(Icons.camera_alt, size: 30),
                                      Icon(Icons.close, size: 30),
                                    ],
                                  ),

                                  const Spacer(),

                                  /// Sign up
                                  Center(
                                    child: RichText(
                                      text: const TextSpan(
                                        text: "Don't have account? ",
                                        style: TextStyle(color: Colors.black),
                                        children: [
                                          TextSpan(
                                            text: 'Sign up',
                                            style: TextStyle(color: Colors.blue),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
Widget _buildToggleButton(
    String text, bool active, VoidCallback onTap) {
  return Expanded(
    child: GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: active ? Colors.orange : Colors.transparent,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: active ? Colors.white : Colors.orange,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    ),
  );
}

