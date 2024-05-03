document.addEventListener("DOMContentLoaded", function () {
  const showPasswordButtons = document.querySelectorAll(".show-password");
  showPasswordButtons.forEach(function (button) {
    button.addEventListener("click", function () {
      const passwordCell =
        this.parentElement.parentElement.querySelector(".password-cell");
      const originalPassword = passwordCell.dataset.password; // Lấy mật khẩu từ thuộc tính data-password

      // Kiểm tra nếu mật khẩu đã được hiển thị, thì hiển thị dấu sao
      if (passwordCell.textContent === originalPassword) {
        passwordCell.textContent = "*".repeat(originalPassword.length);
      } else {
        // Nếu không, hiển thị mật khẩu thực sự
        passwordCell.textContent = originalPassword;
      }
    });
  });
});
