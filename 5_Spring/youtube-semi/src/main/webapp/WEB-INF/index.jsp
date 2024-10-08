<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>YouTube</title>
    <link
      rel="icon"
      href="https://www.youtube.com/s/desktop/ae4ecf92/img/favicon_144x144.png"
    />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
    <script
      src="https://kit.fontawesome.com/ef885bd654.js"
      crossorigin="anonymous"
    ></script>
  </head>
  <body>
   <jsp:include page="header.jsp"/>
    <main>
      <aside>
        <a href="">
          <i class="fa-solid fa-house"></i>
          <span>홈</span>
        </a>
        <a href="">
          <i class="fa-solid fa-folder"></i>
          <span>구독</span>
        </a>
      </aside>
      <div class="main-content">
        <nav>
          <a href="" class="active">전체</a>
          <a href="">음악</a>
          <a href="">게임</a>
          <a href="">뉴스</a>
          <a href="">라이브</a>
          <a href="">야생생물</a>
        </nav>
        <section>
        	<c:forEach items="${list}" var="video">
        		<div class="video-card" data-code="${video.videoCode}">
        			<div class="video-main">
	        			<img src="${video.videoImg}"/>
	        			<video src="${video.videoUrl}" controls></video>
        			</div>
        			<div class="video-info">
        				<img src="${video.channel.channelImg}"/>
        				<div class="video-desc">
        					<h2>${video.videoTitle}</h2>
        					<p>${video.channel.channelName}</p>
        					<p>조회수 ${video.videoCount}ㆍ${video.videoDate}</p>
        				</div>
        			</div>
        		</div>
        	</c:forEach>
        </section>
      </div>
    </main>
    <script src="${pageContext.request.contextPath}/js/script.js"></script>
  </body>
</html>
    