import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/person_model.dart';
import '../../utils/app_router.gr.dart';
import '../../utils/app_settings.dart';
import '../widgets/responsive_main_screen_widget.dart';
import 'admin_provider.dart';

class WhereIsMyMoney extends StatelessWidget {
  const WhereIsMyMoney({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Where is my money?',
          style: TextStyle(fontSize: 60),
        ),
      ),
    );
  }
}

@RoutePage()
class AddAdminScreen extends StatefulWidget {
  const AddAdminScreen({super.key});

  @override
  State<AddAdminScreen> createState() => _AddAdminScreenState();
}

class _AddAdminScreenState extends State<AddAdminScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) async {
        await showDialog<String>(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('Авторизация'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller:
                      Provider.of<AdminProvider>(context).loginController,
                  decoration: const InputDecoration(
                    labelText: 'E-mail',
                  ),
                ),
                TextField(
                  controller:
                      Provider.of<AdminProvider>(context).passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Пароль',
                  ),
                ),
              ],
            ),
            actions: <Widget>[
              TextButton(
                onPressed: Provider.of<AdminProvider>(context).authEnable
                    ? () {
                        Provider.of<AdminProvider>(context, listen: false)
                            .auth()
                            .then(
                          (value) {
                            if (value) {
                              Navigator.pop(context);
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  backgroundColor: Colors.red,
                                  content: Text('Ошибка авторизации'),
                                ),
                              );
                            }
                          },
                        );
                      }
                    : null,
                child: const Text(
                  'Войти',
                  style: TextStyle(color: Color(0xf0A65200)),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final watcher = Provider.of<AdminProvider>(context);
    final reader = Provider.of<AdminProvider>(context, listen: false);
    final appReader = Provider.of<AppSettings>(context, listen: false);

    if (watcher.isExists != null) {
      return ResponsiveMainScreenWidget(
        title: 'Список администраторов',
        listData: watcher.admins,
        addElement: reader.addAdmin,
        onDeleteElement: reader.onRemove,
        controller: watcher.adminController,
        isStudent: false,
        onTapCard: (PersonModel value) {
          appReader.setupAdmin(value);
          AutoRouter.of(context).push(const AddTeacherRoute());
        },
      );
    } else {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
  }
}
