(() => {
  'use strict';
  const nav = document.querySelector('.on-page');
  if (!nav) return;
  const toggle = nav.querySelector('.on-page-toggle');
  const panel = nav.querySelector('.on-page-links');
  const label = nav.querySelector('.on-page-current');
  const links = [...panel.querySelectorAll('a')];
  const sections = links.map(link => document.getElementById(link.hash.slice(1)));
  const topbar = document.querySelector('.topbar');
  const backdrop = document.querySelector('.on-page-backdrop');
  const placeholder = document.querySelector('.on-page-placeholder');
  const mobile = window.matchMedia('(max-width:833px)');
  let expanded = false, frame = 0;
  let savedScroll = 0;
  let current = 0;

  const setCurrent = index => {
    current = index;
    for (const [i, link] of links.entries()) {
      if (i === index) link.setAttribute('aria-current', 'location');
      else link.removeAttribute('aria-current');
    }
    label.textContent = links[index].textContent;
  };
  const setExpanded = (value, restoreScroll = true) => {
    const wasExpanded = expanded;
    expanded = mobile.matches && value;
    if (expanded && !wasExpanded) {
      // Freeze the visible bar before locking scroll. A sticky element can
      // otherwise jump back into the scrolled article and disappear.
      const rect = nav.getBoundingClientRect();
      savedScroll = window.scrollY;
      const style = document.documentElement.style;
      style.setProperty('--on-page-overlay-top', `${Math.max(rect.top, topbar.getBoundingClientRect().height)}px`);
      style.setProperty('--on-page-overlay-left', `${rect.left}px`);
      style.setProperty('--on-page-overlay-width', `${rect.width}px`);
      placeholder.style.height = `${rect.height}px`;
    }
    placeholder.hidden = !expanded;
    // Keep the panel rendered for its exit animation, but remove closed links
    // from keyboard and accessibility navigation immediately.
    panel.hidden = false;
    panel.inert = mobile.matches && !expanded;
    if (panel.inert) panel.setAttribute('aria-hidden', 'true');
    else panel.removeAttribute('aria-hidden');
    nav.classList.toggle('is-open', expanded);
    document.documentElement.classList.toggle('on-page-open', expanded);
    toggle.setAttribute('aria-expanded', String(!mobile.matches || expanded));
    if (wasExpanded && !expanded && restoreScroll) window.scrollTo({top: savedScroll, behavior: 'instant'});
  };
  const update = () => {
    const {height, bottom} = nav.getBoundingClientRect();
    document.documentElement.style.setProperty('--on-page-height', `${height}px`);
    document.documentElement.style.setProperty('--on-page-panel-top', `${bottom}px`);
    const threshold = topbar.getBoundingClientRect().height + height + 24;
    let active = 0;
    for (let i = 0; i < sections.length; i++) {
      if (sections[i].getBoundingClientRect().top <= threshold + 1) active = i;
    }
    if (window.scrollY > 0 && window.scrollY + window.innerHeight >= document.documentElement.scrollHeight - 2) active = sections.length - 1;
    if (active !== current) setCurrent(active);
  };
  const schedule = () => {
    if (frame) return;
    frame = window.requestAnimationFrame(() => { frame = 0; update(); });
  };
  const syncLayout = () => {
    const focusWasInPanel = panel.contains(document.activeElement);
    setExpanded(false);
    if (mobile.matches && focusWasInPanel) toggle.focus({preventScroll: true});
    else if (!mobile.matches && document.activeElement === toggle) links[current].focus({preventScroll: true});
    schedule();
  };

  nav.classList.add('is-enhanced');
  setCurrent(0);
  syncLayout();
  toggle.addEventListener('click', () => { update();setExpanded(!expanded);schedule(); });
  backdrop.addEventListener('click', () => { setExpanded(false);toggle.focus({preventScroll: true}); });
  for (const [index, link] of links.entries()) link.addEventListener('click', () => {
    setCurrent(index);
    setExpanded(false);
    const heading = sections[index].querySelector('h2');
    if (heading) {
      heading.setAttribute('tabindex', '-1');
      heading.focus({preventScroll: true});
    }
    // Keep native anchor navigation and browser history intact.
    schedule();
  });
  document.addEventListener('click', event => {
    if (expanded && !nav.contains(event.target)) setExpanded(false);
  });
  document.addEventListener('keydown', event => {
    if (event.key === 'Escape' && expanded) {
      event.preventDefault();setExpanded(false);toggle.focus({preventScroll: true});
    }
  });
  document.addEventListener('focusin', event => {
    if (expanded && !nav.contains(event.target)) setExpanded(false, false);
  });
  if (mobile.addEventListener) mobile.addEventListener('change', syncLayout);
  else mobile.addListener(syncLayout);
  window.addEventListener('scroll', schedule, {passive: true});
  window.addEventListener('resize', () => { if (expanded) setExpanded(false);schedule(); });
  window.addEventListener('hashchange', () => { setExpanded(false, false);schedule(); });
  window.addEventListener('pagehide', () => setExpanded(false, false));
  window.addEventListener('beforeprint', () => setExpanded(false));
  window.addEventListener('pageshow', schedule);
  window.addEventListener('load', schedule);
  if ('ResizeObserver' in window) {
    const observer = new ResizeObserver(schedule);
    observer.observe(nav);observer.observe(topbar);
  }
})();
