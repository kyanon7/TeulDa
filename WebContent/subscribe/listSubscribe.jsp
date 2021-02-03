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
    <script src="https://cdn.jsdelivr.net/npm/react@17.0.1/umd/react.development.js" integrity="sha256-vgei20o/SJ6umW3ivqyJho3ehzJtQ0/7RXS6Z17uC9A=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/react-dom@17.0.1/umd/react-dom.development.js" integrity="sha256-qMfhc+Y8DYwzdUxp1SsKc0nlW57lOIeoPaZ5pZs+MqA=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/babel-standalone@6.26.0/babel.min.js" integrity="sha256-FiZMk1zgTeujzf/+vomWZGZ9r00+xnGvOgXoj0Jo1jA=" crossorigin="anonymous"></script>
    
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
                let diaryList = [
                  ...diaryListWeekBefore,
                  ...diaryListMonthBefore,
                  ...diaryListBefore
                ];

                let currentPage = 1

                const DATA_PER_PAGE = 10;
                const lastPage = Math.ceil((diaryList.length)/DATA_PER_PAGE);

                const list = document.querySelector(".subList");

                const period = document.createElement("div");
                period.setAttribute("class", "h4 period");
                period.textContent = "구독자 기록 목록";
                list.appendChild(period);
                // list.appendChild(br);
                period.insertAdjacentHTML('afterend', '<br />');

                const div = document.createElement("div");
                div.setAttribute("class", "card-group");
                list.appendChild(div);

                function addData(currentPage) {

                    // const br = document.createElement("br");
                    // const list = document.querySelector(".subList");

                    // const period = document.createElement("div");
                    // period.setAttribute("class", "h4 period");
                    // period.textContent = "구독자 기록 목록";
                    // list.appendChild(period);
                    // // list.appendChild(br);
                    // period.insertAdjacentHTML('afterend', '<br />');

                    const cardFrame = document.createElement("div");
                    cardFrame.setAttribute("class", "col-auto mb-2");
                    // div.appendChild(cardFrame);

                    const cardHead = document.createElement("div");
                    cardHead.setAttribute("class", "card");
                    cardHead.setAttribute("style", "width: 14.5rem;");
                    cardFrame.appendChild(cardHead);

                    const cardEmbed = document.createElement("div");
                    cardEmbed.setAttribute("class", "embed-responsive embed-responsive-16by9");
                    cardHead.appendChild(cardEmbed);

                    const cardImage = document.createElement("img");
                    cardImage.setAttribute("class", "card-img-top embed-responsive-item");
                    // cardImage.setAttribute("src", "https://c1.staticflickr.com/5/4324/35605403570_4caa1e57bd.jpg");
                    // cardImage.setAttribute("alt", "Card image cap");
                    cardEmbed.appendChild(cardImage);
                
                    const cardBody = document.createElement("div");
                    cardBody.setAttribute("class", "card-body");
                    cardHead.appendChild(cardBody);

                    const title = document.createElement("h5");
                    title.setAttribute("class", "card-title text-log");
                    title.textContent = "";
                    
                    const place = document.createElement("div");
                    place.setAttribute("class", "text-truncate place");

                    const placeText = document.createElement("span");
                    placeText.setAttribute("class", "text-muted small");
                    placeText.textContent = "";
                    place.appendChild(placeText);
                    cardBody.appendChild(title);
                    cardBody.appendChild(place);

                    const footer = document.createElement("div");
                    footer.setAttribute("class", "card-footer");
                    cardHead.appendChild(footer);

                    const nicks = document.createElement("div");
                    nicks.setAttribute("class", "text-muted small nick");
                    nicks.textContent = "";

                    const viewCount = document.createElement("span");
                    viewCount.setAttribute("class", "text-muted small viewCount");
                    viewCount.textContent = "";

                    const seperator = document.createElement("span");
                    seperator.setAttribute("class", "text-muted separator small");
                    seperator.insertAdjacentHTML('afterbegin', '&nbsp;&#8226;&nbsp;');

                    const lastUpdated = document.createElement("span");
                    lastUpdated.setAttribute("class", "text-muted small last-update");
                    lastUpdated.textContent = "";

                    footer.appendChild(nicks);
                    footer.appendChild(viewCount);
                    footer.appendChild(seperator);
                    footer.appendChild(lastUpdated);


                    // let week;
                    // let month;
                    // let before;

                    let targetList;
                    console.log(diaryList);
                    // if(diaryListWeekBefore.length > 0){
                    //     week = period;
                    //     week.textContent = "이번 주";
                        targetList = diaryList;
                    // }
                    // if(diaryListMonthBefore.length > 0){
                    //     month = period.cloneNode();
                    //     if(diaryListWeekBefore.length < 1){
                    //         month = period;
                    //         targetList = diaryListMonthBefore;
                    //     }
                    //     month.textContent = "이번 달";
                    // }
                    // if(diaryListMonthBefore.length > 0){
                    //     before = period.cloneNode();
                    //     if(diaryListWeekBefore < 1 && diaryListMonthBefore < 1){
                    //         before = period;
                    //         targetList = diaryListBefore;
                    //     }
                    //     before.textContent = "이전";
                    // }

                    for (let i = (currentPage - 1) * DATA_PER_PAGE; i < currentPage * DATA_PER_PAGE; i++) {

                        let target = targetList[i];

                        let lastUp = new Date(target.writeDate);
                        let today = new Date();
                        let last = Math.ceil((today.getTime() - lastUp.getTime())/1000/60/60/24);

                        cardImage.setAttribute("src", target.thumbnail);
                        cardImage.setAttribute("alt", target.thumbnail);

                        nicks.textContent = target.nickname;
                        title.textContent = target.title;
                        placeText.textContent = target.location;
                        viewCount.textContent = `조회수 \${target.viewCount}회`;
                        lastUpdated.textContent = `\${last}일 전`;

                        const cards = cardFrame.cloneNode(true);

                        // if (targetList == diaryListWeekBefore){
                            div.appendChild(cards);
                        // }else if(targetList == diaryListMonthBefore){
                        //     document.getElementById('month').appendChild(cards);
                        // }else if(targetList == diaryListBefore){
                        //     document.getElementById('before').appendChild(cards);
                        // }
                    }
                }
                
                // IntersectionObserver 갱신 함수
            function observeLastChild(intersectionObserver) {

                const listChildren = document.querySelectorAll(".col-auto.mb-2");
                listChildren.forEach(el => {
                    // let el = listChildren[listChildren.length-1]
                    if (!el.nextSibling && currentPage < lastPage) {
                        intersectionObserver.observe(el);
                    } else if (currentPage >= lastPage) {
                        intersectionObserver.disconnect();
                    }

                })
            }

                // IntersectionObeserver 부분
                const observerOption = {
                    root: null,
                    rootMargin: "0px 0px 0px 0px",
                    threshold: 0.5
                }

                // IntersectionObserver 인스턴스 생성
                const io = new IntersectionObserver((entries, observer) => {
                    entries.forEach(entry => {

                        // entry.isIntersecting: 특정 요소가 뷰포트와 50%(threshold 0.5) 교차되었으면
                        if (entry.isIntersecting) {

                          // 다음 데이터 가져오기: 자연스러운 연출을 위해 setTimeout 사용
                          setTimeout(() => {
                              
                              addData(++currentPage)
                              observer.unobserve(entry.target)
                              observeLastChild(observer)

                          }, 50)
                        }
                    })
                }, observerOption)

                // 초기 데이터 생성
                addData(currentPage);
                observeLastChild(io);
            })
            .catch(err =>{

            });
            
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

            <div class="col-lg-10 border-0 subList" style="background-color: rgb(247, 247, 247);"><br /></div>
        </div>
    </div>

    
</body></html>