window.addEventListener('DOMContentLoaded', function(){

    const review = document.getElementById('review');
    console.log(review);

      review.addEventListener('click', (el) =>{
        console.log(review.textContent);
        location.href = "/review/listReview.jsp";
      });
  });
  