import 'package:flutter/material.dart';

import 'widgets/info/messageBar_card.dart';

class BaseViewsMethods{

  static void showViewModelsMessage(dynamic genericViewModel, BuildContext context){
    if (genericViewModel.messageInfo != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showMessageBar(
          context: context,
          error: genericViewModel.messageInfo!['error'],
          icon: genericViewModel.messageInfo!['icon'],
          content: genericViewModel.messageInfo!['content'],
        );
        genericViewModel.clearError();
      });
    }
  }

}
class BaseViewModel extends ChangeNotifier{

  // Geral

  Future<void> tryCatchWrapper(Future<void> Function() asyncFunction) async {
    setLoading(true);
    try {
      await asyncFunction();
    }
    catch (e) {
      setMessage(data: {
        'icon': Icons.error,
        'content': e.toString(),
        'error': true,
      });
    }
    finally {
      setLoading(false);
    }
  }

  // Carregamento

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  // Mensagens

  Map<String, dynamic>? _messageInfo;
  Map<String, dynamic>? get messageInfo => _messageInfo;

  void setMessage({required Map<String, dynamic> data}) {
    _messageInfo = {
      'icon': data['icon'],
      'content': data['content'],
      'error': data['error'],
    };
    notifyListeners();
  }

  void clearError() {
    _messageInfo = null;
    notifyListeners();
  }

}
