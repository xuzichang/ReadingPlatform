package toolbean;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import db.DbConn;
import valuebean.*;

/**
 * 数据库操作
 */

public class dbTool {

	// 写入小说简介,主题帖，章节信息，贡献题头，用户注册信息
	public void add(String sql) {
		try {
			Connection con = DbConn.getConn();
			Statement stmt = con.createStatement();
			stmt.executeUpdate(sql);
			DbConn.DbClose(stmt, con);
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
	}

	// 删除操作
	public void delete(String sql) {
		try {
			Connection con = DbConn.getConn();
			Statement stmt = con.createStatement();
			stmt.executeUpdate(sql);
			DbConn.DbClose(stmt,con);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}

	// 更新小说简介,章节名称，内容
	public void update(String sql) {
		try {
			Connection con = DbConn.getConn();
			Statement stmt = con.createStatement();
			stmt.executeUpdate(sql);
			DbConn.DbClose(stmt, con);
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
	}

	// 1 查找用户信息，输出为一位用户
	// 用于AddHeading,NovelCreatedServlet,NovelDeleteServlet,NovelEditServlet,
	// ThemeCreateServlet,ThemeDeleteServlet,header,
	public userInfo findOneUser(String sql){
		try {
			Connection con = DbConn.getConn();
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(sql);

			userInfo userinfo = new userInfo();

			while(rs.next()){
				userinfo.setUser_id(rs.getString("user_id"));
				userinfo.setUser_name(rs.getString("user_name"));
				userinfo.setCollection_id(rs.getString("collection_id"));
				userinfo.setFollowing_id(rs.getString("following_id"));
				userinfo.setOne_line_describe(rs.getString("one_line_describe"));
			}

			DbConn.DbClose(rs,stmt,con);

			return userinfo;
		}catch (SQLException e) {
			System.out.println(e.getMessage());
			return null;
		}
	}

	// 2 查找书籍信息中的书籍名称
	// 用于ChapterCreatedServlet,ChapterDeleteServlet,ChapterEditServlet,
	// NovelEditServlet,BookDetailContent,ContentDetailContent,IndexContent,LibraryContent,
	// MyBookDetail,NovelEdit,UserContent,
	public bookInfo findOneBook(String sql){
		try {
			Connection con = DbConn.getConn();
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(sql);

			bookInfo bookinfo = new bookInfo();

			while(rs.next()){
				bookinfo.setBook_name(rs.getString("book_name"));;
			}

			DbConn.DbClose(rs,stmt,con);

			return bookinfo;
		}catch (SQLException e) {
			System.out.println(e.getMessage());
			return null;
		}
	}

	// 3 查找章节内容中的章节名,章节内容
	// 用于chapterEdit,
	public bookInfo findChapter_and_Content(String sql){
		try {
			Connection con = DbConn.getConn();
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(sql);

			bookInfo info = new bookInfo();

			rs.next();
			info.setContent(rs.getString("content"));
			info.setChapter_name(rs.getString("chapter_name"));

			DbConn.DbClose(rs,stmt,con);

			return info;
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return null;
		}
	}

	// 4 查找章节内容中的章节内容id
	// 用于ChapterEditServlet,
	public bookInfo findContent(String sql){
		try {
			Connection con = DbConn.getConn();
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(sql);

			bookInfo info = new bookInfo();

			rs.next();
			info.setContent_id(rs.getString("content_id"));

			DbConn.DbClose(rs,stmt,con);

			return info;
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return null;
		}
	}

	// 5 查找章节内容中的部分信息
	// 用于ContentDetailContent,
	public bookInfo findBookContent(String sql){
		try {
			Connection con = DbConn.getConn();
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(sql);

			bookInfo info = new bookInfo();

			rs.next();
			info.setBook_id(rs.getString("book_id"));
			info.setBook_name(rs.getString("book_name"));
			info.setChapter_id(rs.getString("content.chapter_id"));
			info.setChapter_name(rs.getString("chapter_name"));
			info.setContent(rs.getString("content"));
			info.setContent_id(rs.getString("content_id"));
			info.setAuthor_name(rs.getString("user_name"));
			info.setUpdate_time(rs.getString("update_time"));

			DbConn.DbClose(rs,stmt,con);

			return info;
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return null;
		}
	}

	// 6 查找用户登录信息
	// 用于SendMailServlet,LoginServlet,
	public ArrayList<LoginUser> findUserLogin(String sql){
		try {
			Connection con = DbConn.getConn();
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(sql);

			ArrayList<LoginUser> list = new ArrayList<LoginUser>();

			while (rs.next()) {
				LoginUser loginuser = new  LoginUser();
				loginuser.setUserId(rs.getString("email"));
				loginuser.setPassword(rs.getString("password"));
				loginuser.setUserName(rs.getString("user_name"));
				list.add(loginuser);
			}

			DbConn.DbClose(rs,stmt,con);

			return list;
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return null;
		}
	}

	// 7 查找用户信息
	// 用于LoginServlet,SendMailServlet,UserContent,
	public ArrayList<userInfo> findUser(String sql){
		try {
			Connection con = DbConn.getConn();
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(sql);

			ArrayList<userInfo> list = new ArrayList<userInfo>();

			while(rs.next()){
				userInfo userinfo = new userInfo();
				userinfo.setUser_id(rs.getString("user_id"));
				userinfo.setUser_name(rs.getString("user_name"));
				userinfo.setCollection_id(rs.getString("collection_id"));
				userinfo.setFollowing_id(rs.getString("following_id"));
				userinfo.setOne_line_describe(rs.getString("one_line_describe"));
				list.add(userinfo);
			}

			DbConn.DbClose(rs,stmt,con);

			return list;
		}catch (SQLException e) {
			System.out.println(e.getMessage());
			return null;
		}
	}

	// 8 查找题头
	// 用于IndexContent,
	public ArrayList<headingInfo> findHeading(String sql){
		try {
			Connection con = DbConn.getConn();
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(sql);

			ArrayList<headingInfo> list = new ArrayList<headingInfo>();

			while(rs.next()){
				headingInfo headinginfo = new headingInfo();
				headinginfo.setHeading_content(rs.getString("heading_content"));
				headinginfo.setHeading_author(rs.getString("user_name"));
				list.add(headinginfo);
			}

			DbConn.DbClose(rs,stmt,con);

			return list;
		}catch (SQLException e) {
			System.out.println(e.getMessage());
			return null;
		}
	}

	// 9 查找书籍中部分信息
	// 用于NovelCreatedServlet,NovelDeletedServlet,NovelEdit,BookDetailContent,
	// ContentDetailContent,IndexContent,LibraryContent,MyBookDetail,NovelEdit,
	// UserContent,
	public ArrayList<bookInfo> findBook(String sql){
		try {
			Connection con = DbConn.getConn();
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(sql);

			ArrayList<bookInfo> list = new ArrayList<bookInfo>();

			while(rs.next()){
				bookInfo bookinfo = new bookInfo();
				bookinfo.setBook_id(rs.getString("book_id"));
				bookinfo.setBook_name(rs.getString("book_name"));
				bookinfo.setOne_line_describe(rs.getString("book.one_line_describe"));
				bookinfo.setAuthor_name(rs.getString("user_name"));
				bookinfo.setLabel(rs.getString("label"));
				bookinfo.setUpdate_time(rs.getString("update_time"));
				bookinfo.setIntroduction(rs.getString("introduction"));
				list.add(bookinfo);
			}

			DbConn.DbClose(rs,stmt,con);

			return list;
		}catch (SQLException e) {
			System.out.println(e.getMessage());
			return null;
		}
	}

	// 10 查找书籍id,章节id,内容id
	// 用于NovelDeleteServlet,
	public ArrayList<bookInfo> findBook_and_Chpater_and_Content(String sql){
		try {
			Connection con = DbConn.getConn();
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(sql);

			ArrayList<bookInfo> list = new ArrayList<bookInfo>();

			while(rs.next()){
				bookInfo bookinfo = new bookInfo();
				bookinfo.setBook_id(rs.getString("book_id"));
				bookinfo.setChapter_id(rs.getString("chapter_id"));
				bookinfo.setContent_id(rs.getString("content_id"));
				list.add(bookinfo);
			}

			DbConn.DbClose(rs,stmt,con);

			return list;
		}catch (SQLException e) {
			System.out.println(e.getMessage());
			return null;
		}
	}

	// 11 查找书籍章节中的章节id,章节名,书籍id
	// 用于ChapterCreatedServlet,ChapterEdit,header,LibraryContent,MyBookDetail,
	public ArrayList<bookInfo> findChapter(String sql){
		try {
			Connection con = DbConn.getConn();
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(sql);

			ArrayList<bookInfo> list = new ArrayList<bookInfo>();

			while(rs.next()){
				bookInfo bookinfo = new bookInfo();
				bookinfo.setChapter_id(rs.getString("chapter_id"));
				bookinfo.setChapter_name(rs.getString("chapter_name"));
				bookinfo.setBook_id(rs.getString("book_id"));
				list.add(bookinfo);
			}

			DbConn.DbClose(rs,stmt,con);

			return list;
		}catch (SQLException e) {
			System.out.println(e.getMessage());
			return null;
		}
	}

	// 12 查找主题贴
	// 用于ThemeCreated,ForumContent,IndexContent,MyThemeDetail,QuestionBoxContent,
	// RecommendedContent,StatusContent,ThemeContent,ThreadsContent,UserContent,
	public ArrayList<themeInfo> findTheme(String sql){
		try {
			Connection con = DbConn.getConn();
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(sql);

			ArrayList<themeInfo> list = new ArrayList<themeInfo>();

			while(rs.next()){
				themeInfo themeinfo = new themeInfo();
				themeinfo.setTheme_id(rs.getString("theme_id"));
				themeinfo.setAuthor_id(rs.getString("author_id"));
				themeinfo.setTheme_name(rs.getString("theme_name"));
				themeinfo.setOne_line_describe(rs.getString("one_line_describe"));
				themeinfo.setUpdate_time(rs.getString("update_time"));
				themeinfo.setAuthor_name(rs.getString("user_name"));
				themeinfo.setTheme_content(rs.getString("theme_content"));
				list.add(themeinfo);
			}

			DbConn.DbClose(rs,stmt,con);

			return list;
		}catch (SQLException e) {
			System.out.println(e.getMessage());
			return null;
		}
	}

	// 13 搜索,查找书籍id
	// 用于SearchServlet,
	public ArrayList<bookInfo> findBookId(String sql){
		try {
			Connection con = DbConn.getConn();
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(sql);

			ArrayList<bookInfo> list = new ArrayList<bookInfo>();

			while(rs.next()){
				bookInfo bookinfo = new bookInfo();
				bookinfo.setBook_id(rs.getString("book_id"));
				list.add(bookinfo);
			}

			DbConn.DbClose(rs,stmt,con);

			return list;
		}catch (SQLException e) {
			System.out.println(e.getMessage());
			return null;
		}
	}

}