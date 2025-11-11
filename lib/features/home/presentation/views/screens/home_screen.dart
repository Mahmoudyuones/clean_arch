import 'package:clean_arch/config/di/di.dart';
import 'package:clean_arch/features/home/presentation/view_model/home_events.dart';
import 'package:clean_arch/features/home/presentation/view_model/home_states.dart';

import 'package:clean_arch/features/home/presentation/view_model/view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final HomeViewModel viewModel = getIt<HomeViewModel>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeViewModel>(
      create: (context) => viewModel..doIntent(GetAllDataEvent()),
      child: Scaffold(
        body: Center(
          child: SizedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("products 1"),
                BlocBuilder<HomeViewModel, HomeState>(
                  builder: (context, state) {
                    if (state.product1State?.errorMessage != null &&
                        state.product1State!.errorMessage!.isNotEmpty) {
                      return Text(state.product1State!.errorMessage!);
                    } else if (!(state.product1State?.isLoading! ?? false) &&
                        state.product1State?.data != null &&
                        state.product1State!.data!.isNotEmpty) {
                      return SizedBox(
                        height: 100,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: state.product1State!.data!.length,
                          itemBuilder: (context, index) {
                            return Container(
                              width: 150,
                              margin: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Center(
                                child: Text(
                                  state.product1State!.data![index].name,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    } else if (!(state.product1State?.isLoading ?? false) &&
                        state.product1State?.data != null &&
                        state.product1State!.data!.isEmpty) {
                      return Text("No Data");
                    } else {
                      return CircularProgressIndicator();
                    }
                  },
                ),
                Text("products 2"),
                BlocBuilder<HomeViewModel, HomeState>(
                  builder: (context, state) {
                    if (state.errorMessage2 != null &&
                        state.errorMessage2!.isNotEmpty) {
                      return Text(state.errorMessage2!);
                    } else if (!state.isLoadingProduct2 &&
                        state.productsList2.isNotEmpty) {
                      return SizedBox(
                        height: 200,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: state.productsList2.length,
                          itemBuilder: (context, index) {
                            return Container(
                              width: 150,
                              margin: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Center(
                                child: Text(
                                  state.productsList2[index].name,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    } else if (state.isLoadingProduct2) {
                      return CircularProgressIndicator();
                    }
                    return Text("Initial State");
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
