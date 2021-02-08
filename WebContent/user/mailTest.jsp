<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<form action="/sendMail/auth" id="findForm" method="post">
    <fieldset>
        <legend class="screen_out">아이디 찾기 폼</legend>
 
        <div class="box email">
            <label for="email">이메일</label>
            <input type="text" id="email" name="email" autofocus autocomplete="off" required />
        </div>
        <!-- // .box.email -->
 
        <div class="box captcha">
            <div class="loading"></div>
            <!-- // .loading -->
 
            <!-- <label for="captcha">자동 방지 코드</label>
            <input type="text" id="captcha" name="captcha" autocomplete="off" required />
            <img src="/captcha" alt="캡차 이미지" title="클릭시 새로고침" />
        </div> -->
        <!-- // .box.captcha -->
 
        <div class="box btn">
            <button type="submit" class="btn join">
                <i class="fa fa-envelope"></i>
                이메일 전송
            </button>
        </div>
        <!-- // .box.btn -->	
    </fieldset>
</form>

