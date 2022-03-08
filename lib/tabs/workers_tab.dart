import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert' as convert;
import '../models/worker_nft.dart';

import 'workers_tab_worker_tile.dart';
import 'worker_card_to_save.dart';
import '../models/request.dart';

class WorkersTab extends StatefulWidget {
  const WorkersTab({Key? key}) : super(key: key);

  @override
  State<WorkersTab> createState() => _WorkersTabState();
}

class _WorkersTabState extends State<WorkersTab> {
  final _inputController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  bool _nftLoaded = false;
  late WorkerNft _workerNft;
  late WorkersTabWorkerTile _workerTile;
  Map<String, dynamic> _rarityDb = {};
  int _searchByIndex = 0;

  @override
  void initState() {
    loadRarities();
    super.initState();
  }

  @override
  void dispose() {
    _inputController.dispose();
    super.dispose();
  }

  void loadRarities() async {
    try {
      final String response =
          await rootBundle.loadString('assets/data/rarity.json');
      _rarityDb = await convert.jsonDecode(response);
    } catch (e) {
      // print('ERROR LOADING RARITIES: $e');
    }
  }

  void request(String id) async {
    setState(() {
      _nftLoaded = false;
      _isLoading = true;
    });
    try {
      final metadata = await Request.get('${Request.nftWorkerUrl}$id.json');
      if (metadata.isNotEmpty) {
        setState(() {
          _workerNft = WorkerNft.fromJson(metadata, id);
          _nftLoaded = true;
          _workerTile = WorkersTabWorkerTile(nft: _workerNft);
        });
      } else {
        throw Exception('Failed to load image');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Faild to load worker #$id'),
          backgroundColor: Theme.of(context).errorColor.withOpacity(0.7),
        ),
      );
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      onTap: () {
        final FocusScopeNode currentScope = FocusScope.of(context);
        if (!currentScope.hasPrimaryFocus && currentScope.hasFocus) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
      child: ListView(
        children: [
          const SizedBox(
            height: 20,
          ),
          Center(
            child: Text('Workers Database',
                style: Theme.of(context).textTheme.headline4),
          ),
          const SizedBox(
            height: 20,
          ),
          Column(
            children: [
              const Text('Search worker by:'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ChoiceChip(
                    label: const Text('ID'),
                    selected: _searchByIndex == 0,
                    onSelected: (value) {
                      setState(() {
                        _searchByIndex = 0;
                      });
                    },
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  ChoiceChip(
                    label: const Text('rarity'),
                    selected: _searchByIndex == 1,
                    onSelected: (value) {
                      setState(() {
                        _searchByIndex = 1;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Align(
            alignment: Alignment.center,
            child: Form(
              key: _formKey,
              child: Container(
                constraints: const BoxConstraints(maxWidth: 200),
                child: TextFormField(
                  decoration: InputDecoration(
                    floatingLabelStyle: TextStyle(
                        color: Theme.of(context).colorScheme.tertiary),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.yellow),
                    ),
                    contentPadding: const EdgeInsets.only(
                      top: 28,
                      left: 10,
                    ),
                    border: const OutlineInputBorder(),
                    label: _searchByIndex == 1
                        ? const Text('Enter rarity rank:')
                        : const Text('Enter Worker\'s ID:'),
                  ),
                  autofocus: false,
                  autocorrect: false,
                  keyboardType: TextInputType.number,
                  controller: _inputController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Value required';
                    }
                    if (value.contains(RegExp(r'[A-Za-z]'))) {
                      return 'Only numbers are allowed';
                    }
                    final int input = int.parse(value);
                    if (_searchByIndex == 1 && (input < 1 || input > 2222)) {
                      return 'Only rank between 1 and 2222';
                    } else if (_searchByIndex == 0 &&
                        (input < 0 || input > 2221)) {
                      return 'Only ID between 0 and 2221';
                    }
                    return null;
                  },
                ),
              ),
            ),
          ),
          Center(
            child: TextButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  String id = _inputController.text;
                  if (_searchByIndex == 1) {
                    if (_rarityDb.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Text('Sorry, search failed'),
                          backgroundColor:
                              Theme.of(context).errorColor.withOpacity(0.7),
                        ),
                      );
                      return;
                    }
                    id = _rarityDb[_inputController.text].toString();
                  }

                  request(id);
                  _inputController.clear();
                  final FocusScopeNode currentScope = FocusScope.of(context);
                  if (!currentScope.hasPrimaryFocus && currentScope.hasFocus) {
                    FocusManager.instance.primaryFocus?.unfocus();
                  }
                }
              },
              child: const Text('Submit'),
            ),
          ),
          // const SizedBox(
          //   height: 0,
          // ),
          if (_isLoading)
            Align(
              alignment: Alignment.center,
              // ignore: sized_box_for_whitespace
              child: Container(
                  width: 50,
                  height: 50,
                  child: const CircularProgressIndicator()),
            ),
          if (_nftLoaded)
            Column(
              children: [
                _workerTile,
                const SizedBox(
                  height: 5,
                ),
                Center(
                  child: IconButton(
                    iconSize: 30,
                    icon: const Icon(
                      Icons.save,
                    ),
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return WorkerCardToSave(
                              workerTile: _workerTile,
                              id: _workerNft.id,
                            );
                          });
                    },
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
