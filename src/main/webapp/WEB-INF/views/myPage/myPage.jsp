<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>My Page</title>
  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
    integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous" />
  <link rel="stylesheet" href="/css/default.css">
  <link rel="stylesheet" href="/css/header.css">
  <link rel="stylesheet" href="/css/myPage.css">
  <link rel="stylesheet" href="/css/footer.css">
  <script>
    window.onload = () => {
      let loginform_btn = document.getElementById("loginform_btn");
      let close_btn = document.getElementById("close_btn");
      let sign_up = document.getElementById("sign_up");
      let main_bg_inner_bottom_list = document.querySelector(".main_bg_inner_bottom_list");
      let showMore = document.getElementById("showMore");

      loginform_btn.onclick = () => {
        let modal_bg = document.querySelector(".modal_bg");
        let loginForm = document.querySelector(".loginForm");
        modal_bg.style.zIndex = 10;
        modal_bg.style.display = "flex";
        loginForm.style.zIndex = 11;
        loginForm.style.display = "flex";
      }
      close_btn.onclick = () => {
        let modal_bg = document.querySelector(".modal_bg");
        let loginForm = document.querySelector(".loginForm");
        modal_bg.style.zIndex = -1;
        modal_bg.style.display = "none";
        loginForm.style.zIndex = -1;
        loginForm.style.display = "none";
      }

      sign_up.onclick = () => {
        location.href = "/member/sign_up";
      }
    }
  </script>
</head>

