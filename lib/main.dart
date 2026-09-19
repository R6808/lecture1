// ============================================================================
// 文件名：main.dart
// 位置：lecture1/lib/main.dart   （Flutter 应用的入口文件，本课要求逐行注释）
// 课程：移动应用软件开发实训 · 第 1 课 · HelloWorld 案例复现
// 说明：本文件是 flutter create 生成的标准模板，由本人逐行加注中文说明。
//       标注规则：「AI辅助」= 注释由 AI 起草、本人核对确认；「本人」= 独立完成。
// ============================================================================

// 导入 Flutter 的 Material Design 组件库。
// 这个 import 把 Material 全家桶带进来：MaterialApp、Scaffold、AppBar、
// ThemeData、Icons、Colors 等，都是下面要用到的类。
// 若改 import 'package:flutter/cupertino.dart'; 则是 iOS 风格组件库。
import 'package:flutter/material.dart';

// main() 是所有 Dart 程序的入口函数，Flutter 应用也不例外。
// 程序启动后，运行环境（手机 / 浏览器 / 桌面）会自动调用它。
// void：不返回任何值；返回类型必须写，Dart 是强类型语言。
void main() {
  // runApp 是 Flutter 框架提供的顶层函数，作用是「把一棵 Widget 树挂到屏幕上」。
  // 它的参数是整棵界面树的根组件，这里传的是 MyApp 的实例。
  // const：MyApp 的构造是编译期常量，加 const 可以让这个对象被复用而不是每次重建，
  //        是 Flutter 里最常见的性能小优化（第 9 课会讲「为什么 const 能减少重建」）。
  runApp(const MyApp());
}

// MyApp 是应用的根组件。它继承 StatelessWidget ——「无状态组件」：
// 自身不保存会变化的数据，界面画成什么样只取决于传进来的构造参数。
// 本课只需要建立印象：Flutter 里「一切界面元素都是 Widget」，
// 连整个应用本身也是一个 Widget（MyApp）。
class MyApp extends StatelessWidget {
  // 构造函数。
  // const MyApp({super.key}) 的写法拆开看有三层含义：
  //   1) MyApp()        —— 构造一个 MyApp 对象；
  //   2) {super.key}    —— 命名参数 key，直接转交给父类 StatelessWidget；
  //   3) super.key 里的 key 是 Widget 的身份标识，框架靠它判断「重建前后是不是同一个组件」，
  //      从而决定复用还是重建（第 5 课展开）。
  // 这里 { } 是「命名参数」语法，第 2 课的重点之一。
  const MyApp({super.key});

