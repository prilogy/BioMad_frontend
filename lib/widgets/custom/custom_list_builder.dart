import 'package:biomad_frontend/styles/indents.dart';
import 'package:flutter/material.dart';

typedef ItemBuilder<T> = Widget Function(T model, bool isLast);

enum CustomListBuilderTypes { verticalList, grid, horizontalList }

class CustomListBuilder<T> extends StatelessWidget {
  /// Список моделей, которые необходимо преобразовать в виджеты
  final List<T>? items;
  /// Функция-преобразователь моделей в виджеты с последующим составлением списка
  final ItemBuilder<T> itemBuilder;
  /// Тип отображаемого листа
  final CustomListBuilderTypes type;
  /// Высота карточки в горизонтальном скролле
  final double height;
  /// Количество элементов в сетке (grid)
  final int crossAxisCount;
  /// Соотношение сторон для объектов в grid
  final double childAspectRatio;
  // Расстояние между элементами
  final double gap;
  // Форсит отступ для последнего элемента
  final bool lastItemHasGap;
  /// Коннектит к рут стору
  final bool connectToStore ;


  CustomListBuilder(
      {required this.items,
      required this.itemBuilder,
      this.type = CustomListBuilderTypes.verticalList,
      this.height = 100,
      this.crossAxisCount = 2,
      this.childAspectRatio = 16/9,
      this.gap = Indents.smd,
      this.lastItemHasGap = false,
      this.connectToStore = false});

  @override
  Widget build(BuildContext context) {

    var widgetItems = <Widget>[];
    var i = 0;
    for(var e in items!) {
      widgetItems.add(itemBuilder(e, items!.length - 1 == i));
      i++;
    }

    switch (type) {
      case CustomListBuilderTypes.verticalList:
        {
          return ListView(
            padding: EdgeInsets.all(0),
            shrinkWrap: true,
            primary: false,
            children: <Widget>[
              for (var item in widgetItems)
                Container(
                  margin: EdgeInsets.only(
                      bottom: widgetItems.last == item && !lastItemHasGap ? 0 : gap),
                  child: item,
                )
            ],
          );
        }
        break;
      case CustomListBuilderTypes.grid:
        {
          return GridView.count(
            primary: false,
            crossAxisSpacing: Indents.md,
            mainAxisSpacing: Indents.sm,
            childAspectRatio: childAspectRatio,
            shrinkWrap: true,
            crossAxisCount: crossAxisCount,
            children: <Widget>[
              for (var item in widgetItems) item,
            ],
          );
        }
        break;
      case CustomListBuilderTypes.horizontalList:
        {
          return Container(
            height: height,
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: Indents.sm),
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                for (var item in widgetItems)
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: Indents.sm),
                    child: item,
                  )
              ],
            ),
          );
        }
        break;
      default:
        return Container();
    }
  }
}
