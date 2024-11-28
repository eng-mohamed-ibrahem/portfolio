import 'dart:html' as html;

/// This class provides a simple mixin for persisting state to the local storage of the users browser.
///
/// The state is stored as a key-value pair in the local storage of the users browser.
///
/// The [saveState] method takes a key and a value and saves the value to the local storage under the key.
///
/// The [loadState] method takes a key and returns the value associated with the key from the local storage.
///
/// If the key is not found in the local storage, [loadState] will return null.
mixin StatePersisteMixin {
  void saveState({required String key, required String value}) {
    html.window.localStorage[key] = value;
  }

  String? loadState(String key) {
    return html.window.localStorage[key];
  }
}
