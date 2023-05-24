<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
 <head>
    <meta charset="UTF-8">
    <title>마이페이지</title>
    <style>
      /* 스타일 설정 */
      #header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 20px;
        background-color: #f6f6f6;
      }

      #logo {
        width: 100px;
        height: auto;
      }

      #menu {
        display: flex;
      }

      #menu li {
        list-style: none;
        margin: 0 10px;
      }

      #menu a {
        text-decoration: none;
        color: black;
      }
    </style>
  </head>

  <body>
    <header id="header">
      <img src="로고이미지 주소" alt="로고" id="logo">
      <nav id="navigation">
        <ul id="menu">
          <li><a href="#">로그인/회원가입</a></li>
          <li><a href="#">뉴스</a></li>
          <li><a href="#">Q&A</a></li>
          <li><a href="#">메인페이지</a></li>
        </ul>
      </nav>
    </header>
  </body>
</html>