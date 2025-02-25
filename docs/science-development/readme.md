# 简介

[原文] (https://chinese.freecodecamp.org/forum/t/topic/538)

“即使是做这些小变更也挺麻烦的”

“变更之后，软件功能出问题了”

“刚修复了这个 bug，却冒出来个新的”

“写的是冗余代码”

“代码过于复杂，不可能在这基础上添加新特性了”

“把这些代码扔掉重写”

上面这些话，你觉得熟悉吗？

每时每刻，在这个世界的各个角落，开发者们要么正说着这些话，要么正在思考这些问题，有的人甚至烦到想哭。这是为什么呢？

这些都是开发者经常谈到的话题，也是每个开发团队都会经历的阶段。

很多微不足道的小问题慢慢地、逐渐地威胁到开发者的项目。它们并没有在一开始就张牙舞爪，造成毁灭性的后果，绝大多数都是长期潜伏造成危害，可能一年甚至几年你都不会看到危害。所以，当有人提到他们时，大部分情况下听起来都是无害的。甚至当你运行它们的时候，一切看起来也很正常。但随着时间推移，尤其是小问题越积越多，项目的复杂性与日俱增，终有一天你会成为下一个人人皆知的“事故”的主角。

如果你想避免事故发生，那就应该深入学习软件的基本准则，逐渐养成开发者应具备的思维习惯。这可以帮助你在日常编程工作中更好地决策，让你开发的软件尽可能保持简洁，易于维护。

一个优秀开发者的思维习惯包括这些关键点：

1. 认真思考开发软件的目的

首先，你应该明确开发软件的目的。事实上，所有的软件都只有一个目的： 帮助人们 。

永远牢记：开发软件的目的不是为了展示你有多聪明。——卡纳特-亚历山大《简约之美：软件之道》
如果开发者不认真构思软件开发的目的，他们只能写出低级软件。何为低级软件？就是既无法给人们提供很多帮助，又很复杂的系统。

当你开发软件需要决策时，你应该牢牢记住这条准则——我们怎样才能提供帮助？你也这样来区分性能要求的优先级。

2. 明确软件设计的目标

每个程序员都是设计师。

如果一个软件开发或者修改起来很难，那么开发者仅仅为了让软件能运行起来就得花费大量时间，也就没办法关注如何帮助用户。软件设计目的是让开发者的工作尽可能简单，这样他们才可以关注真正重要的事情。你将开发出帮助用户的软件，并且你的软件会长时间地给用户提供帮助。

但是，如果你设计出糟糕的系统，软件的使用寿命将会极短。 这就是软件设计目标的重中之重：

设计出来的软件系统应该能让开发者快速完成开发并维护，这样软件系统才能——而且能——持续为用户提供帮助。——卡纳特-亚历山大《简约之美：软件之道》
两个关键点：设计需简洁，同时也要能给用户提供帮助。

3. 正确理解工作

如果开发者不能充分理解他们的工作，他们大概率会开发出复杂的系统，然后就陷入恶性循环：错误理解导致软件系统复杂，复杂又导致更多的误解，循环往复。

事实上，提升设计技能最好的方式之一就是确保完全了解软件系统，了解开发过程中用到的工具。

理解能力是区分优秀程序员和低级程序员的核心。——卡纳特-亚历山大《简约之美：软件之道》
低级程序员不理解他们正在做的工作，但是优秀程序员理解，事实就这么简单。

4. 保持简洁

至繁归于至简。——莱昂纳多·达·芬奇
编程把复杂过程简单化。低级的开发者没能做到简单化，而优秀的开发者则竭尽全力让其他程序员看到尽可能简洁的代码。

优秀开发者做出的软件易于理解，所以改 bug 的时候也容易。

现在的情况是，开发者大都比较聪明，他们不想让别人觉得自己是傻子。比较讽刺的是，这种想法让他们有时会开发出不够简洁的软件。

他们会这样想：别的开发人员都懂我做出的东西，那我应该写一些难一点、不好理解的代码，这样才能显得我非常聪明。

这就是思维方式有问题造成的错误——不一定是编程技能不够。编程过程中大多数失败都是因为这种想法。

炫耀你的聪明才智并不能帮助他人。

其他开发者刚看到你的代码的时候都不能理解，他们得花时间去理解。

所以，你应该这样问自己：我是想让大家理解我的代码，让他们高兴，还是想看他们疑惑不解、垂头丧气的样子？

事实是，如果你的代码对其他开发者来说易于理解，这说明你做得非常好。

大道至简。
问题是：“得做到多简洁才算简洁？”

答案是： 令人发指的简洁 。

5. 控制复杂度

控制复杂程度是计算机编程的本质。——布莱恩·柯林汉
很多软件失败的根源就是太复杂。起初，你要做的这个项目很简单，一个月就能完成。然后你提升了复杂度，项目周期增长到三个月。再然后你因为想实现其他目标而增加了特性。事情变得非常复杂，因为你无缘无故地增加了软件要实现的目的。这些追加任务需要六个月来完成。

但这还没有结束。

然后你把每个现有的功能变得更加复杂。这又需要九个月。然后，因为代码复杂，出现了很多 bug，那你就改 bug，但改的时候你没有考虑到这些改动会对其他部分造成什么样的影响。最后，哪怕是微小的变更也变得举步维艰。搞定一个 bug，却又出现新 bug。然后，你就成为了那些人们津津乐道的编程事故中的主角，不得不重写代码。

那么，你是怎样一步一步成为事故的受害者的？没人关心这个。你应该这样问：我怎样做才能避免成为编程事故的受害者？

很简单——首先，你应该确切地知道你开发的软件要实现什么样的功能以及软件的定义。其次，你写的每一部分代码都应该尽可能简洁。最后，讨论软件新增功能或变更需求时，你应该在现有的软件目的的基础上对新需求进行评估，并且提出问题。

作为一名开发者，对于不是必须的改变，你的首要反应应该是拒绝，这样你才能避免添加不必要的代码。但如果你被说服，软件确实需要变更，这时候你可以作出变更。

增加软件开发项目复杂度的因素有很多，上面列举的是最常见的。无论如何，你只需要遵循一条准则：

你的首要目标是把控复杂，而不是创造复杂。

6. 软件维护

软件开发过程中，维护十分重要。不幸的是，开发者通常都忽略了维护的重要程度。快速编程和产品快速成型看起来都比代码维护重要。而这也是他们犯错误的地方：忽略了日后的代码维护。 软件总要做出一些变更，你不仅需要实现这些变更，还需要长时间地维护。作为一名开发者，考虑日后的变更维护工作也是你的主要工作职责之一。

所有变更都需要维护。

简洁度和复杂度关乎代码维护工作量。软件的每部分代码有多简洁，那么维护起来就有多轻松。反之，每部分代码有多复杂，维护起来相应地就涉及到更多工作量。

关于代码维护你应该遵循的准则是：

减少维护代码的工作量比减少运行代码的工作量更重要。——卡纳特-亚历山大《简约之美：软件之道》
7. 保持一致

保持一致是保持简洁的重要部分。如果你在某个地方以某种方式做一件事情，那你在每个地方都要这么做。举个例子，如果你命名一个变量为 “thisIsVariable”，那你所有的变量都要这样命名（otherVariable，anAnotherVariable 等等这些都不可以）。

代码不一致，就会给理解增加难度。不要逼着其他开发者在看你的软件代码每一个部分的时候，都得重新学习一遍你的代码规范。

在任何团队运动中，最好的团队的队员之间总是保持一致，并且能碰撞出火花。——罗杰·斯陶巴

8. 优先级评测

开发软件需要做决策时，你怎么做的？

当你面对很多个有可能的方向，你怎么判断哪个方向最好？需要关注的是什么？你应该编写哪些特性？

以下三个要素会帮助你更好地决策，回答上面的问题。《简约之美：软件之道》这本书对这三个要素构成的等式有很好的解释：

做出变更的意愿度（D） ：你有多想做出变更？
变更的价值（V） ：这个变更会带来多少价值或者对你的用户有多少帮助？
做出变更需投入的精力（E） ：变更需要额外付出多少？
等式很简单：D=V/E

做出任何变更的意愿程度跟变更所能带来的价值成正相关，跟变更所需要的努力成负相关。

当你在区分工作的优先级时，你应该遵循这个准则：

选择那些”工作量小而价值高“的变更，而不是那些”工作量大而价值低“的变更。

9. 解决问题

第一步是理解。一定要知道问题是什么。很多问题之所以难，是因为你不理解它们。把你的问题写下来，并且尝试向别人解释。

如果你不能简洁地解释某些东西，那你就是不理解。——理查德·费曼
第二步是计划。先不要采取行动，行动可以先放放，给大脑留些时间来分析问题、处理信息，但也不要在计划上耗费太长时间。

三思而后行。

第三步是分解问题。不要试图一次性解决一个大问题，否则你会被一个庞大的问题给吓倒。把问题分解成一个个小问题，而后逐个击破，每解决一个小问题，你就完成了大问题上的一环。

10. 追求优秀即可

完美是优秀的敌人。——伏尔泰
不管是开始新项目或者在已有软件系统上增加新特性，开发者都倾向从一开始就把所有事项所有细节都计划得明明白白，想让第一版就完美。他们不是关注自己要解决什么问题，或者软件要怎样帮助大众，而是专注思考每个小细节，构思“如果怎么样，将会怎么样”这个问题，作出假设和预测。他们总是预测未来，沉迷于想象，太想让项目跟想象中一样完美。

事实上，他们不知道未来会发生什么，也不知道追求完美的代价有多高。

让我告诉你接下来会发生什么：

你会写不需要的代码
你会因为写的不需要的代码增加项目的复杂度
你会显得平庸，毫无特色
你会超出项目截止期限
你将处理由于复杂度带来的很多 bug
你想让这些发生吗？我觉得你不想。

那你应该做什么呢？

先写一个小产品，然后在其基础上改善和扩展。

你应该遵循增量设计法则。比如说，要设计一个计算器，你应该这么做：

设计一个只能做加法运算的系统
运行系统
改善现有系统设计，使它也可以做其他运算
设计减法运算，重复步骤 2 和 3
设计乘法运算，重复步骤 2 和 3
设计除法运算，重复步骤 2 和 3
11. 预测

预测只是事先设想未来会发生什么，它可能是基于事实和某种客观数据，也有可能是基于一种假设。
开发者面临着未来可能要改写代码这一事实，他们就试图设计一个非常通用的解决方案，（他们认为）这足以解决未来可能出现的任何情况。

方案太通用了就会包含很多不必要的代码。

你不可能准确预测未来，所以不管你的解决方案有多通用，它都不可能足以满足未来你会遇到的各种新要求。最可能的是，你所设想的未来永远都不会来，那你写的要解决未来问题的代码只会增加复杂度，让代码变更变得困难，最终成为可能毁掉你的软件的累赘。

不要预测未来，做到能解决当下的问题就好。

12. 假设

假设是什么？

假设是虽然你主观上认为这件事情是真的，但你并没有切实证据。

软件项目的杀手之一就是假设。我们一起来看看假设是如何毁掉一个项目的。

开发者知道，为了实现 X，他们得开发一个系统。然后他们想系统未来可能会要求他们做 Y，所以他们也做了 Y，写了成千上万行的代码来设计 Y。

后来，开发者发现当下的情况比之前他们假设的复杂得多，软件里面有很多不必要的代码。但是，因为每个部分都交织在一起，想把不必要的代码删除就非常麻烦。他们花了好几个月来重构代码，最终决定重写代码，这又要花费他们数月的时间。

要想避免这样的事故发生，你得遵循这个准则：

代码设计应该基于你现在所知道的情况，而非你所假设的未来会发生的情况。——卡纳特-亚历山大《简约之美：软件之道》
13. 不要重复造轮子

举个例子，如果在已经有一个完美的垃圾回收器存在的情况下，你要创造自己的垃圾回收器，你把本可以花在自己软件开发系统上的时间，花在了垃圾回收器上。

在以下几种情况下你也可以重复造轮子：

你需要的东西当前不存在
现有轮子的技术太差，或者不能满足你的需求
现有的轮子没有被维护好
这条准则很简单： 不要重复造轮子。

14. 拒绝

作为一名开发者，你对变更需求的第一反应应该是“不”。

要拒绝增加更多的代码、更多的性能，除非对方让你相信这些要增加的代码是必须的。不必要的变更会增加软件的缺陷。

你如何知道这些变更是必须的呢？

返回去思考你开发软件的目的，想想区分优先级的那个等式。

From: rsc@plan9.bell-labs.com (Russ Cox)Subject: Re: [9fans] design clairvoyance & the 9 way 来自： rsc@plan9.bell-labs.com (洛斯 考克斯)回复主题：设计透视
Date: Thu, 8 May 2003 04:05:31 GMT 日期：2003 年 5 月 8 日 星期四 04：05：31 格林威治时间
> What does tomorrow's unix look like? 明天 Unix 系统会是什么样子？
I'm confident that tomorrow's Unix will look like today's Unix, only cruftier. 我相信跟今天差不多，甚至更糟。
Russ 洛斯
15. 自动操作

不要在重复性工作上浪费你的时间，设定好就不要管他们了，你睡觉的时候他们也可以继续运转。当你意识到你在重复做某些事情时，请记住这个准则：

如果可以自动操作，就让它自动操作。

16. 代码评估

按照代码行数估量编程进度就像按照重量估量飞机建造进度。——比尔·盖茨
我发现有些开发者通过代码行数估量他们的软件质量，他们觉得代码行数越多，意味着他们做的工作很好。软件包含数十万行代码，这说明他们开发的软件特别宏大。

但问题来了：软件是真的大？还是有些地方出错了？

答案是，非常有可能是设计的某个方面出了问题。大多数简便的解决办法都不需要太多代码，你只需要简洁的代码，就能解决问题。

但我并不是说，代码总是越少越好。当你想多写点代码时，你总是很容易写出很聪明但别人很难理解的代码。你应该找到一个平衡。

最合适的代码是：代码不多，同时也易于理解，易于阅读。

17. 工作效率

你如何估测你的工作效率？

是通过写代码的行数还是删代码的行数？

你的主要目标应该是，让你的代码库尽可能的小。问题不是“我怎样才能写出更多的代码”，而是“我怎样才能删掉更多的代码”。

工作效率最高的一天，我删掉了 1000 行代码。——肯·汤普逊
18. 测试

什么时候你才能把记录和错误处理加到项目里面？

起初你就应该把记录加进项目里，这会及早帮你发现问题，节约时间。

我发现在测试代码时会出现很多问题。我给你举个例子，有两种情况： 一个简单的条件语句块，输入内容进入 if 语块，开发者把输入的内容给到软件，然后开发者测试语句，把代码传给源码控制，测试就算完成。那 else 语块呢？结果就是，软件在实际操作过程中，出现了大量错误。所以，在测试代码时，至少应该把所有的代码全部测试一遍。测试过程也要先局部，再整体。

有 bug 的时候，首先你应该让 bug 重现。你不能猜测 bug 的来源，然后按照你的猜测修补 bug，因为大部分情况下你都会犯错。你应该查看 bug 的来源，然后有的放矢。

你得是个可靠的成员，让团队中其他开发者看到你在源码控制中增添新代码时，都知道你的代码时经过测试的，是没问题的。

未经测试的代码就是无效代码。

19. 适当评估

开发者需要正确评估项目难度。

通常他们都会低估项目的难度，而不是高估。他们会觉得这只是一小段代码或者只是一个简单的特性，低估工作量和所需时间，结果，项目就延期了。

分解任务，任务越小，评估起来就越容易。虽然你还是有可能评估错误，但相对于直接评估一个大项目，评估小项目的犯错概率会小很多。

记住：

做任何事情所需的时间都比你想象的要多。

20. 避免重写代码

我相信，如果你遵循本文提到的软件开发准则，你不会有需要重写代码的时候。但是，如果你真的犯了错，发现自己要考虑重写代码时，你应该知道：

在大多数情况下，重写代码是开发者的异想天开，而不是解决办法。

为什么是异想天开？

因为，比起写代码，读代码更困难。这也是为何复用代码如此困难，为何我们在读其他开发者写的代码时，下意识会告诉我们，“扔掉这些，自己重新写”。

有很多情况会让你考虑从头开始写代码，你可以看看这些情况。但是，我还是有个忠告给你：

代码重构应该是第一选择。

21. 说明和注释

一个关于注释的误解是“开发者补充注释是要说明代码运行的目的是什么”，这是不对的。代码应该很容易理解，否则，就说明代码不易于阅读，还可以更简洁。

如果代码实在简洁不了，那就需要你加一些注释来解释为什么是这样。

注释的根本意图在于解释你为什么要这样写代码，而不是解释代码是做什么。如果你没有解释，其他的程序员可能就会迷惑不解，他们改写你的代码时，很可能就会改掉其中的重要部分。

注释是为了解释为什么这样写，而非解释写的是什么。

另一方面是写文档来阐述软件的设计结构、每个模块、每个组成部分，这非常重要，需要你站在更高的角度来审视软件。一份文档可以帮助新加入到团队中的开发者快速整体理解软件代码。如果开发者对软件的其他部分一无所知，他们在做自己负责部分的工作时很可能会犯错，还可能影响到其他部分。

22. 选对技术（比如：工具，库）

首先，牢记这条准则：

不要依赖外部技术，或者说，尽可能减少对它们的依赖。

为何？因为外部技术是提升项目复杂度的另一个原因，它们可能毁掉你正在开发的东西，把一切变得更为复杂。如果你太依赖外部技术，那么你本身就是受限制的。如果技术本身就有一个大 bug 怎么办？你还得等他们的开发者把 bug 修复好才行。但如果你的项目核心就使用到了这个有 bug 的技术，那你可就束手无策了，可谓举步维艰。因此，为项目挑选适合的技术变得尤为重要。

在你开始使用某项技术时，你应该考虑如下几个因素：

技术背后的开发是否积极？
技术的维护工作会持续进行吗？
抛开这个技术转向其他技术容易吗？
开发者社区对它评价如何？
如果你可以很好地回答这些问题，那就降低了选到不合适技术的风险。

23. 自我发展

不断学习，多尝试不同的编程语言和编程工具，阅读与软件开发相关的书籍，这些能提供给你另一种角度。每天一点小小的提升都会给你的知识和技能带来实质性影响。

思维开阔，不要太沉迷某个技术，要用真正需要的技术解决某个特定的问题，不要做类似于比较 Microsoft 和 Linux 的无用讨论。

要知道，每个特定问题都有特定的解决办法。

24. 远离个人英雄主义

在大多数情况下，适时放弃是一件好事。

举个例子，你觉得你可以在两个小时以内完成某个任务，但是，四个小时过去了，你还是只进行了四分之一。你的直觉反应是：我不能放弃，我都已经花了四个小时了。所以你继续发扬不撞南墙不回头的精神，发誓要完成任务。但很尴尬的是，任务好像就是完不成。你沉浸在自己的世界里，一心就想完成任务。

不要执念太深，懂得及时止损，记得及时求助。

25. 不要立即提问，适时求助

当你要执行某个任务，但你不确定解决办法是什么，不要问别人你应该怎么做，至少不要遇到问题就立马问，而是要尝试你能想到的所有解决办法——这很重要，要跳出你所熟知的概念或语言的舒适圈。

当你自己实在想不出解决办法时，善用搜索工具！找到答案就大胆尝试，修改这些答案，看看能不能理解为什么这样做就可行，并把这些加入到自己的代码库中。

但是，寻求别人的建议也是很好的。

在你尽力尝试，找到了可行的解决办法之后，你去寻求一下别人的建议，让同事或者有经验的开发者看看你的代码有没有问题。
