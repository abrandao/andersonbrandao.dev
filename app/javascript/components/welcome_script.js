// Script to open and close sidebar
document.getElementById('w3-open').addEventListener("click", w3_open);
document.getElementById('w3-close').addEventListener("click", w3_close);

function w3_open() {
  document.getElementById("mySidebar").style.display = "block";
  document.getElementById("myOverlay").style.display = "block";
} 

function w3_close() {
  document.getElementById("mySidebar").style.display = "none";
  document.getElementById("myOverlay").style.display = "none";
}