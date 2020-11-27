import 'package:api/api.dart';
import 'package:biomad_frontend/containers/members_list_container.dart';
import 'package:biomad_frontend/helpers/i18n_helper.dart';
import 'package:biomad_frontend/extensions/snack_bar_extension.dart';
import 'package:biomad_frontend/helpers/age_from_date.dart';
import 'package:biomad_frontend/helpers/color_helpers.dart';
import 'package:biomad_frontend/helpers/custom_alert_dialog.dart';
import 'package:biomad_frontend/helpers/i18n_helper.dart';
import 'package:biomad_frontend/helpers/keys.dart';
import 'package:biomad_frontend/models/authorization.dart';
import 'package:biomad_frontend/router/main.dart';
import 'package:biomad_frontend/services/api.dart';
import 'package:biomad_frontend/store/Gender/actions.dart';
import 'package:biomad_frontend/store/main.dart';
import 'package:biomad_frontend/store/thunks.dart';
import 'package:biomad_frontend/styles/avatar_sizes.dart';
import 'package:biomad_frontend/styles/biomad_colors.dart';
import 'package:biomad_frontend/styles/color_alphas.dart';
import 'package:biomad_frontend/styles/indents.dart';
import 'package:biomad_frontend/styles/radius_values.dart';
import 'package:biomad_frontend/widgets/block_base_widget.dart';
import 'package:biomad_frontend/widgets/custom_circle_avatar.dart';
import 'package:biomad_frontend/widgets/custom_list_builder.dart';
import 'package:biomad_frontend/widgets/custom_list_tile.dart';
import 'package:biomad_frontend/widgets/drop_text.dart';
import 'package:biomad_frontend/widgets/member_list_tile.dart';
import 'package:biomad_frontend/widgets/custom_divider.dart';
import 'package:biomad_frontend/widgets/social_account_list_tile.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:biomad_frontend/helpers/no_ripple_scroll_behaviour.dart';
import 'package:biomad_frontend/styles/indents.dart';
import 'package:biomad_frontend/styles/radius_values.dart';
import 'package:flutter/material.dart';

class CategoryContainer extends StatefulWidget {
  @override
  _CategoryContainerState createState() => _CategoryContainerState();
}

class _CategoryContainerState extends State<CategoryContainer> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
//    final _tr = trWithKey('account_container');
    final user = store.state.user;
    final currentMember = store.state.authorization.currentMember;

    store.dispatch(StoreThunks.loadCategories());
    var category = store.state.categoryList.categories;

    return Container(
        height: MediaQuery.of(context).size.height -
            AppBar().preferredSize.height -
            61,
        width: MediaQuery.of(context).size.width,
        child: ScrollConfiguration(
          behavior: NoRippleScrollBehaviour(),
          child: ListView.builder(
              itemCount: store.state.categoryList.categories.length,
              itemBuilder: (context, index) => categoryItem(index, category)),
        ));
  }

  Widget categoryItem(int index, category) {
    final theme = Theme.of(context);
    var category = store.state.categoryList.categories[index];

    return GestureDetector(
      onTap: () {
        Keys.rootNavigator.currentState.pushReplacementNamed(
            Routes.category_analysis,
            arguments: category.id);
      },
      child: Container(
        padding: EdgeInsets.only(left: Indents.md, right: Indents.sm),
        margin: EdgeInsets.only(
            top: index == 0 ? Indents.md : Indents.smd,
            left: Indents.md,
            right: Indents.md),
        decoration: BoxDecoration(
          color: BioMadColors.base[100],
          borderRadius: BorderRadius.all(Radius.circular(4)),
          boxShadow: [
            BoxShadow(
              color: BioMadColors.base.withOpacity(0.06),
              blurRadius: 7,
              offset: Offset(0, 2), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(children: [
              Icon(
                Icons.favorite,
                color: BioMadColors.success,
                size: 32.0,
              ),
              Container(
                padding: EdgeInsets.all(Indents.md),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      category.content.name,
                      style: theme.textTheme.bodyText2,
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 2),
                      child: Text(
                        "Состояние: 80%",
                        style: theme.textTheme.caption
                            .merge(TextStyle(color: BioMadColors.success)),
                      ),
                    )
                  ],
                ),
              )
            ]),
            IconButton(
                icon: Icon(
                  Icons.arrow_forward,
                  color: BioMadColors.primary,
                  size: 24.0,
                ),
                onPressed: null)
          ],
        ),
      ),
    );
  }
}
