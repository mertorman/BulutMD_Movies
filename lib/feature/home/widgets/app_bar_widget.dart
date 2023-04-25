import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppBar_Widget extends StatelessWidget implements PreferredSizeWidget {
  const AppBar_Widget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Text(
              'BulutMD',
              style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              width: 5,
            ),
            Image.asset('assets/images/logo.png',
                width: MediaQuery.of(context).size.width * 0.1)
          ],
        ),
      ),
      actions: [
        Padding(
          padding:
              const EdgeInsets.only(right: 12, bottom: 12, top: 12, left: 12),
          child: ElevatedButton(
            onPressed: () {},
            child: Text(
              'Deneme Başlat',
              style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.bold),
            ),
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                minimumSize: Size(MediaQuery.of(context).size.width * 0.1,
                    MediaQuery.of(context).size.height * 0.1)),
          ),
        )
      ],
      backgroundColor: Colors.black,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}