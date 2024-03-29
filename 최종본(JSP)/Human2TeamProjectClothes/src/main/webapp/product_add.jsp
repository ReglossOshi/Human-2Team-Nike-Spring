<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.lang.Exception" %>    
<%@ page import="java.sql.*" %>
<%
   // 한글 처리
   request.setCharacterEncoding("UTF-8");

   String proNum = request.getParameter("proNum");
   String gender = request.getParameter("gender");
   String category = request.getParameter("category");
   String type = request.getParameter("type");
   String proName = request.getParameter("proName");
   String size = request.getParameter("size");
   String color = request.getParameter("color");
   String proPrice = request.getParameter("proPrice");
   
   String JDBC_URL = "jdbc:oracle:thin:@1.220.247.78:1522:orcl";
   String USER = "semi_project2";
   String PASSWORD = "123452";
   
  Connection conn = null; //디비 접속 성공시 접속 정보 저장
   PreparedStatement pstmt = null; // 쿼리 실행문
   
   Exception exception = null;
   
  try {
      // 0.
     Class.forName("oracle.jdbc.driver.OracleDriver");
   
      // 1. JDBC로 Oracle연결
     conn = DriverManager.getConnection(JDBC_URL, USER, PASSWORD);
     
      // 2. BO_FREE 테이블에 화면 폼으로부터 가져온 데이터 입력
      String insertQuery = "INSERT INTO products VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
      pstmt = conn.prepareStatement(insertQuery);
      pstmt.setString(1, proNum);
      pstmt.setString(2, gender);
      pstmt.setString(3, category);
      pstmt.setString(4, type);
      pstmt.setString(5, proName);
      pstmt.setString(6, size);
      pstmt.setString(7, color);
      pstmt.setString(8, proPrice);
      
      
      pstmt.executeUpdate();
  } catch(Exception e) {
     exception = e;
     e.printStackTrace();
  } finally {
     if (pstmt != null) try { pstmt.close(); } catch (SQLException ex) {}
     if (conn != null) try { conn.close(); } catch (SQLException ex) {}
  }
%>

<%
   if (exception == null) {   // 공지사항 글 등록이 성공할 경우
      // 1. 성공 팝업 생성
      // 2. 공지사항 리스트로 이동
%>      
<!-- 성공 케이스 html/css/js -->
<script>
   alert('제품이 성공적으로 등록되었습니다.');   // 1
   location.href = '<%= request.getContextPath() %>/product_list.jsp';
</script>
<%
   } else {                           // 공지사항 글 등록이 실패할 경우
      // 1. 실패글
      // 2. 오류내용 표시
%>
<!-- 실패 케이스 html/css/js -->
제품 등록이 실패하였습니다. 시스템 관리자에게 문의하세요.<br>
오류내용: <%= exception.getMessage() %>
<%   
   }
%>






