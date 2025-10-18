window.addEventListener('message', (event) => {
  const data = event.data || {};
  if (data.type === 'init') {
    applyLogoConfig(data.logo || {});
    return;
  }
  if (typeof data.status === 'boolean') {
    updateLogoVisibility(data.status);
  }
});

function updateLogoVisibility(isVisible) {
  const el = document.getElementById('logo');
  if (!el) return;
  el.style.display = isVisible ? '' : 'none';
}

function applyLogoConfig(logo) {
  const el = document.getElementById('logo');
  if (!el) return;
  if (logo.src) el.setAttribute('src', logo.src);
  if (logo.maxHeight) el.style.maxHeight = logo.maxHeight;
  if (logo.maxWidth) el.style.maxWidth = logo.maxWidth;
  const pos = logo.position || {};
  if (pos.top != null) el.style.top = pos.top;
  if (pos.right != null) el.style.right = pos.right;
  if (pos.bottom != null) el.style.bottom = pos.bottom;
  if (pos.left != null) el.style.left = pos.left;
  el.style.position = 'fixed';
}
