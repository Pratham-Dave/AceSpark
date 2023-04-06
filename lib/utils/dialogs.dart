import 'package:flutter/material.dart';

void notificationDialog() {
  Dialog(
    child: Expanded(
      child: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Image(
                image: AssetImage('assets/images/empty.png'),
                height: 60,
              ),
              Text("No new notifications to show"),
            ],
          ),
        ),
      ),
    ),
  );
}
