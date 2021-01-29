<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko-KR">
<head>
    <meta charset="UTF-8" />
    <title>나의 후기 목록</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.6.0/dist/lux/bootstrap.min.css" integrity="sha256-n1LAsYCohTi3YOpx8/Jhgf1i6BLuraa4Bnx/qTd4Vs0=" crossorigin="anonymous">

    <style>
        /* .card-columns {
          column-count: 4;
        } */

        .small {
            font-size: smaller;
        }

        .text-log {
            overflow: hidden;
            text-overflow: ellipsis;
            display: -webkit-box;
            -webkit-line-clamp: 2; /* number of lines to show */
            -webkit-box-orient: vertical;
        }

        .embed-responsive .card-img-top {
            object-fit: cover;
        }

    </style>

    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha256-7dA7lq5P94hkBsWdff7qobYkp9ope/L5LQy2t/ljPLo=" crossorigin="anonymous"></script>
    
    <script type="text/javascript">


        window.addEventListener('DOMContentLoaded', function(){

            fetch('/subscribe/rest/listSubscribe', {
                method: 'POST',
                headers: {
                    "Content-Type": "application/json"
                },
                data: JSON.stringify({
                    // title: "Test",
                    // body: "I am testing!",
                    // userId: 1,
                }),
                credentials : "same-origin"
            })
            .then(res => res.json())
            .then(result => {
                let subscribeList = result.subscribeList;
                let diaryListWeekBefore = result.diaryListWeekBefore;
                let diaryListMonthBefore = result.diaryListMonthBefore;
                let diaryListBefore = result.diaryListBefore;

                console.log(subscribeList);
                console.log(diaryListWeekBefore);
                console.log(diaryListMonthBefore);
                console.log(diaryListBefore);

                let currentPage = 1

                const DATA_PER_PAGE = 10, lastPage = diaryListWeekBefore.length+diaryListMonthBefore.length+diaryListBefore.length;
                console.log(lastPage);
                console.log(currentPage)

                function addData(currentPage) {

                    // const br = document.createElement("br");
                    const list = document.querySelector(".subList");

                    const period = document.createElement("div");
                    period.setAttribute("class", "h4");
                    period.textContent = "이번 주";
                    list.appendChild(period);
                    // list.appendChild(br);
                    period.insertAdjacentHTML('afterend', '<br />');

                    const div = document.createElement("div");
                    div.setAttribute("class", "card-group");
                    list.appendChild(div);

                    for (let i = (currentPage - 1) * DATA_PER_PAGE; i < currentPage * DATA_PER_PAGE; i++) {

                        // const period = document.createElement("div");
                        // period.setAttribute("class", "h4");
                        // period.textContent = "이번 주";
                        // list.appendChild(period);
                        // list.appendChild(br);

                        // const div = document.createElement("div");
                        // div.setAttribute("class", "card-group");
                        // list.appendChild(div);

                        const cardFrame = document.createElement("div");
                        cardFrame.setAttribute("class", "col-auto mb-2");
                        div.appendChild(cardFrame);

                        const cardHead = document.createElement("div");
                        cardHead.setAttribute("class", "card");
                        cardHead.setAttribute("style", "width: 14.5rem;");
                        cardFrame.appendChild(cardHead);

                        const cardEmbed = document.createElement("div");
                        cardEmbed.setAttribute("class", "embed-responsive embed-responsive-16by9");
                        cardHead.appendChild(cardEmbed);

                        const cardImage = document.createElement("img");
                        cardImage.setAttribute("class", "card-img-top embed-responsive-item");
                        cardImage.setAttribute("src", "https://c1.staticflickr.com/5/4324/35605403570_4caa1e57bd.jpg");
                        cardImage.setAttribute("alt", "Card image cap");
                        cardEmbed.appendChild(cardImage);
                    
                        const cardBody = document.createElement("div");
                        cardBody.setAttribute("class", "card-body");
                        cardHead.appendChild(cardBody);

                        const title = document.createElement("h5");
                        title.setAttribute("class", "card-title text-log");
                        title.textContent = "우와아아아앙 작년에 부산 완전 좋았다 개굿이었음";
                        
                        const place = document.createElement("div");
                        place.setAttribute("class", "text-truncate place");

                        const placeText = document.createElement("span");
                        placeText.setAttribute("class", "text-muted small");
                        placeText.textContent = "부산 해운대에서누ㅠ아ㅓㅜㅈ바ㅓㄷㅈ바ㅓ바ㅓㄷㅈ";
                        place.appendChild(placeText);
                        cardBody.appendChild(title);
                        cardBody.appendChild(place);

                        const footer = document.createElement("div");
                        footer.setAttribute("class", "card-footer");
                        cardHead.appendChild(footer);

                        const viewCount = document.createElement("span");
                        viewCount.setAttribute("class", "text-muted small viewCount");
                        viewCount.textContent = "조회수 1회"

                        const seperator = document.createElement("span");
                        seperator.setAttribute("class", "text-muted separator small");
                        seperator.insertAdjacentHTML('afterbegin', '&nbsp;&#8226;&nbsp;');

                        const lastUpdated = document.createElement("span");
                        lastUpdated.setAttribute("class", "text-muted small last-update");
                        lastUpdated.textContent = "last updated";

                        footer.appendChild(viewCount);
                        footer.appendChild(seperator);
                        footer.appendChild(lastUpdated);


                    
                    }
                }
                
                addData(currentPage);
            })
            .catch(err =>{

            });

            
        });

        

        

        window.addEventListener('DOMContentLoaded', function(){

            // let currentPage = 1

            // const DATA_PER_PAGE = 5,
            //     lastPage = 5

            // // const msgLoading = document.getElementById("msg-loading")


            // 데이터 추가 함수
            function addData(currentPage) {

                const $list = document.getElementById("list")

                for (let i = (currentPage - 1) * DATA_PER_PAGE + 1; i <= currentPage * DATA_PER_PAGE; i++) {
                    const $li = document.createElement("li")
                    const $p = document.createElement("p")
                    $li.textContent = currentPage+'페이지 : '+i+'번째 데이터'
                    $p.textContent = currentPage+'페이지 : '+i+'번째 데이터 문단'
                    // $li.classList.add("fade-in")
                    $list.appendChild($p)
                    $list.appendChild($li)
                }
            }

            // // IntersectionObserver 갱신 함수
            // function observeLastChild(intersectionObserver) {

            //     const listChildren = document.querySelectorAll("#list li")
            //     listChildren.forEach(el => {

            //         if (!el.nextSibling && currentPage < lastPage) {
            //             intersectionObserver.observe(el) // el에 대하여 관측 시작
            //         } else if (currentPage >= lastPage) {
            //             intersectionObserver.disconnect()
            //         }

            //     })
            // }

            // // IntersectionObeserver 부분
            // const observerOption = {
            //     root: null,
            //     rootMargin: "0px 0px 0px 0px",
            //     threshold: 0.5
            // }

            // // IntersectionObserver 인스턴스 생성
            // const io = new IntersectionObserver((entries, observer) => {
            //     entries.forEach(entry => {

            //         // entry.isIntersecting: 특정 요소가 뷰포트와 50%(threshold 0.5) 교차되었으면
            //         if (entry.isIntersecting) {

            //             // 다음 데이터 가져오기: 자연스러운 연출을 위해 setTimeout 사용
            //             setTimeout(() => {
            //                 addData(++currentPage)
            //                 observer.unobserve(entry.target)
            //                 observeLastChild(observer)

            //             }, 50)
            //         }
            //     })
            // }, observerOption)


            // // 초기 데이터 생성
            // addData(currentPage)
            // observeLastChild(io)

        });
        


		</script>
    