  // build 方法是每个 Widget 都必须实现的方法：
  // 它负责「描述这个组件长什么样」，返回一棵描述界面的 Widget 子树。
  // 注意：build 会被调用很多次，所以里面不要放耗时操作。
  // @override 注解表示这里重写了父类 StatelessWidget 的 build。
  @override
  Widget build(BuildContext context) {
    // MaterialApp 是 Material 风格应用的「总装配」组件。
    // 它不是界面本身，而是提供一整套应用级配置的容器：
    // 主题、路由表、语言本地化、标题等，由它统一向下传递给所有子组件。
    // context：BuildContext，表示「当前组件在整棵组件树中的位置」，
    //          组件靠它向上查找主题、尺寸等祖先信息（第 5、6 课重点）。
    return MaterialApp(
      // title：应用在系统任务切换器 / 浏览器标签页里显示的名字。
      // 注意它不显示在界面上方的标题栏里，标题栏由下面的 AppBar 负责。
      title: 'Flutter Demo',
      // theme：应用主题。ThemeData 描述配色、字体、控件默认样式。
      // 这里用 Colors.deepPurple 作为种子色生成一整套 Material 3 配色方案。
      // ColorScheme.fromSeed 是 Material 3 推荐做法：给一个种子色，自动推导出协调的整套颜色。
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      // home：应用启动后显示的第一个页面（首页）。
      // 这里放的是 MyHomePage 组件——所以「首页」= MyHomePage，
      // 页面级组件命名习惯上以 Page 结尾。
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

// MyHomePage 是首页组件，继承 StatefulWidget ——「有状态组件」。
// 为什么它必须有状态？因为这个计数器页面里的数字 _counter 会随点击变化，
// 而「会变化的数据」在 Flutter 里必须放进 State 对象里管理。
// 记忆点：StatelessWidget = 只画一次，StatefulWidget = 数据变了能重画。
class MyHomePage extends StatefulWidget {
  // 构造函数：title 是外部（MyApp）传进来的标题文字。
  // required 表示这个命名参数必填，漏掉是编译错误（第 2 课重点）。
  const MyHomePage({super.key, required this.title});

  // title 字段。final 表示「运行时确定一次，之后不可变」。
  // Widget 的属性都应该是 final —— 组件不可变，才能被框架安全地复用和比较。
  final String title;

  // createState 是 StatefulWidget 的约定方法：
  // 框架首次插入这个组件时调用它，返回与之绑定的 State 对象。
  // 注意这里返回的是 _MyHomePageState（带下划线），而不是 MyHomePage 自己。
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// State 类：真正存放「会变化的数据」和「界面怎么画」的地方。
// 开头的下划线 _ 表示「库私有」——外部文件访问不到，这是 Dart 的可见性规则
// （Dart 没有 private 关键字，用下划线前缀表达）。
// State<MyHomePage> 的泛型表示「我是 MyHomePage 这个组件的状态」，
// 所以在 State 里可以用 widget.title 访问到上面那个不可变的 title。
class _MyHomePageState extends State<MyHomePage> {
  // 计数器变量。int 是内置数值类型。初始值 0。
  // 这个变量就是「状态」：它一变，界面上的数字就要跟着变。
  int _counter = 0;

  // 自定义方法：把计数器加一。
  // void 无返回值；方法名 _incrementCounter 同样带下划线（库私有）。
  void _incrementCounter() {
    // setState 是 State 类提供的关键方法，作用是：
    //   1) 把我下面改动的数据登记为「已变化」；
    //   2) 通知框架「这个组件需要重新执行 build」。
    // 直接写 _counter++ 而不调用 setState，数值确实会变，
    // 但界面不会刷新 —— 这是初学者最常见的「点了没反应」原因。
    setState(() {
      // 真正修改状态的地方。框架会在回调执行完后重新调用下面的 build()。
      _counter++;
    });
  }

  // 又一次 build：这里描述的是「首页长什么样」。
  @override
  Widget build(BuildContext context) {
    // Scaffold 是「页面骨架」组件，提供 Material 页面的标准布局槽位：
    // appBar（顶部标题栏）、body（主体内容）、floatingActionButton（右下浮动按钮）等。
    // 每个独立页面通常最外层就是一个 Scaffold。
    return Scaffold(
      // AppBar：顶部标题栏。title 用的是从 widget 拿到的 title。
      // widget 这个属性是 State 提供的，指向与它绑定的那个 MyHomePage 实例。
      appBar: AppBar(
        // 这里没写 const，因为 widget.title 是运行时值，无法在编译期确定。
        title: Text(widget.title),
      ),
      // body：页面主体区域。
      // Center 让它的子组件在水平和垂直方向都居中。
      body: Center(
        // Column 是纵向排列容器：把子组件从上到下依次摆放。
        // mainAxisAlignment: center 表示「主轴（纵向）居中」。
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // children 是一个 Widget 列表，注意末尾的逗号 ——
          // Dart 格式化时会保留多行写法，便于阅读和后续增删。
          children: <Widget>[
            // const Text：文字内容固定不变，所以可以加 const。
            const Text('You have pushed the button this many times:'),
            // 显示计数值的文字。'$_counter' 是字符串插值：
            // $变量名 会把变量的值直接嵌进字符串（第 2 课重点）。
            // style 用主题里的大标题样式，字号更大更醒目。
            // 每次 setState 后这个 Text 会用新的 _counter 重建，所以数字会刷新。
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      // floatingActionButton：右下角的圆形浮动按钮（Material 的标志性控件）。
      // onPressed 是点击回调 —— 函数在 Dart 里是一等公民，可以直接当参数传（第 2、3 课重点）。
      // 这里传的是上面定义的 _incrementCounter，注意没有加括号：
      // 加括号是「立即调用并把返回值传进去」，不加括号才是「把函数本身作为回调交给框架」。
      // tooltip 是长按 / 悬停时显示的提示文字，也用于无障碍朗读。
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        // const Icon：加号图标，内容固定所以可以 const。
        child: const Icon(Icons.add),
      ), // 这个逗号让格式化工具把它和上面的参数对齐排版
    ); // Scaffold 结束
  } // build 结束
} // _MyHomePageState 结束
