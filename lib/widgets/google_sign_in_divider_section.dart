import 'package:flutter/material.dart';
import 'package:login/google_sign_in_flow.dart';

class GoogleSignInDividerSection extends StatelessWidget {
  const GoogleSignInDividerSection({super.key, required this.isDarkMode});

  final bool isDarkMode;

  @override
  Widget build(BuildContext context) {
    final Color dividerColor = isDarkMode ? Colors.white54 : Colors.black54;
    final Color fg = isDarkMode ? Colors.white : Colors.black87;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Expanded(child: Divider(color: dividerColor)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                'or',
                style: TextStyle(color: dividerColor, fontSize: 14),
              ),
            ),
            Expanded(child: Divider(color: dividerColor)),
          ],
        ),
        const SizedBox(height: 14),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            onPressed: () => signInWithGoogle(context),
            icon: Icon(Icons.g_mobiledata, size: 26, color: fg),
            label: const Text('Continue with Google'),
            style: OutlinedButton.styleFrom(
              foregroundColor: fg,
              padding: const EdgeInsets.symmetric(vertical: 12),
              side: BorderSide(color: dividerColor),
            ),
          ),
        ),
      ],
    );
  }
}
