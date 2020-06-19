import 'package:flutter/material.dart';

class GrayBox extends StatelessWidget {

    GrayBox({@required this.child});

    final Widget child;

    @override
    Widget build(BuildContext context) {
        return Padding(
            padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12),
            child: SizedBox(
                    width: double.infinity,
                    child: Container(
                            decoration: BoxDecoration(
                                    color: Color.fromARGB(0xff, 0x20, 0x20, 0x20),
                                    borderRadius: BorderRadius.all(Radius.circular(20))
                            ),
                            child: Padding(
                                    padding: EdgeInsets.all(32.0),
                                    child: child
                            )
                    )
            ),
        );
    }
}