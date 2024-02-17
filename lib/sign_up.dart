import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return const SignupForm();
  }
}

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  //final _authentication = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  bool saving = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            // 배경 그라디언트
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF6D71D2), Color(0xFF202475)],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 40),
                Container(
                  width: MediaQuery.of(context).size.width * 0.87, // 큰 박스 크기
                  decoration: BoxDecoration(
                      color: const Color(0xFF6D71D2).withOpacity(0.5),
                      borderRadius: BorderRadius.circular(30), // 큰 박스 모서리 둥글게
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 3,
                            spreadRadius: 3,
                            offset: const Offset(0, 1))
                      ]),
                  padding:
                      const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // ID
                        const Text(
                          '  EMAIL',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            color: Colors.white,
                            fontStyle: FontStyle.italic,
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(height: 0),
                        TextFormField(
                          obscureText: false, // 입력 안 보이게
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 15),
                            // 비밀번호 폼 높이, 너비
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide: const BorderSide(
                                color: Colors.black,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              // 포커스 됐을 때의 테두리
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide:
                                  const BorderSide(color: Colors.lightBlue),
                            ),
                          ),
                          onChanged: (value) {
                            email = value;
                          },
                        ),
                        const SizedBox(height: 10),

                        // PW
                        const Text(
                          '  PASSWORD',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            color: Colors.white,
                            fontStyle: FontStyle.italic,
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(height: 0),
                        TextFormField(
                          obscureText: true, // 입력 안 보이게
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 15),
                            // 비밀번호 폼 높이, 너비
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              // 포커스 됐을 때의 테두리
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide:
                                  const BorderSide(color: Colors.lightBlue),
                            ),
                          ),
                          onChanged: (value) {
                            password = value;
                          },
                        ),
                        const SizedBox(height: 50),

                        // NEXT
                        Center(
                          child: Container(
                            width: 130, // 로그인 버튼 너비
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(150),
                              // 그림자 모서리 둥글게
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black12,
                                  offset: Offset(2.5, 2), // 그림자 위치
                                  blurRadius: 0, // 그림자 스프레드
                                  spreadRadius: -3, // 그림자 크기
                                ),
                              ],
                            ),
                            child: ElevatedButton(
                              onPressed: () async {
                                // try {
                                //   setState(() {
                                //     saving = true;
                                //   });
                                //   final newUser = await _authentication
                                //       .createUserWithEmailAndPassword(
                                //     email: email,
                                //     password: password,
                                //   );
                                //   await FirebaseFirestore.instance.collection('users').doc(newUser.user!.uid).set({
                                //     'email' : email,
                                //   });
                                //   if (newUser.user != null) {
                                //     // 회원가입 성공
                                //     _formKey.currentState!.reset();
                                //     if (!mounted) return;
                                //     FocusScope.of(context).unfocus();
                                //     Navigator.push(context, _createRoute());
                                //   } else {
                                //     // 회원가입 실패 처리
                                //     print("회원가입 실패: 사용자 정보가 없습니다.");
                                //   }
                                // } catch (e, stackTrace) {
                                //   print("회원가입 실패: $e");
                                //   print("스택 트레이스: $stackTrace");
                                // }
                                setState(() {
                                  saving = false;
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 7),
                                // 로그인 버튼 높이
                                backgroundColor: Colors.white,
                                foregroundColor: Colors.lightBlue[800],
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(150),
                                  side: const BorderSide(color: Colors.black),
                                ),
                              ),
                              child: Text('Register',
                                  style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontStyle: FontStyle.italic,
                                  )),
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
        ),
      ),
    );
  }
}
