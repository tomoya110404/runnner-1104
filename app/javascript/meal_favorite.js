function meal_favorite() {
  const meal = document.getElementById("mfsubmit");

   meal.addEventListener("click", (e) => {
      e.preventDefault();
      const mealId = meal.getAttribute("data_id");
      const formData = new FormData(document.getElementById("form_mf"));
      const XHR = new XMLHttpRequest();
      XHR.open("POST", `/meals/${mealId}/meal_favorites`, true);
      XHR.responseType = "json";
      XHR.send(formData);
      XHR.onload = () => {
        if (XHR.status != 200) {
          alert(`Error ${XHR.status}: ${XHR.statusText}`);
          return null;
        }

        const item = XHR.response.meal;
        const favorite = XHR.response.favorite;
        if (favorite) {
          meal.setAttribute("style", "color: gold;, background-color: :gold");
        } else if (favorite == null){
          meal.removeAttribute("style", "color: gold;, background-color: :gold");
        }
          
      };
    });
}
window.addEventListener("load", meal_favorite);