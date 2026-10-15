// Runs before the stylesheet so the first paint uses the saved appearance.
(() => {
  'use strict';
  const key = 'stata-tutorial-theme';
  const root = document.documentElement;
  const system = window.matchMedia('(prefers-color-scheme: dark)');
  const valid = value => ['light', 'dark', 'system'].includes(value) ? value : 'system';
  const read = () => {
    try { return window.localStorage.getItem(key); }
    catch { return undefined; } // A blocked store must not prevent in-page switching.
  };
  let preference = valid(read());
  let controls = [];
  const apply = () => {
    root.dataset.theme = preference === 'system' ? (system.matches ? 'dark' : 'light') : preference;
    root.dataset.themePreference = preference;
    for (const control of controls) control.checked = control.value === preference;
  };
  const refresh = () => {
    const stored = read();
    if (stored !== undefined) preference = valid(stored);
    apply();
  };
  apply();
  if (system.addEventListener) system.addEventListener('change', apply);
  else system.addListener(apply);
  window.addEventListener('storage', event => {
    // Clearing localStorage also restores the system default.
    if (event.key === key || event.key === null) refresh();
  });
  window.addEventListener('pageshow', refresh);
  document.addEventListener('DOMContentLoaded', () => {
    controls = [...document.querySelectorAll('input[name="theme"]')];
    apply();
    for (const control of controls) control.addEventListener('change', () => {
      if (!control.checked) return;
      preference = valid(control.value);
      apply();
      try { window.localStorage.setItem(key, preference); } catch { /* Keep the current page usable. */ }
    });
  }, {once: true});
})();
