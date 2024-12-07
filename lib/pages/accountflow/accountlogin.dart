import 'package:flutter/material.dart';
import 'package:cinema_application/pages/homepages.dart';
import 'package:cinema_application/widgets/custombackbutton.dart';

class Accountlogin extends StatelessWidget {
  const Accountlogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 253, 247),
      appBar: CustomBackButton(title: 'Sign in'),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 22),
            alignment: Alignment.topCenter,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                
                // Header
                Padding(
                  padding: const EdgeInsets.only(top: 24.0, bottom: 14.0),
                  child: Column(
                    children: [
                      Text(
                        'Hi, welcome back!',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: Color.fromARGB(255, 14, 37, 34),
                        ),
                      ),
                      Text(
                        'Before continue, Please enter your details.',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 14, 37, 34),
                        ),
                      )
                    ],
                  )
                ),

                // Text Editor and Button
                Container(
                  padding: const EdgeInsets.fromLTRB(16, 14, 16, 32),
                  margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 16),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 245, 240, 224),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: Color.fromARGB(255, 14, 37, 34),
                      width: 1.2,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        offset: const Offset(1, 2),
                        blurRadius: 0,
                      ),
                    ],
                  ),
                  
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [

                      // Email text and its textfield
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "     Email",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.black87,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 4),
                              padding: const EdgeInsets.fromLTRB(16, 0, 16, 6),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: Color.fromARGB(255, 14, 37, 34),
                                  width: 1.2,
                                )
                              ),
                              child: 
                              TextField(
                                
                              )
                            )
                          ],
                        )
                      ),

                      // Password and its text field
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Password",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.black87,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Container(
                                margin: const EdgeInsets.only(top: 4),
                                padding: const EdgeInsets.fromLTRB(16, 0, 16, 6),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: Color.fromARGB(255, 14, 37, 34),
                                    width: 1.2,
                                  )
                                ),
                                child: 
                                TextField(
                                  
                                )
                              )
                          ],
                        ),
                      ),

                      //Login Button
                      const SizedBox(height: 24),
                      SizedBox(
                        height: 42,
                        width: double.infinity,

                        // Button Container
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color.fromARGB(255, 14, 37, 34),
                              width: 1.2,
                            ),
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(1, 2), // X and Y offset of the shadow
                                // color: Colors.black.withOpacity(100), 
                                // dikasih color malah error, defaultnya sih udah item.
                              ),
                            ],
                          ),
                          
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(context,
                                MaterialPageRoute(builder: (context) => Homepages()));
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color.fromARGB(255, 255, 196, 64), // Button color
                              foregroundColor: Color.fromARGB(255, 14, 37, 34), // Text color
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              elevation: 2,
                              shadowColor: Color.fromARGB(255, 14, 37, 34),
                            ),
                            child: const Text(
                              'Sign in',
                              style: TextStyle(
                                fontSize: 16, 
                                fontWeight: FontWeight.w700
                              ),
                            ),
                          ),
                        )
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        )
      ),
    );
  }
}
