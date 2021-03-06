import 'package:flutter/material.dart';
import 'package:movieapp/presentation/journeys/drawer/navigation_list_item.dart';

class NavigarionExpandedListItem extends StatelessWidget {
  final String title;
  final Function onPressed;
  final List<String> children;

  const NavigarionExpandedListItem({
    Key key, 
    @required this.title, 
    @required this.onPressed,
    @required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).primaryColor.withOpacity(0.7),
            blurRadius: 2,
          )
        ],
      ),
      child: ExpansionTile(
        title: Text(
          title,
          style: Theme.of(context).textTheme.subtitle1,
        ),
        children: [
          for (int i= 0; i<children.length; i++)
          NavigarionSubListItem(
            title: children[i],
            //esto llamara al metodo presionado que se paso
            onPressed: () => onPressed(i),
          ),
        ],
      ),
    );
  }
}
