
typedef void EventCallback(arg);

class EventBus {
  // 创建一个私有构造函数
  EventBus._internal();

  // 保存一个单例
  static final _singleton = EventBus._internal();

  // 工厂构造函数
  factory EventBus() => _singleton;

  var _emap = new Map<Object, List<EventCallback>>();

  on(eventName, EventCallback f) {
    if (eventName == null || f == null) return;
    _emap[eventName] ??= new List<EventCallback>();
    _emap[eventName].add(f);
  }

  off(eventName) {
    if (eventName == null) return;
    _emap.remove(eventName);
  }


}
