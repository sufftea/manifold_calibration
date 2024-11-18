class Context {
  bool get done => _done;
  bool _done = false;

  Context._();

  static (void Function() cancel, Context ctx) withCancel() {
    final ctx = Context._();

    return (ctx._cancel, ctx);
  }

  void _cancel() {
    _done = true;
  }
}
