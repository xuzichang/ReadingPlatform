# ReadingPlatform
中文阅读平台，部分模仿废文网。

 [ReadingPlatform](#readingplatform)
   [一、功能模块设计](#一功能模块设计)
   [二、实现效果](#二实现效果)
   [三、系统实现](#三系统实现)
## 一、功能模块设计

<div align=center><img src="https://github.com/xuzichang/ReadingPlatform/blob/master/ImgForReadme/01.png" text-align="center" height="200"/><img src="https://github.com/xuzichang/ReadingPlatform/blob/master/ImgForReadme/02.png" text-align="center" height="300"/>
  </div>
 <p align="center" >图1-1 功能模块设计</p>
 
### 1. 用户管理模块
> *   用户注册：该模块主要提供用户注册功能。用户使用本系统需进行身份审核。游客必须先注册，将个人的信息存储到平台的数据库中，以成为平台的正式用户。未注册用户无身份认证，将无法访问平台内容。系统提供邮箱邮件方式注册。用户输入邮箱地址，系统发送包含验证码的邮件至注册邮箱。用户获取验证码后，填写完整个人信息，经系统校验通过即可注册成功，成为正式用户。
> *  用户登录：该模块主要提供用户登录功能。用户使用个人注册的邮箱帐号和密码可登录中文阅读平台。系统对用户的帐号与密码进行校验，提供“记住密码”功能。记住密码功能通过Cookie进行设置。
> *  用户访问控制：该模块主要提供用户访问控制功能。用户在未登录时，无法访问平台具体内容。
> *  用户注销模块：该模块主要提供用户注销功能。用户在登录后，选择注销，将销毁session。
> *  个人中心模块：该模块主要提供用户个人信息，发表的小说、主题贴等信息显示。
### 2. 浏览模块
该模块主要提供用户浏览平台内容功能，如阅读小说章节内容，查看主题贴等。系统将用户发表的小说和主题贴进行分类，用户可在首页直接进入，也可在具体Tab页对小说、主题帖进行浏览。在浏览小说时，用户可选择该小说的具体章节进行查看。
### 3.发表模块
> *  小说发表模块：该模块主要提供用户发表小说功能。用户可在导航栏下拉框中选择“发表小说”进行发表。系统根据用户提交信息，对小说标题唯一性进行验证，验证通过即可创建小说。创建成功后，将显示该小说页面。
> *  章节发表模块：该模块主要提供用户发表小说章节功能。采用MySQL数据库结合WangEditor富文本编辑器，用户可在网页输入章节内容，提交后将显示新增章节。
> * 主题帖发表模块：该模块主要提供用户发表主题帖功能。本模块采用MySQL数据库结合Markdown，实现所见即所得，用户可以预览输入内容。
### 4.编辑模块
> * 小说简介编辑模块:该模块主要提供用户修改小说简介功能。在个人中心，用户可选择小说进入小说页，点击“编辑书籍”。用户可对小说信息进行编辑修改。
> * 章节编辑模块：该模块主要提供用户编辑小说章节功能。点击编辑即可对本章节进行编辑。
### 5.删除模块
> * 小说删除模块：该模块主要提供用户删除小说功能。点击删除小说即可删除小说，使用软删除。
> * 章节删除模块：该模块主要提供用户删除小说章节功能。点击删除章节即可删除本章节，使用软删除。
### 6. 查询模块
该模块主要为用户提供文章的查询功能，用户可进行文本框输入模糊查询和标签选择查询。
### 7. 编辑推荐模块
该模块主要为用户提供编辑精选小说。
### 8. 手气不错模块
该模块主要提供随机章节显示功能，增加用户平台体验。点击导航栏中“手气不错”，系统将随机为用户提供小说章节内容的阅读。

## 二、实现效果
<div align=center><img src="https://github.com/xuzichang/ReadingPlatform/blob/master/ImgForReadme/03.png" height="200"/>
  <img src="https://github.com/xuzichang/ReadingPlatform/blob/master/ImgForReadme/04.png" height="300"/></div>
 <p align="center" >图2-1 登录注册页</p>
 
 <div align=center><img src="https://github.com/xuzichang/ReadingPlatform/blob/master/ImgForReadme/05.png" height="300"/></div>
 <p align="center" >图2-2 首页</p>
 
 <div align=center><img src="https://github.com/xuzichang/ReadingPlatform/blob/master/ImgForReadme/08.png" height="170"/></div>
 <p align="center" >图2-3 动态</p>
 
 <div align=center><img src="https://github.com/xuzichang/ReadingPlatform/blob/master/ImgForReadme/09.png" height="300"/></div>
 <p align="center" >图2-4 文库</p>
 
 <div align=center><img src="https://github.com/xuzichang/ReadingPlatform/blob/master/ImgForReadme/22.png" height="150"/></div>
<p align="center" >图2-5 个人中心</p>

 <div align=center><img src="https://github.com/xuzichang/ReadingPlatform/blob/master/ImgForReadme/06.png" height="170"/></div>
 <p align="center" >图2-6 查询结果</p>
 
<div align=center><img src="https://github.com/xuzichang/ReadingPlatform/blob/master/ImgForReadme/10.png" height="300"/></div>
<p align="center" >图2-7 标签搜索</p>

<div align=center><img src="https://github.com/xuzichang/ReadingPlatform/blob/master/ImgForReadme/12.png" height="400"/></div>
<p align="center" >图2-8 小说简介</p>

<div align=center><img src="https://github.com/xuzichang/ReadingPlatform/blob/master/ImgForReadme/13.png" height="300"/></div>
<p align="center" >图2-9 小说阅读</p>

<div align=center><img src="https://github.com/xuzichang/ReadingPlatform/blob/master/ImgForReadme/14.png" height="150"/></div>
<p align="center" >图2-10 主题贴查看</p>

 <div align=center><img src="https://github.com/xuzichang/ReadingPlatform/blob/master/ImgForReadme/07.png" height="200"/></div>
 <p align="center" >图2-11 发表题头</p>
 
<div align=center><img src="https://github.com/xuzichang/ReadingPlatform/blob/master/ImgForReadme/15.png" height="300"/></div>
<p align="center" >图2-12 发表小说</p>

<div align=center><img src="https://github.com/xuzichang/ReadingPlatform/blob/master/ImgForReadme/18.png" height="300"/></div>
<p align="center" >图2-13 创建小说新章节</p>

<div align=center><img src="https://github.com/xuzichang/ReadingPlatform/blob/master/ImgForReadme/21.png" height="400"/></div>
<p align="center" >图2-14 发表主题帖</p>

## 三、系统实现
### 1. 用户注册
①发送验证码采用Ajax请求发送。
```
$.ajax({
    url : "servlet/SendMailServlet",  //发送请求
    type : "post",
    data : {
        "email" : email
    },
    success : function(result) {
        sms = result;
        document.getElementById("spInfo").innerText = sms;
    }
});
```
②创建Toolbean配置邮件发送。

③结合数据库查询，判断注册邮箱是否已被注册，未被注册再进行邮件发送。
```
if (email.equals(list.get(i).getUserId()))    flag = true; //邮箱已被注册
if (!flag)  new Send()//发送邮件
else resp.getWriter().println(s); //返回邮箱错误信息
```
### 2. 用户登录
①	记住密码
```
// 获取是否保存密码
String rememberme = req.getParameter("rememberme");

// 判断复选框是否被选中，如果选中则返回on
if (rememberme==null) emailCookie.setMaxAge(0); // 设置将不保存Cookie
if (rememberme.equals("on") emailCookie.setMaxAge(7 * 24 * 60 * 60); // 设置保存Cookie的时间长度，单位为秒
resp.addCookie(emailCookie); // 输出到客户端
```
②	验证用户登录信息，数据库操作。
```
account.equals(list.get(i).getUserId()) && password.equals(list.get(i).getPassword()
```
③	创建LoginUser类保存当前用户，便于后续页面获取登录用户信息。
```
LoginUser loginUser = new LoginUser();
loginUser.setUserId(account);
loginUser.setUserName(username);

//记录Session相关信息
HttpSession session = req.getSession();
session.setAttribute("LoginUser", loginUser);
```
### 3. 用户访问控制
```
if (loginUser.getUserId()!="null"){//用户已登录
    verifyRes = true; //校验成功
}
if (!verifyRes)  //判断校验结果，如果校验失败则重定向到登录页面
chain.doFilter(request, response); // 传递给下一过滤器
```
### 4. 用户注销
```
req.getSession().invalidate();//销毁session对象
```

### 5. 数据库操作。
从源页面获取参数，编写MySQL语句，调用对应函数执行，保存执行结果到valuebean中，跳转至指定页面，指定页面再进行数据获取。
- 数据库插入，包括贡献题头、小说发表、章节发表、主题帖发表。
- 数据库删除，包括小说删除、小说章节删除。
- 数据库更新，包括小说简介修改、小说章节编辑。
- 数据库查询，包括内容浏览、编辑推荐、手气不错、个人中心。

### 6.小说章节编辑调用WangEditor实现文本内容的输入
①	创建文本编辑器
```
var E = window.wangEditor
var editor = new E('#editor')
```
②	获取/修改/初始化文本编辑器内容，用于修改页面。
```
editor.txt.text($("#text").val());
```
### 7. 主题帖发表采用markdown形式
```
var testEditor;
$(function() {
    testEditor = editormd("test-editormd", {/*配置*/})})
```