</head>

<body>

    <header>
        <jsp:include page="../layout/toolbar.jsp"/>
    </header>
    <br />

    <div id="container">

        <div class="row">


            <div class="col-lg-2">
              <div class="list-group">
                <ul class="list-group"><li class="h4 list-group-item disabled border-0" >구독</li></ul>
                <c:set var = "i" value = "0" />
                <c:forEach var = "subscribe" items = "${subscribeList}">
                  <c:set var = "i" value = "${i+1}" />
                  <a href="#" class="list-group-item list-group-item-action border-0">${subscribe.subTargetNickname}</a>
                </c:forEach>
              </div>
            </div>

            <div class="col-lg-10 border-0 subList" style="background-color: rgb(247, 247, 247);"><br />

                <!-- <div class="h4">이번 주</div><br />
                    <div class="card-group">
                        <div class="col-auto mb-2">
                            <div class="card" style="width: 15rem;">
                                <div class="embed-responsive embed-responsive-16by9">
                                    <img class="card-img-top embed-responsive-item" src="https://c1.staticflickr.com/5/4324/35605403570_4caa1e57bd.jpg" alt="Card image cap">
                                </div>
                                <div class="card-body">
                                    <h5 class="card-title text-log">우와아아아앙 작년에 부산 완전 좋았다 개굿이었음</h5>
                                    <div class="text-truncate place"><span class="text-muted small">부산 해운대에서누ㅠ아ㅓㅜㅈ바ㅓㄷㅈ바ㅓ바ㅓㄷㅈ</span></div>
                                </div>
                                <div class="card-footer">
                                    <small class="text-muted viewCount">조회수 1회</small><span class="text-muted"><small>&nbsp;&#8226;&nbsp;</small></span><small class="text-muted last-update">last updated</small>
                                </div>
                            </div>
                        </div>
                    </div>
                </div> -->



            </div>
                    <!-- <div class="card-columns">
                        <div class="card" style="width: 18rem">
                        <img class="card-img-top" src="..." alt="${diary.thumbnail}">
                        <div class="card-body">
                            <h5 class="card-title">${diary.title}</h5>
                            <p class="card-text"><small class="text-muted">${diary.location}</small></p>
                            <p class="card-text"><small class="text-muted">${diary.writeDate}</small></p>
                            <p class="card-text"><small class="text-muted">조회수 1회</small></p>
                        </div>
                    </div> -->

                    <!-- <div class="card-group">
                        <div class="col-auto mb-2">
                            <div class="card" style="width: 15rem;">
                                <div class="embed-responsive embed-responsive-16by9">
                                    <img class="card-img-top embed-responsive-item" src="https://c1.staticflickr.com/5/4324/35605403570_4caa1e57bd.jpg" alt="Card image cap">
                                </div>
                                <div class="card-body">
                                    <h5 class="card-title text-log">우와아아아앙 작년에 부산 완전 좋았다 개굿이었음</h5>
                                    <div class="text-truncate place"><small class="text-muted">부산 해운대에서누ㅠ아ㅓㅜㅈ바ㅓㄷㅈ바ㅓ바ㅓㄷㅈ</small></div>
                                </div>
                                <div class="card-footer">
                                    <small class="text-muted viewCount">조회수 1회</small><span class="text-muted"><small>&nbsp;&#8226;&nbsp;</small></span><small class="text-muted last-update">last updated</small>
                                </div>
                            </div>
                        </div>
                    </div> -->



                <!-- <ul id="list">

                </ul>
                <p id="msg-loading"></p> -->
            

        
    </div>

    
    
</body></html>