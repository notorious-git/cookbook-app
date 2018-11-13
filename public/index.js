/* global axios */

// RUBY WEB REQUEST
// response = HTTP.get("/api/recipes")
// recipes = response.parse

// JAVASCRIPT WEB REQUEST
axios.get("/api/recipes").then(function(response) {
  var recipes = response.data;
  console.log("the recipes are", recipes);

  var recipeTemplate = document.querySelector("#recipe-card");
  var recipeContainer = document.querySelector(".row");

  recipes.forEach(function(recipe) {
    recipeContainer.appendChild(recipeTemplate.content.cloneNode(true));
  });
});

