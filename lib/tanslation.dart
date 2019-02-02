import 'package:flutter/material.dart';

class GoogleTranslate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Google Translation'
        ),
      ),
      body: Column(
        children: <Widget>[
          _ChooseLanguage(),
          _TranslateText(),
          Expanded(child: _ListTranslate(),)
        ],
      ),
    );
  }
}

class _ChooseLanguage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ChooseLanguageState();
  }
}

class _ChooseLanguageState extends State<_ChooseLanguage> {

  String firstLanguage = '中文';
  String secondLanguage = 'English';

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55.0,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            width: 0.5,
            color: Colors.grey[500]
          )
        )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Material(
              color: Colors.white,
              child: InkWell(
                onTap: () {

                },
                child: Center(
                  child: Text(
                    this.firstLanguage,
                    style: TextStyle(
                      color: Colors.blue[600]
                    ),
                  ),
                ),
              ),
            ),
          ),
          Material(
            color: Colors.white,
            child: IconButton(
              icon: Icon(
                Icons.compare_arrows,
                color: Colors.grey[700]
              ),
              onPressed: () {
                this.setState((){
                  String temp = this.firstLanguage;
                  this.firstLanguage = this.secondLanguage;
                  this.secondLanguage = temp;
                });
              },
            ),
          ),
          Expanded(
            child: Material(
              color: Colors.white,
              child: InkWell(
                onTap: () {

                },
                child: Center(
                  child: Text(
                    this.secondLanguage,
                    style: TextStyle(
                      color: Colors.blue[600]
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TranslateText extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TranslateTextState();
}

class _TranslateTextState extends State<_TranslateText> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.all(0.0),
      elevation: 2.0,
      child: Container(
        height: 150.0,
        child: Column(
          children: <Widget>[
            Expanded(
              child: InkWell(
                onTap: () {

                },
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(
                    top: 16.0,
                    left: 16.0
                  ),
                  child: Text(
                    'Enter Text',
                    style: TextStyle(
                      color: Colors.grey[700],
                    ),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                _ActionButton(
                  text: 'Camera', 
                  icon: Icons.camera_alt,
                ),
                _ActionButton(
                  text: 'Handwriting',
                  imageIcon: AssetImage(
                    'images/pen.png'
                  ),
                ),
                _ActionButton(
                  text: 'Conversation',
                  imageIcon: AssetImage(
                    'images/conversation.png'
                  ),
                ),
                _ActionButton(
                  text: 'Voice',
                  icon: Icons.keyboard_voice,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _ActionButton extends StatefulWidget {

  _ActionButton({Key key, this.icon, this.imageIcon, this.text}) : super(key: key);

  final IconData icon;
  final AssetImage imageIcon;
  final String text;

  @override
  State<StatefulWidget> createState() {
    return _ActionButtonState();
  }
}

class _ActionButtonState extends State<_ActionButton> {

  Widget _displayIcon() {
    if (this.widget.icon != null) {
      return Icon(
              this.widget.icon,
              color: Colors.blue[800],
              size: 23.0,
            );
    } else if (this.widget.imageIcon != null) {
      return ImageIcon(
        this.widget.imageIcon,
        color: Colors.blue[800],
        size: 23.0,
      );
    }
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: FlatButton(
        child: Column(
          children: <Widget>[
            _displayIcon(),
            Text(
              this.widget.text,
              style: TextStyle(
                fontSize: 12.0
              ),
            ),
          ],
        ),
        onPressed: () {

        },
        padding: EdgeInsets.only(
          top: 2.0,
          bottom: 2.0,
          left: 8.0,
          right: 8.0
        ),
      ),
    );
  }
}

class _Translate {

  _Translate(this.text, this.translatedText, this.isFav);

  String text;
  String translatedText;
  bool isFav;
}

class _ListTranslate extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ListTranslateState();
  }
}

class _ListTranslateState extends State<_ListTranslate> {

  List<_Translate> _items = [
    _Translate('中国', 'China', true),
    _Translate('美国', 'America', false)
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _items.length,
      itemBuilder: (BuildContext bctx, int i) {
        _Translate translate = _items[i];
        IconData iconData = translate.isFav ? Icons.star : Icons.star_border;
        Color color = translate.isFav ? Colors.blue[700] : Colors.black;
        Icon icon = Icon(
          iconData,
          color: color,
        );
        String text = translate.text;
        String translatedText = translate.translatedText;
        return Card(
          child: Container(
            padding: EdgeInsets.only(
              left: 16.0,
              // right: 16.0
            ),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(
                          top: 8.0,
                          bottom: 4.0
                        ),
                        child: Text(
                          text,
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                          bottom: 8.0
                        ),
                        child: Text(
                          translatedText,
                        ),
                      )
                    ],
                  ),
                ),
                IconButton(
                  icon: icon,
                  onPressed: () {

                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }
}