import Toastify from "toastify-js";

document.addEventListener('DOMContentLoaded', () => {
  const backgroundColors = {
    notice: "#009688",
    alert: "#f44336",
    error: "#f44336"
  }

  JSON.parse(document.body.dataset.flashMessages).forEach(flashMessage => {
    const [status, message] = flashMessage;

    Toastify({
      text: message,
      duration: 5000,
      close: true,
      backgroundColor: backgroundColors[status],
      stopOnFocus: true
    }).showToast();
  });
});
