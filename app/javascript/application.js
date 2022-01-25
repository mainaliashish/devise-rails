// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"


const selectUserImage = document.querySelector("#userPictureInput");

selectUserImage.addEventListener("change", (event) => {
  let files = event.target.files;
  let image = files[0];
  let reader = new FileReader();
  reader.onload = function (file) {
    let img = new Image();
    console.log(file);
    img.src = file.target.result;
    // console.log(img.src);
    document.querySelector("#old-image").src = img.src;
  };
  reader.readAsDataURL(image);
  // console.log(files);
});