<body>
  <div class="wrap">
    <div class="header">
      <div class="header_inner">
        <div class="header_inner_top">
          <div class="logo">
            <img src="/images/LOGO.png">
          </div>
          <ul class="login_list">
            <c:choose>
              <c:when test="${mem_id !=null }">
                <li id="login_id"><b>${mem_id }</b>님 환영합니다</li>
                <a href="/member/logout">
                  <li class="login_list_item">로그아웃</li>
                </a>
                <li class="login_list_item" id="loginform_btn" style="display:none">로그인</li>
                <li class="login_list_item" id="signup_btn" style="display:none">회원가입</li>
              </c:when>
              <c:otherwise>
                <li class="login_list_item" id="loginform_btn">로그인</li>
                <li class="login_list_item" id="signup_btn">회원가입</li>
              </c:otherwise>
            </c:choose>
          </ul>
        </div>
        <div class="header_inner_bottom">
          <ul class="menu_list">
            <li class="menu_list_item"><i class="fas fa-stream"></i></li>
            <li class="menu_list_item"><i class="fab fa-hubspot"> Hobby1st</i></li>
            <li class="menu_list_item"><i class="far fa-handshake"> 동호회</i></li>
            <li class="menu_list_item"><i class="fas fa-person-booth"> 마이페이지</i></li>
            <li class="menu_list_item"><i class="far fa-newspaper"> NEWS</i></li>
          </ul>
          <ul class="icon_list">
            <a href="/clubMember/memberList?cpage=1">
              <li class="icon_list_item"><i class="fab fa-facebook"></i></li>
            </a>
            <a href="/clubList/createClubPage">
              <li class="icon_list_item"><i class="fab fa-instagram"></i></li>
            </a>
            <a href="/clubBoard/boardList?cpage=1">
              <li class="icon_list_item"><i class="fab fa-twitter"></i></li>
            </a>
            <a href="/clubList/clubListPage">
              <li class="icon_list_item"><i class="fab fa-github"></i></li>
            </a>
            <a href="/chat/clubChat">
              <li class="icon_list_item"><i class="fab fa-google"></i></li>
            </a>
          </ul>
        </div>
      </div>
    </div>
    <!-- profile -->
    <div class="profile">
      <div class="profile_box">
        <div class="profile_contents_area">
          <div class="profile_photo_area">
            <div class="profile_photo">
              <img src="images/default.jpg">
            </div>
          </div>
          <div class="profile_text_area">
            <div class="profile_text">
              <div class="profile_text_name">KIHOON LEE</div>
              <div class="profile_text_loc"><i class="fas fa-building"></i> SEOUL</div>
              <div class="profile_text_email"><i class="far fa-envelope"></i> REACHZIN@NAVER.COM</div>
              <div class="profile_text_phone"><i class="fas fa-phone-alt"></i> 01026720311</div>
            </div>
          </div>
        </div>
        <div class="profile_btn_area">
          <div class="profile_btn">
            <div class="btn_item">
              <button type="button" id="showProfile"><i class="far fa-address-card"></i> 내 계정 정보 </button>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- profile end -->
    
    <!-- profile_dashboard -->
    <div class="profile_dashboard">
      <div class="profile_dashboard_text">DASHBOARD</div>
      <div class="profile_dashboard_contents_wrap">
        <div class="profile_dashboard_contents">
          <div class="profile_dashboard_contents_icon">
            <i class="fas fa-award" id="my"></i>
          </div>
          <div class="profile_dashboard_contents_desc">
            <div class="profile_dashboard_contents_desc_title">내 동호회</div>
            <div class="profile_dashboard_contents_desc_no">${fn:length(clubList_make)}</div>
          </div>
        </div>
        <div class="profile_dashboard_contents">
          <div class="profile_dashboard_contents_icon">
            <i class="fas fa-user-friends" id="join"></i>
          </div>
          <div class="profile_dashboard_contents_desc">
            <div class="profile_dashboard_contents_desc_title">가입한 동호회</div>
            <div class="profile_dashboard_contents_desc_no">${fn:length(clubList_join)}</div>
          </div>
        </div>
        <div class="profile_dashboard_contents">
          <div class="profile_dashboard_contents_icon">
            <i class="far fa-thumbs-up" id="like"></i>
          </div>
          <div class="profile_dashboard_contents_desc">
            <div class="profile_dashboard_contents_desc_title">관심 동호회</div>
            <div class="profile_dashboard_contents_desc_no">${fn:length(clubList_interest)}</div>
          </div>
        </div>
        <div class="profile_dashboard_contents">
          <div class="profile_dashboard_contents_icon">
            <i class="fas fa-pen-square" id="write_count"></i>
          </div>
          <div class="profile_dashboard_contents_desc">
            <div class="profile_dashboard_contents_desc_title">작성글 수</div>
            <div class="profile_dashboard_contents_desc_no">13</div>
          </div>
        </div>
      </div>
    </div>
    <!-- profile_dashboard end-->

    <!-- recent_act -->
    <div class="recent_act">
      <div class="recent_act_title_text">RECENT ACTIVITY</div>
      <div class="recent_act_contents_wrap">
        <div class="recent_act_contents_header">
          <div class="recent_act_contents_header_list">ACTIVITY</div>
          <div class="recent_act_contents_header_list">CLUB</div>
          <div class="recent_act_contents_header_list">STATUS</div>
          <div class="recent_act_contents_header_list">DATE</div>
        </div>
        <div class="recent_act_contents">
          <div class="recent_act_contents_list">
            <i class="fas fa-sign-in-alt"></i> Hobby1st 동호회에 가입 신청
          </div>
          <div class="recent_act_contents_list">
            Hobby1st
          </div>
          <div class="recent_act_contents_list">
            <span id="no1">신청완료</span>
          </div>
          <div class="recent_act_contents_list">
            2022-01-19
          </div>
        </div>
        <div class="recent_act_contents">
          <div class="recent_act_contents_list">
            <i class="fas fa-sign-in-alt"></i> 주식/코인 동호회에 가입 신청
          </div>
          <div class="recent_act_contents_list">
            DDeokSangCoinClub
          </div>
          <div class="recent_act_contents_list">
            <span id="no2">승인대기중</span>
          </div>
          <div class="recent_act_contents_list">
            2022-01-13
          </div>
        </div>
        <div class="recent_act_contents">
          <div class="recent_act_contents_list">
            <i class="fas fa-sign-in-alt"></i> 프론트엔드 개발 동호회에 가입 신청
          </div>
          <div class="recent_act_contents_list">
            Reaction
          </div>
          <div class="recent_act_contents_list">
            <span id="no3">승인완료</span>
          </div>
          <div class="recent_act_contents_list">
            2022-01-01
          </div>
        </div>
        <div class="recent_act_contents">
          <div class="recent_act_contents_list">
            <i class="fas fa-sign-in-alt"></i> 풋살 동호회에 가입 신청
          </div>
          <div class="recent_act_contents_list">
            FC KH
          </div>
          <div class="recent_act_contents_list">
            <span id="no4">승인거절</span>
          </div>
          <div class="recent_act_contents_list">
            2022-01-01
          </div>
        </div>
      </div>
    </div>
    <!-- recent_act end -->

    <!-- container -->
    <div class="container">
      <div class="myclub_lis_title_text">MY CLUB LIST</div>
      <div class="myclub_list_wrap">
        <div class="myclub_list">
          <div class="myclub_list_box_wrap">
            <div class="myclub_list_box">
              <div class="badge" id="my">MY</div>
              <h3>Title</h3>
              <h5>OWNER</h5>
              <h5>LOC</h5>
              <h5>DESC</h5>
            </div>
          </div>

          <div class="myclub_list_box_wrap">
            <div class="myclub_list_box">
              <div class="badge" id="join">JOIN</div>
              <h3>Title</h3>
              <h5>OWNER</h5>
              <h5>LOC</h5>
              <h5>DESC</h5>
            </div>
          </div>

          <div class="myclub_list_box_wrap">
            <div class="myclub_list_box">
              <div class="badge" id="like">LIKE</div>
              <h3>Title</h3>
              <h5>OWNER</h5>
              <h5>LOC</h5>
              <h5>DESC</h5>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- container end -->

    <div class="links">
      <div class="links_inner">
        <ul class="links_inner_list">
          <li class="links_inner_list_item">회사소개</li>
          <li class="links_inner_list_item">인재채용</li>
          <li class="links_inner_list_item">회원약관</li>
          <li class="links_inner_list_item">개인정보처리방침</li>
          <li class="links_inner_list_item">제휴문의</li>
          <li class="links_inner_list_item">고객센터</li>
        </ul>
      </div>
    </div>
    <div class="footer">
      <div class="footer_inner">
        <div class="footer_logo">
          <img src="/images/LOGO.png">
        </div>
        <div class="footer_contents">
          <div class="footer_desc">
            <ul class="footer_desc_list">
              <li class="footer_desc_list_item">Hobby1st 고객센터 02-1234-5678 (평일 09:00~18:00, 주말·공휴일 휴무)</li>
              <li class="footer_desc_list_item">(주)Hobby1st 04540, 서울특별시 중구 남대문로 120, 대일빌딩 2F, 3F</li>
              <li class="footer_desc_list_item">Copyright (c) (주)Hobby1st. 2022 All rights reserved.</li>
            </ul>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- modal background -->
  <div class="modal_bg">

  </div>
  <!-- sign_in -->
  <div class="loginForm">
    <div class="logininput_wrap">
      <span id="close_btn"><i class="far fa-times"></i></span>
      <div class="logininput">
        <form action="/member/login" method="post">
          <table border=1 align="center">
            <tr>
              <th>Login Page
            </tr>
            <tr>
              <td><input type="text" name="mem_id" placeholder="id">
            </tr>
            <tr>
              <td><input type="password" name="mem_pass" placeholder="pass">
            </tr>
            <tr>
              <th><input type="submit" value="login">
                <button type="button" id="sign_up">Sign Up</button>
            </tr>
          </table>
        </form>
      </div>
    </div>
  </div>
</body>

</html>