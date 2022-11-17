import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LoginView'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.greenAccent,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 6,
                    color: Color(0x3416202A),
                    offset: Offset(0, 2),
                  )
                ],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                child: TextFormField(
                  controller: controller.emailAddressController,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: 'Id',
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    filled: true,
                    fillColor:Colors.greenAccent,
                    contentPadding:
                    EdgeInsetsDirectional.fromSTEB(20, 24, 20, 24),
                  ),
                  maxLines: null,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
            child: GetBuilder<LoginController>(
                builder: (_) {
                  return TextFormField(
                    controller: _.passwordTextController,
                    obscureText: !_.passwordVisibility,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      filled: true,
                      fillColor: Colors.greenAccent,
                      contentPadding:
                      EdgeInsetsDirectional.fromSTEB(20, 24, 20, 24),
                      suffixIcon: InkWell(
                        onTap: _.changePasswordVisibility,
                        focusNode: FocusNode(skipTraversal: true),
                        child: Icon(
                          _.passwordVisibility
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          color: Colors.grey,
                          size: 22,
                        ),
                      ),
                    ),
                  );
                }
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MaterialButton(
                  onPressed: controller.signIn,
                    child: Text('로그인'),
                  ),
                MaterialButton(
                  onPressed: controller.signUp,
                  child: Text('sign Up'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
