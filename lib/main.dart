import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

void main() => runApp(new Investors());

class Investors extends StatelessWidget {
  @override
  Widget build(BuildContext context) => new MaterialApp(
        title: 'Private Investors Portal',
        theme: new ThemeData(
          primaryColor: Colors.blue,
        ),
        home: new RandomWords(),
      );
}

class RandomWords extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new RandomWordsState();
}

class RandomWordsState extends State<RandomWords>
    with SingleTickerProviderStateMixin {
  static const _PANEL_HEADER_HEIGHT = 32.0;

  final List<WordPair> _suggestions = <WordPair>[];
  final Set<WordPair> _saved = new Set<WordPair>();
  final TextStyle _biggerFont = const TextStyle(fontSize: 18.0);

  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = new AnimationController(
      duration: const Duration(milliseconds: 100),
      value: 1.0,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) => new Scaffold(
        appBar: new AppBar(
          elevation: 0.0,
          title: new Text("Private Investors Portal"),
          leading: new IconButton(
              onPressed: () {
                _controller.fling(velocity: _isPanelVisible ? -1.0 : 1.0);
              },
              icon: new AnimatedIcon(
                icon: AnimatedIcons.close_menu,
                progress: _controller.view,
              )),
          actions: <Widget>[
            new IconButton(
              icon: const Icon(Icons.list),
              onPressed: _pushSaved,
            )
          ],
        ),
        body: new SafeArea(
          child: new LayoutBuilder(
            builder: _buildStack,
          ),
        ),
      );

  bool get _isPanelVisible {
    final AnimationStatus status = _controller.status;
    return status == AnimationStatus.completed ||
        status == AnimationStatus.forward;
  }

  void _pushSaved() => Navigator.of(context).push(
        new MaterialPageRoute<void>(
          builder: (BuildContext context) {
            final Iterable<ListTile> tiles = _saved.map(
              (WordPair pair) {
                return new ListTile(
                  title: new Text(
                    pair.asPascalCase,
                    style: _biggerFont,
                  ),
                );
              },
            );
            final List<Widget> divided = ListTile
                .divideTiles(
                  context: context,
                  tiles: tiles,
                )
                .toList();

            return new Scaffold(
              appBar: new AppBar(
                title: const Text('Saved Suggestions'),
              ),
              body: new ListView(children: divided),
            );
          },
        ),
      );

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  Widget _buildStack(BuildContext context, BoxConstraints constraints) {
    final Animation<RelativeRect> animation = _getPanelAnimation(constraints);
    final ThemeData theme = Theme.of(context);
    return new Container(
        color: theme.primaryColor,
        child: new Stack(
          children: <Widget>[
            new Center(
              child: new Text("base"),
            ),
            new PositionedTransition(
                rect: animation,
                child: new Material(
                    borderRadius: const BorderRadius.only(
                      topLeft: const Radius.circular(16.0),
                      topRight: const Radius.circular(16.0),
                    ),
                    elevation: 12.0,
                    child: new Column(
                      children: <Widget>[
                        new Container(
                          height: _PANEL_HEADER_HEIGHT,
                          child: new Center(
                            child: new Text("panel"),
                          ),
                        ),
                        new Expanded(
                          child: new Center(
                            child: _buildSuggestions(),
                          ),
                        ),
                      ],
                    )
                )
            ),
          ],
        ));
  }

  Animation<RelativeRect> _getPanelAnimation(BoxConstraints constraints) {
    final double height = constraints.biggest.height;
    final double top = height - _PANEL_HEADER_HEIGHT;
    final double bottom = -_PANEL_HEADER_HEIGHT;

    return new RelativeRectTween(
      begin: new RelativeRect.fromLTRB(0.0, top, 0.0, bottom),
      end: new RelativeRect.fromLTRB(0.0, 0.0, 0.0, 0.0),
    )
        .animate(
      new CurvedAnimation(
        parent: _controller,
        curve: Curves.linear,
      ),
    );
  }

  Widget _buildSuggestions() => new ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (BuildContext _context, int i) {
          if (i.isOdd) {
            return new Divider();
          }

          final int index = i ~/ 2;
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }

          return _buildRow(_suggestions[index]);
        },
      );

  Widget _buildRow(WordPair pair) {
    final bool alreadySaved = _saved.contains(pair);

    return new ListTile(
        title: new Text(
          pair.asPascalCase,
          style: _biggerFont,
        ),
        trailing: new Icon(
          alreadySaved ? Icons.favorite : Icons.favorite_border,
          color: alreadySaved ? Colors.red : null,
        ),
        onTap: () {
          setState(() {
            if (alreadySaved) {
              _saved.remove(pair);
            } else {
              _saved.add(pair);
            }
          });
        });
  }
}
