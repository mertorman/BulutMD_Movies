import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class Bottom_Bar extends StatelessWidget {
  const Bottom_Bar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.1,
        decoration: BoxDecoration(color: Colors.black),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                        focusColor: Colors.red,
                        highlightColor: Colors.red,
                        hoverColor: Colors.red,
                        splashColor: Colors.red,
                        onTap: () {},
                        child: Text(
                          'Anasayfa',
                          style: GoogleFonts.poppins(
                              color: Colors.white, fontSize: 15),
                        )),
                    VerticalDivider(
                      color: Colors.white,
                      thickness: 2,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Text('Kullanıcı Sözleşmesi',
                          style: GoogleFonts.poppins(
                              color: Colors.white, fontSize: 15)),
                    ),
                    VerticalDivider(
                      color: Colors.white,
                      thickness: 2,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Text('Gizlilik Sözleşmesi',
                          style: GoogleFonts.poppins(
                              color: Colors.white, fontSize: 15)),
                    )
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  FontAwesomeIcons.facebook,
                  color: Colors.white,
                  size: 35,
                ),
                SizedBox(
                  width: 15,
                ),
                Icon(
                  FontAwesomeIcons.twitter,
                  color: Colors.white,
                  size: 35,
                )
              ],
            )
          ],
        ));
  }
}