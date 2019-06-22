import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyAppBar extends StatefulWidget implements PreferredSizeWidget {
  const MyAppBar(
      {Key key,
      this.backgroundColor: Colors.white,
      this.title: "",
      this.centerTitle: "",
      this.actionName: "",
      this.backImg: "assets/images/ic_back_black.png",
      this.onPressed,
      this.isBack: true})
      : super(key: key);

  final Color backgroundColor;
  final String title;
  final String centerTitle;
  final String backImg;
  final String actionName;
  final VoidCallback onPressed;
  final bool isBack;

  @override
  _MyAppBarState createState() => _MyAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(48.0);
}

class _MyAppBarState extends State<MyAppBar> {
  SystemUiOverlayStyle _overlayStyle = SystemUiOverlayStyle.light;

  @override
  void initState() {
    super.initState();
    setState(() {
      _overlayStyle =
          ThemeData.estimateBrightnessForColor(widget.backgroundColor) ==
                  Brightness.dark
              ? SystemUiOverlayStyle.light
              : SystemUiOverlayStyle.dark;
    });
  }

  Color getColor() {
    return _overlayStyle == SystemUiOverlayStyle.light
        ? Colors.white
        : Colours.text_dark;
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: _overlayStyle,
      child: Material(
        color: widget.backgroundColor,
        child: SafeArea(
          child: Stack(
            alignment: Alignment.centerLeft,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    alignment: widget.centerTitle.isEmpty
                        ? Alignment.centerLeft
                        : Alignment.center,
                    width: double.infinity,
                    child: Text(
                        widget.title.isEmpty
                            ? widget.centerTitle
                            : widget.title,
                        style: TextStyle(
                          fontSize: Dimens.font_sp18,
                          color: getColor(),
                        )),
                    padding: const EdgeInsets.symmetric(horizontal: 48.0),
                  )
                ],
              ),
              widget.isBack
                  ? IconButton(
                      onPressed: () {
                        Navigator.maybePop(context);
                      },
                      padding: const EdgeInsets.all(12.0),
                      icon: Image.asset(
                        widget.backImg,
                        color: getColor(),
                      ),
                    )
                  : Gaps.empty,
              Positioned(
                right: 0.0,
                child: Theme(
                  data: ThemeData(
                      buttonTheme: ButtonThemeData(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    minWidth: 60.0,
                  )),
                  child: widget.actionName.isEmpty
                      ? Container()
                      : FlatButton(
                          child: Text(widget.actionName),
                          textColor: getColor(),
                          highlightColor: Colors.transparent,
                          onPressed: widget.onPressed,
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Dimens {
  static const double font_sp10 = 10;
  static const double font_sp12 = 12;
  static const double font_sp14 = 14;
  static const double font_sp16 = 16;
  static const double font_sp18 = 18;

  static const double gap_dp5 = 5;
  static const double gap_dp10 = 10;
  static const double gap_dp12 = 12;
  static const double gap_dp15 = 15;
  static const double gap_dp16 = 16;
  static const double gap_dp50 = 50;
}

class Colours {
  static const Color app_main = Color(0xff4688FA);
  static const Color bg_color = Color(0xfff1f1f1);

  static const Color text_dark = Color(0xFF333333);
  static const Color text_normal = Color(0xFF666666);
  static const Color text_gray = Color(0xFF999999);
  static const Color text_gray_c = Color(0xFFcccccc);
  static const Color bg_gray = Color(0xFFF6F6F6);
  static const Color text_blue = Color(0xFF4688FA);
  static const Color line = Color(0xFFEEEEEE);
  static const Color order_line = Color(0xFFDDDDDD);
  static const Color text_red = Color(0xFFFF4759);

  static const Color login_text_disabled = Color(0xFFD4E2FA);
  static const Color login_button_disabled = Color(0xFF96BBFA);
}

class TextStyles {
  static const TextStyle textMain12 = TextStyle(
    fontSize: Dimens.font_sp12,
    color: Colours.app_main,
  );
  static const TextStyle textMain14 = TextStyle(
    fontSize: Dimens.font_sp14,
    color: Colours.app_main,
  );
  static const TextStyle textNormal12 = TextStyle(
    fontSize: Dimens.font_sp12,
    color: Colours.text_normal,
  );
  static const TextStyle textDark12 = TextStyle(
    fontSize: Dimens.font_sp12,
    color: Colours.text_dark,
  );
  static const TextStyle textDark14 = TextStyle(
    fontSize: Dimens.font_sp14,
    color: Colours.text_dark,
  );
  static const TextStyle textDark16 = TextStyle(
    fontSize: Dimens.font_sp16,
    color: Colours.text_dark,
  );
  static const TextStyle textBoldDark14 = TextStyle(
      fontSize: Dimens.font_sp14,
      color: Colours.text_dark,
      fontWeight: FontWeight.bold);
  static const TextStyle textBoldDark16 = TextStyle(
      fontSize: Dimens.font_sp16,
      color: Colours.text_dark,
      fontWeight: FontWeight.bold);
  static const TextStyle textBoldDark18 = TextStyle(
      fontSize: Dimens.font_sp18,
      color: Colours.text_dark,
      fontWeight: FontWeight.bold);
  static const TextStyle textBoldDark24 = TextStyle(
      fontSize: 24.0, color: Colours.text_dark, fontWeight: FontWeight.bold);
  static const TextStyle textBoldDark26 = TextStyle(
      fontSize: 26.0, color: Colours.text_dark, fontWeight: FontWeight.bold);
  static const TextStyle textGray10 = TextStyle(
    fontSize: Dimens.font_sp10,
    color: Colours.text_gray,
  );
  static const TextStyle textGray12 = TextStyle(
    fontSize: Dimens.font_sp12,
    color: Colours.text_gray,
  );
  static const TextStyle textGray14 = TextStyle(
    fontSize: Dimens.font_sp14,
    color: Colours.text_gray,
  );
  static const TextStyle textGray16 = TextStyle(
    fontSize: Dimens.font_sp16,
    color: Colours.text_gray,
  );
  static const TextStyle textGrayC12 = TextStyle(
    fontSize: Dimens.font_sp12,
    color: Colours.text_gray_c,
  );
  static const TextStyle textGrayC14 = TextStyle(
    fontSize: Dimens.font_sp14,
    color: Colours.text_gray_c,
  );
}

class Gaps {
  static const Widget hGap5 = SizedBox(width: Dimens.gap_dp5);
  static const Widget hGap10 = SizedBox(width: Dimens.gap_dp10);
  static const Widget hGap15 = SizedBox(width: Dimens.gap_dp15);
  static const Widget hGap16 = SizedBox(width: Dimens.gap_dp16);

  static const Widget vGap5 = SizedBox(height: Dimens.gap_dp5);
  static const Widget vGap10 = SizedBox(height: Dimens.gap_dp10);
  static const Widget vGap15 = SizedBox(height: Dimens.gap_dp15);
  static const Widget vGap50 = SizedBox(height: Dimens.gap_dp50);

  static const Widget vGap4 = SizedBox(height: 4.0);
  static const Widget vGap8 = SizedBox(height: 8.0);
  static const Widget vGap12 = SizedBox(height: 12.0);
  static const Widget vGap16 = SizedBox(height: Dimens.gap_dp16);

  static const Widget hGap4 = SizedBox(width: 4.0);
  static const Widget hGap8 = SizedBox(width: 8.0);
  static const Widget hGap12 = SizedBox(width: 12.0);

  static Widget line = Container(height: 0.6, color: Colours.line);
  static const Widget empty = SizedBox();
}
