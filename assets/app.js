(() => {
  'use strict';
  const input = document.querySelector('#search-input');
  const panel = document.querySelector('#search-results');
  const list = panel.querySelector('ul');
  const status = document.querySelector('#search-status');
  const base = document.body.dataset.base || '';
  const data = window.STATA_SEARCH || [];
  const hide = () => { panel.hidden = true; input.setAttribute('aria-expanded','false'); };
  const search = () => {
    const query = input.value.trim().toLowerCase();
    list.replaceChildren();
    if (!query) return hide();
    const terms = query.split(/\s+/);
    const scored = data.map(item => {
      const title = item.title.toLowerCase();
      const text = `${item.title} ${item.summary} ${item.text}`.toLowerCase();
      return {item,score: terms.every(t=>text.includes(t)) ? terms.reduce((n,t)=>n+(title.includes(t)?10:1),0) : 0};
    }).filter(x=>x.score>0).sort((a,b)=>b.score-a.score);
    status.textContent = scored.length ? `找到 ${scored.length} 节${scored.length>12?'，显示最相关的 12 节':''}` : '没有找到相关内容，试试命令名或更短的关键词。';
    for (const {item} of scored.slice(0,12)) {
      const li=document.createElement('li'),a=document.createElement('a');
      a.href=`${base}lessons/${item.id}.html`;
      const title=document.createElement('strong'),summary=document.createElement('small');
      title.textContent=item.title; summary.textContent=`${item.group} · ${item.summary}`;
      a.append(title,summary); li.append(a); list.append(li);
    }
    panel.hidden=false; input.setAttribute('aria-expanded','true');
  };
  input.addEventListener('input',search);
  input.addEventListener('focus',()=>{if(input.value.trim())search();});
  input.addEventListener('keydown',e=>{
    if(e.key==='Escape') hide();
    if(e.key==='ArrowDown'&&!panel.hidden){const a=list.querySelector('a');if(a){e.preventDefault();a.focus();}}
    if(e.key==='Enter'&&!panel.hidden){list.querySelector('a')?.click();}
  });
  panel.addEventListener('keydown',e=>{if(e.key==='Escape'){hide();input.focus();hide();}});
  document.addEventListener('click',e=>{if(!e.target.closest('.search'))hide();});
  document.querySelector('.print-button').addEventListener('click',()=>window.print());
  for(const button of document.querySelectorAll('.copy-button')){
    let resetTimer;
    button.addEventListener('click',async()=>{
      window.clearTimeout(resetTimer);
      const block=button.closest('.code-block');
      const code=block.querySelector('code');
      const feedback=block.querySelector('.code-feedback');
      let message;
      try{
        if(navigator.clipboard&&window.isSecureContext) await navigator.clipboard.writeText(code.textContent);
        else {
          const area=document.createElement('textarea');area.value=code.textContent;
          area.style.position='fixed';area.style.opacity='0';document.body.append(area);area.select();
          const copied=document.execCommand('copy');area.remove();button.focus();if(!copied)throw Error('copy failed');
        }
        message='已复制';button.dataset.copyState='success';
        document.querySelector('#copy-status').textContent='代码已复制';
      } catch {
        const range=document.createRange();range.selectNodeContents(code);
        const selection=window.getSelection();selection.removeAllRanges();selection.addRange(range);
        message='请按 Ctrl+C';button.dataset.copyState='manual';
        document.querySelector('#copy-status').textContent='自动复制不可用，代码已选中，请按复制快捷键';
      }
      feedback.textContent=message;
      button.setAttribute('title',message);
      button.setAttribute('aria-label',message);
      resetTimer=window.setTimeout(()=>{
        delete button.dataset.copyState;feedback.textContent='';
        button.setAttribute('title','复制代码');button.setAttribute('aria-label','复制代码');
      },2600);
    });
  }
  const navigation = document.querySelector('.navigation-shell');
  const toggle = document.querySelector('.menu-toggle');
  const drawer = document.querySelector('#course-drawer');
  const backdrop = document.querySelector('.menu-backdrop');
  const topbar = document.querySelector('.topbar');
  const background = [...document.querySelectorAll('.layout, .footer, .skip, .brand, .search, .theme-switch, .print-button, .noscript-note')];
  const previousInert = new Map();
  let menuOpen = false;
  let returnFocus = null;
  let savedScroll = 0;

  // Measure the actual bar, including text zoom and the mobile search row.
  const measureHeader = () => {
    document.documentElement.style.setProperty('--header-height', `${topbar.getBoundingClientRect().height}px`);
  };
  if ('ResizeObserver' in window) new ResizeObserver(measureHeader).observe(topbar);
  window.addEventListener('resize', measureHeader);
  measureHeader();

  const closeMenu = (restoreFocus = true) => {
    if (!menuOpen) return;
    menuOpen = false;
    drawer.inert = true;
    drawer.setAttribute('aria-hidden', 'true');
    toggle.setAttribute('aria-expanded', 'false');
    toggle.setAttribute('aria-label', '打开课程目录');
    navigation.removeAttribute('role');
    navigation.removeAttribute('aria-modal');
    navigation.removeAttribute('aria-labelledby');
    document.documentElement.classList.remove('menu-open');
    for (const element of background) element.inert = previousInert.get(element);
    previousInert.clear();
    measureHeader();
    window.scrollTo({top: savedScroll, behavior: 'instant'});
    if (restoreFocus) (returnFocus?.isConnected ? returnFocus : toggle).focus({preventScroll: true});
  };

  const openMenu = () => {
    if (menuOpen) return;
    hide();
    returnFocus = document.activeElement;
    savedScroll = window.scrollY;
    menuOpen = true;
    for (const element of background) {
      previousInert.set(element, element.inert);
      element.inert = true;
    }
    navigation.setAttribute('role', 'dialog');
    navigation.setAttribute('aria-modal', 'true');
    navigation.setAttribute('aria-labelledby', 'drawer-title');
    drawer.inert = false;
    drawer.removeAttribute('aria-hidden');
    toggle.setAttribute('aria-expanded', 'true');
    toggle.setAttribute('aria-label', '关闭课程目录');
    document.documentElement.classList.add('menu-open');
    measureHeader();
    toggle.focus({preventScroll: true});
  };

  toggle.addEventListener('click', () => menuOpen ? closeMenu() : openMenu());
  backdrop.addEventListener('click', () => closeMenu());
  drawer.addEventListener('click', event => {
    if (event.target.closest('a[href]')) closeMenu();
  });
  document.addEventListener('keydown', event => {
    if (!menuOpen) return;
    if (event.key === 'Escape') {
      event.preventDefault();
      closeMenu();
    } else if (event.key === 'Tab') {
      // Hidden lessons in collapsed <details> must not enter the focus loop.
      const targets = [toggle, ...drawer.querySelectorAll('a[href], summary')].filter(element => element.getClientRects().length);
      const first = targets[0], last = targets[targets.length - 1];
      if (event.shiftKey && (document.activeElement === first || !navigation.contains(document.activeElement))) {
        event.preventDefault(); last.focus();
      } else if (!event.shiftKey && (document.activeElement === last || !navigation.contains(document.activeElement))) {
        event.preventDefault(); first.focus();
      }
    }
  });
  document.addEventListener('focusin', event => {
    if (menuOpen && (!navigation.contains(event.target) || event.target.closest('[inert]'))) toggle.focus({preventScroll: true});
  });
  // Do not restore a locked drawer when returning through browser history.
  window.addEventListener('pagehide', () => closeMenu(false));
  window.addEventListener('beforeprint', () => closeMenu());
})();
