import 'package:flutter/material.dart';
import 'package:flutter_ex/data_provider/database.dart';
import 'package:flutter_ex/shimmers/list_shimmer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Exchange extends ConsumerWidget {

  @override
  Widget build(BuildContext context, watch) {
    final data = watch(rateProvider);
    return Scaffold(
        body: Container(
          child: data.when(
              data: (data){
            return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) => ListTile(
                  leading: Text(data[index].currency.unit.toString()),
                  title: Text(data[index].currency.name),
                  subtitle: Text('sell: ${data[index].sell}'),
                  trailing: Text('buy: ${data[index].buy}'),
                ));
          },
              loading: () => ListShimmer(),
              error: (err, stack) => Center(child: Text('$err'))),

        )
    );
  }
}
