### wymall
#### 简介
该设计为网易云音乐内容销售
#### 系统环境配置
- 安装JDK,配置环境变量
- 安装Tomcat，安装之前须安装好JDK
- 安装mysql
- 安装Navicat连接mysql数据库
- 安装maven对所要开发的项目集成管理
- 安装Git并创建仓库
- 安装FTP服务器，对本地上传图片进行管理
- 安装配置nginx,作为HTTP代理
#### 项目初始化
- IDEA配置MAVEN、JDK、Tomcat
- maven创建web项目
- 使用SSM框架并进行初始化配置，比如Mybatis-generator插件配置
- FTP服务器配置
- Google浏览器相关插件配置
### 根据相关要求进行数据表设计
- 根据业务逻辑及作业设计要求，将数据仓分为用户、商品、购物车、订单等几项
- 用户表设计考虑到角色权限
- 商品主要有商品id、价格、库存等信息
- 购物车与用户进行关联
- 订单与用户、商品进行关联
- 使用Navicat在mysql数据库中创建所有表单并利用mybatis插件生成pojo、xml等交互代码
- 数据仓sql脚本已放置于项目目录database下
### 前端设计
- 以网易云音乐的相关主题专辑作为内容进行销售，比如天空之城动漫音乐、毛不易歌曲合集等
- 根据作业要求，前端页面按功能进行分类、比如登录、购物车、主页、商品信息、订单、卖家发布等
- 以jsp为主，并结合css/js特性，对页面进行设计，所有.jsp文件均放在webapp下的jsp目录下
- 页面设计引用的少许图片在img目录下，css、js脚本都放在对应文件目录下
- 由于所有的商品图片都放在products目录下，FTP文件服务器的共享目录设置为此目录下
### 后端设计
- 后端按MVC模式对包结构进行设计，分为三层架构，采用SSM框架，分别是SpringMVC框架、Spring框架及Mybatis框架
- Controller包下分为前端portal、后端backend，前端根据业务逻辑分为购物车、订单、产品及用户四种控制器，后端由作业要求分为用户管理、商品管理两种控制器；同理可将Service层也按上述功能进行划分
- dao层与resources下xml文件共同形成与数据交互的代码，从数据库中读取的数据往往都放置在pojo对象中，pojo需要进一步封装成VO对象提供给service层调用
- Common目录下放置封装好的高复用的方法，util目录下放置一些公共类。
