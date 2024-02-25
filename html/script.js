window.addEventListener('message', event => updateLogoVisibility(event.data.status));

function updateLogoVisibility(isVisible) {
  $('#logo').toggle(isVisible);
}
