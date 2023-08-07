
  // JavaScript for adding and removing ingredient fields
  document.addEventListener("DOMContentLoaded", function() {
    const addIngredientButton = document.getElementById("addIngredient");
  const ingredientsContainer = document.getElementById("cooking_ingredients");

  // Function to create a new ingredient field
  function createIngredientField() {
      const ingredientContainer = document.createElement("div");
  ingredientContainer.classList.add("ingredient_container");

  const ingredientArea = document.createElement("div");
  ingredientArea.classList.add("ingredint_area");
  const ingredientInput = document.createElement("input");
  ingredientInput.type = "text";
  ingredientInput.name = "recipe[cooking_ingredients_attributes][][ingredient_name]";
  ingredientInput.classList.add("ingredint_form");
  ingredientArea.appendChild(ingredientInput);

  const quantityArea = document.createElement("div");
  quantityArea.classList.add("quntity_area");
  const quantityInput = document.createElement("input");
  quantityInput.type = "number";
  quantityInput.name = "recipe[cooking_ingredients_attributes][][quantity]";
  quantityInput.classList.add("quntity_form");
  quantityArea.appendChild(quantityInput);

  const unitArea = document.createElement("div");
  unitArea.classList.add("unit_area");
  const unitInput = document.createElement("input");
  unitInput.type = "text";
  unitInput.name = "recipe[cooking_ingredients_attributes][][unit]";
  unitInput.classList.add("unit_form");
  unitArea.appendChild(unitInput);

  const deleteButton = document.createElement("button");
  deleteButton.classList.add("trash3");
  deleteButton.type = "button";
  deleteButton.innerHTML = '<i class="bi bi-trash3"></i>';
  deleteButton.onclick = function() {
    ingredientsContainer.removeChild(ingredientContainer);
      };

  ingredientContainer.appendChild(ingredientArea);
  ingredientContainer.appendChild(quantityArea);
  ingredientContainer.appendChild(unitArea);
  ingredientContainer.appendChild(deleteButton);

  ingredientsContainer.appendChild(ingredientContainer);
    }

  // Add event listener to the "Add Ingredient" button
  addIngredientButton.addEventListener("click", function() {
    createIngredientField();
    });

  // Function to remove an ingredient field
  function removeIngredient(button) {
      const ingredientContainer = button.closest(".ingredient_container");
  if (ingredientContainer) {
    ingredientsContainer.removeChild(ingredientContainer);
      }
    }
  });




