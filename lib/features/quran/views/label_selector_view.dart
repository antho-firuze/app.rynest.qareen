import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:qareen/cff/utils/my_scaffold.dart';
import 'package:qareen/cff/utils/ui_helper.dart';
import 'package:qareen/cff/widgets/custom_input.dart';
import 'package:qareen/features/quran/controllers/label_selector.dart';
import 'package:qareen/features/quran/controllers/quran_bookmark.dart';
import 'package:super_icons/super_icons.dart';

class LabelSelectorView extends ConsumerStatefulWidget {
  const LabelSelectorView({super.key});

  @override
  ConsumerState<LabelSelectorView> createState() => _LabelSelectorViewState();
}

class _LabelSelectorViewState extends ConsumerState<LabelSelectorView> {
  String _newLabel = '';
  List<String> _allLabels = [];
  List<String> _selectedLabels = [];
  List<String> _filteredLabels = [];

  @override
  void initState() {
    _allLabels = ref.read(quranBookmarkProvider.notifier).getLabels();
    _selectedLabels = [...ref.read(labelSelectorProvider)];
    _runFilter();
    super.initState();
  }

  void _runFilter([String searchTerm = '']) {
    List<String> _result = [];
    if (searchTerm.isEmpty) {
      _result = _allLabels;
    } else {
      _result = _allLabels.where((el) => el.toLowerCase().contains(searchTerm.toLowerCase())).toList();
    }

    final _check = _allLabels.where((el) => el.toLowerCase() == searchTerm.toLowerCase()).toList();

    setState(() {
      _newLabel = _check.isEmpty ? searchTerm : '';
      _filteredLabels = _result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      showConnectivityInfo: false,
      appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.only(right: 20),
            child: CustomInput(
              autoFocus: true,
              height: 40,
              hintText: 'Cari Label',
              autoLabel: false,
              suffixIcon: Icon(SuperIcons.bs_search),
              borderRadius: 25,
              foregroundColor: Colors.white,
              iconColor: Colors.white,
              borderSide: BorderSide(color: Colors.white),
              onChanged: (val) => _runFilter(val),
              onSubmitted: (val) async {
                // await ref.read(productListProvider.notifier).searchData(val);
                // controller.jumpTo(0);
              },
            ),
          ),
        ),
      child: Column(
        children: [
          if (_newLabel.length > 0)
            ListTile(
              leading: Icon(Icons.add, color: Colors.blue),
              title: Text('Tambah "$_newLabel"'),
              onTap: () {
                ref.read(labelSelectorProvider.notifier).add(_newLabel);
                context.pop();
              },
            ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: _filteredLabels.length,
            itemBuilder: (context, index) {
              bool _selected = _selectedLabels.contains(_filteredLabels[index]);
              return ListTile(
                leading: Icon(SuperIcons.bs_tag),
                title: Text('${_filteredLabels[index]}').tsTitle(),
                trailing: Checkbox.adaptive(
                  value: _selected,
                  onChanged: (value) {
                    if (value == true) {
                      _selectedLabels.add(_filteredLabels[index]);
                      ref.read(labelSelectorProvider.notifier).add(_filteredLabels[index]);
                    } else {
                      _selectedLabels.remove(_filteredLabels[index]);
                      ref.read(labelSelectorProvider.notifier).del(_filteredLabels[index]);
                    }

                    setState(() {});
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
