import 'package:flower_app/data/dummy_data.dart';
import 'package:flower_app/state/auth_controller.dart';
import 'package:flower_app/theme/app_theme.dart';
import 'package:flower_app/widget/home_content_header.dart';
import 'package:flower_app/widget/sheet_drag_andle.dart';
import 'package:flutter/material.dart';

void showProfileSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    builder: (sheetContext) => _ProfileSheetContent(homeContext: context)
  );
}

class _ProfileSheetContent extends StatelessWidget {
  const _ProfileSheetContent({super.key, required this.homeContext});

  final BuildContext homeContext;

  Future<void> _logout(BuildContext sheetContext) async {
    Navigator.of(sheetContext).pop();
    await AuthController.instance.logout();

    if (!homeContext.mounted /* mounted = ready ga nih, tapi artinya disini if udah logout si user bakal di direct ke */) {
      Navigator.of(homeContext).pushAndRemoveUntil(
        MaterialPageRoute(builder: (l_) => Placeholder()), //arahkan ke loginscreen
        /**
         *  predicate ii bilang 'hapus semua halaman sebelumnya dari riwayat navigasi' 
         * jadi setelah logot tombol back tidak akan mengembalikan penguna ke halaman home
         */
        (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(24, 12, 24, 32),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SheetDragAndle(),
          SizedBox(height: 24),
          Container(
            width: 68,
            height: 68,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [AppTheme.primary,AppTheme.primaryDark]),
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.person_rounded, color: Colors.white, size: 34),
          ),
          SizedBox(height: 14),
          Text(
            DummyUser.name,
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w700,
              color: AppTheme.textPrimary,
            ),
          ),
          SizedBox(height: 4),
          Text(
            DummyUser.email,
            style: TextStyle(
              fontSize: 13,
              color: AppTheme.textSecondary,
            ),
          ),
          SizedBox(height: 26),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: () => _logout(context),
              icon: Icon(Icons.logout_rounded, size: 18),
              label: Text("Keluar"),
              style: OutlinedButton.styleFrom(
                foregroundColor: AppTheme.primaryDark,
                side: BorderSide(color: AppTheme.primary),
                padding: EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              ),
            ), //krn si btton nya ini cuman bordernya doang
          )
        ],
      ),
    );
  }
}