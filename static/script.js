document.addEventListener("DOMContentLoaded", function () {
  const questionInput = document.getElementById("questionInput");
  const warningText = document.getElementById("warningText");
  const submitButton = document.getElementById("submitButton");

  questionInput.addEventListener("input", function () {
    const textLength = questionInput.value.length;

    if (textLength > 1000) {
      warningText.classList.remove("hidden");
      warningText.classList.add("visible");
      submitButton.disabled = true; // Keela nupp
    } else {
      warningText.classList.remove("visible");
      warningText.classList.add("hidden");
      submitButton.disabled = textLength === 0; // Keela nupp, kui tühi
    }
  });
});
