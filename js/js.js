(function() {
  if (typeof document.querySelector === "undefined" || !document.querySelector) return;
  if (typeof screen === "undefined" || !screen) return;

  function getCaption(el) {
    var caption = el.parentNode.querySelector('.caption');
    if (caption) {
      return caption.textContent;
    }
    else {
      return null;
    }
  }

  function addLinks() {
    var imgs = document.querySelectorAll('.captioned img');
    var img;
    for (var i=0; i<imgs.length; i++) {
      img = imgs[i];
      var link = document.createElement('a');
      link.href = img.src;
      img.parentNode.replaceChild(link, img);
      link.appendChild(img);
    }
  }

  function installLightbox() {
    if (screen.width < 770) {
      return;
    }
    addLinks();
    baguetteBox.run('.captioned', {
      captions: getCaption
    });
  }

  installLightbox();
})();
