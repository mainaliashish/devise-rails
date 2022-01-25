// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"


const selectImage = document.querySelector("#pictureInput");

selectImage.addEventListener("change", (event) => {
  let files = event.target.files;
  let image = files[0];
  let reader = new FileReader();
  reader.onload = function (file) {
    let img = new Image();
    let type = image.type.split("/").pop().toLowerCase();
    if (type != "jpeg" && type != "jpg" && type != "png") {
      alert("Please select a valid image file");
      document.querySelector("#old-image").src = "";
      return false;
    } else {
      // console.log(file);
      img.src = file.target.result;
      document.querySelector("#old-image").src = img.src;
    }
  };
  reader.readAsDataURL(image);
  // console.log(files);
});
