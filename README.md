# MVVM-without-binding
最近在学习框架相关内容，对程序猿题库分享的架构比较感兴趣，所以尝试按照这种架构思路，实现swift版本的demo  

## 总结
1.架构图：

2.目标：

- 解耦ViewController和View，ViewModel负责将业务数据和样式数据装配给View，View负责绘制洁面
- 解耦ViewController和Model，DataController负责组织加工业务数据，接收ViewController的请求，Model负责基础数据处理（网络层、持久成等）
- ViewController瘦身，ViewController只负责调度业务数据，装配ViewModel，以及接受UI事件
- 粒度自控

3.要点：

ViewModel

先来看右边视图相关的部分，传统的 MVC 当中 ViewController 中有大量的数据展示和样式定制的逻辑，我们引入 MVVM 中 ViewModel 的概念，将这部分视图逻辑移到了 ViewModel 当中。

在这个设计中，每一个 View 都会有一个对应的 ViewModel，其包含了这个 View 数据展示和样式定制所需要的所有数据。同时，我们不引入双向绑定机制或者观察机制，而是通过传统的代理回调或是通知来将 UI 事件传递给外界。而 ViewController 只需要生成一个 ViewModel 并把这个装配给对应的 View，并接受相应的 UI 事件即可。

这样做有几个好处：首先是 View 的完全解耦合，对于 View 来说，只需要确定好相应的 ViewModel 和 UI 事件的回调接口即可与 Model 层完全隔离；而 ViewController 可以避免与 View 的具体表现打交道，这部分职责被转交给了 ViewModel，有效的减轻了 ViewController 的负担；同时我们弃用了传统绑定机制，使用了传统的易于理解的回调机制来传递 UI 事件，降低了学习成本，同时使得数据的流入和流出变得易于观察和控制，降低了维护了调适的成本。

DataController

接下来我们关注 Model 和 VC 之间的关系。如之前提到，在传统的 MVVM 中，ViewModel 接管了 ViewController 的大部分职责，包括数据获取，处理，加工等等，导致其很有可能变得臃肿。我们将这部分逻辑抽离出来，引入一个新的部件，DataController。

ViewController 可以向 DataController 请求获取或是操作数据，也可以将一些事件传递给 DataController，这些事件可以是 UI 事件触发的。DataController 在收到这些请求后，再向 Model 层获取或是更新数据，最后再将得到的数据加工成 ViewController 最终需要的数据返回。

这样做之后，使得数据相关的逻辑解耦合，数据的获取、修改、加工都放在 Data Controller 中处理，View Controller 不关心数据如何获得，如何处理，Data Controller 也不关心界面如何展示，如何交互。同时 Data Controller 因为完全和界面无关，所以可以有更好的测试性和复用性。

DataController 层和 Model 层之间的界限并不是僵硬的，但需要保证每一个 ViewController 都有一个对应的 DataController。Data Controller 更强调的是其作为业务逻辑对外的接口。而在 DataController 中调用更底层的 Model 层逻辑是我们推荐的编程范式，例如数据加工层，网络层，持久层等。

4.Show the code
GitHub地址：https://github.com/HyperBunny/MVVM-without-binding

5.参考文章：
http://gracelancy.com/blog/2016/01/06/ape-ios-arch-design/
