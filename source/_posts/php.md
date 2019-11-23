---
title: php 
---
---
<!--more-->
    <?php 
    //首先采用“fopen”函数打开文件，得到返回值的就是资源类型。
    $file_handle=fopen("/data/webroot/resource/php/f.txt","r");
    if ($file_handle){
        //接着采用while循环（后面语言结构语句中的循环结构会详细介绍）一行行地读取文件，然后输出每行的文字
        while (!feof($file_handle)) { //判断是否到最后一行
            $line = fgets($file_handle); //读取一行文本
            echo $line; //输出一行文本
            echo "<br />"; //换行
        }
    }
    fclose($file_handle);//关闭文件
    ?>

    error_reporting(0); //禁止显示PHP警告提示

    NULL（NULL）：NULL是空类型，对大小写不敏感，NULL类型只有一个取值，表示一个变量没有值，
    当被赋值为NULL，或者尚未被赋值，或者被unset()，这三种情况下变量被认为为NULL。

    定义常量：
    define("常量名",值);

    系统常量是PHP已经定义好的常量，我们可以直接拿来使用，常见的系统常量有：

    （1）__FILE__ :php程序文件名。它可以帮助我们获取当前文件在服务器的物理位置。

    （2）__LINE__ :PHP程序文件行数。它可以告诉我们，当前代码在第几行。

    （3）PHP_VERSION:当前解析器的版本号。它可以告诉我们当前PHP解析器的版本号，我们可以提前知道我们的PHP代码是否可被该PHP解析器解析。

    （4）PHP_OS：执行当前PHP版本的操作系统名称。它可以告诉我们服务器所用的操作系统名称，我们可以根据该操作系统优化我们的代码。

    constant()函数。它和直接使用常量名输出的效果是一样的，但函数可以动态的输出不同的常量，在使用上要灵活、方便，其语法格式如下：
    mixed constant(string constant_name)

    defined()函数可以帮助我们判断一个常量是否已经定义，其语法格式为：
    bool defined(string constants_name)

    字符串连接运算符是为了将两个字符串进行连接，PHP中提供的字符串连接运算符有：

    （1）连接运算符(“.”)：它返回将右参数附加到左参数后面所得的字符串。

    （2）连接赋值运算符(“.=”)：它将右边参数附加到左边的参数后。

    PHP中提供了一个错误控制运算符“@”，对于一些可能会在运行过程中出错的表达式时，我们不希望出错的时候给客户显示错误信息，这样对用户不友好。于是，可以将@放置在一个PHP表达式之前，该表达式可能产生的任何错误信息都被忽略掉；

    如果激活了track_error（这个玩意在php.ini中设置）特性，表达式所产生的任何错误信息都被存放在变量$php_errormsg中，此变量在每次出错时都会被覆盖，所以如果想用它的话必须尽早检查。

    需要注意的是：错误控制前缀“@”不会屏蔽解析错误的信息，不能把它放在函数或类的定义之前，也不能用于条件结构例如if和foreach等。

    在PHP中foreach循环语句，常用于遍历数组，一般有两种使用方式:不取下标、取下标。

    （1）只取值，不取下标

    <?php
    foreach (数组 as 值){
    //执行的任务
    }
    ?>
    （2）同时取下标和值

    <?php
    foreach (数组 as 下标 => 值){
    //执行的任务
    }
    ?>

    PHP5可以在类中使用__construct()定义一个构造函数，具有构造函数的类，会在每次对象创建的时候调用该函数，因此常用来在对象创建的时候进行一些初始化工作。

    class Car {
    function __construct() {
        print "构造函数被调用\n";
    }
    }
    $car = new Car(); //实例化的时候 会自动调用构造函数__construct，这里会输出一个字符串
    在子类中如果定义了__construct则不会调用父类的__construct，如果需要同时调用父类的构造函数，需要使用parent::__construct()显式的调用。

    class Car {
    function __construct() {
        print "父类构造函数被调用\n";
    }
    }
    class Truck extends Car {
    function __construct() {
        print "子类构造函数被调用\n";
        parent::__construct();
    }
    }
    $car = new Truck();
    同样，PHP5支持析构函数，使用__destruct()进行定义，析构函数指的是当某个对象的所有引用被删除，或者对象被显式的销毁时会执行的函数。

    class Car {
    function __construct() {
        print "构造函数被调用 \n";
    }
    function __destruct() {
        print "析构函数被调用 \n";
    }
    }
    $car = new Car(); //实例化时会调用构造函数
    echo '使用后，准备销毁car对象 \n';
    unset($car); //销毁时会调用析构函数
    当PHP代码执行完毕以后，会自动回收与销毁对象，因此一般情况下不需要显式的去销毁对象。

    静态属性与方法可以在不实例化类的情况下调用，直接使用类名::方法名的方式进行调用。静态属性不允许对象使用->操作符调用。

    class Car {
        private static $speed = 10;
        
        public static function getSpeed() {
            return self::$speed;
        }
    }
    echo Car::getSpeed();  //调用静态方法
    静态方法也可以通过变量来进行动态调用

    $func = 'getSpeed';
    $className = 'Car';
    echo $className::$func();  //动态调用静态方法
    静态方法中，$this伪变量不允许使用。可以使用self，parent，static在内部调用静态方法与属性。

    class Car {
        private static $speed = 10;
        
        public static function getSpeed() {
            return self::$speed;
        }
        
        public static function speedUp() {
            return self::$speed+=10;
        }
    }
    class BigCar extends Car {
        public static function start() {
            parent::speedUp();
        }
    }

    BigCar::start();
    echo BigCar::getSpeed();