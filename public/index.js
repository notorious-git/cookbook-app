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
    var copiedContent = recipeTemplate.content.cloneNode(true);
    copiedContent.querySelector(".card-title").innerText = recipe.title;
    copiedContent.querySelector(".card-img-top").src = recipe.image_url;
    recipeContainer.appendChild(copiedContent);
  });
});

