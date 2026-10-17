(() => {
  'use strict';
  const hero=document.querySelector('.home-hero');
  if (!hero) return;
  const toggle=hero.querySelector('.hero-code-toggle');
  const layers=[...hero.querySelectorAll('.hero-code-overlay')];
  if (!toggle || !layers.length) return;
  const count=Number(layers[0].dataset.cycleSize);
  if (!Number.isFinite(count) || count<1) return;
  const rows=layers.flatMap(layer=>[...layer.querySelectorAll('[data-hero-row]')].map(node=>({node,index:Number(node.dataset.heroRow),texts:[...node.querySelectorAll('text')]})));
  const reduced=window.matchMedia('(prefers-reduced-motion: reduce)');
  const hover=window.matchMedia('(hover: hover) and (pointer: fine)');
  const step=23.2, cycle=count*step, speed=step;
  let offset=0, last=null, frame=0, paused=false, hovered=false;
  let visible=true, printing=false, inactive=false;

  const render=()=>{
    for (const row of rows) {
      const y=310+row.index*step-offset;
      const opacity=Math.max(0,Math.min(1,(y-288)/32,(754-y)/32));
      row.node.setAttribute('opacity',opacity.toFixed(3));
      if (!opacity) continue;
      // Recompute the shear as each line rises: translation alone would leave
      // the text slant disconnected from its position on the editor plane.
      const slope=-.14+(y-310)/step*.012;
      row.node.setAttribute('transform',`matrix(1 ${slope.toFixed(3)} 0 1 0 ${(-950*slope).toFixed(3)})`);
      for (const text of row.texts) text.setAttribute('y',y.toFixed(3));
    }
  };
  const canRun=()=>!reduced.matches&&!paused&&!hovered&&!document.hidden&&visible&&!printing&&!inactive;
  const tick=time=>{
    frame=0;
    if (!canRun()) {last=null;return;}
    if (last!==null) {
      offset=(offset+Math.min(100,time-last)*speed/1000)%cycle;
      if (cycle-offset<1e-7) offset=0;
    }
    last=time;
    render();
    frame=requestAnimationFrame(tick);
  };
  const sync=()=>{
    toggle.hidden=reduced.matches;
    toggle.setAttribute('aria-pressed',String(paused));
    toggle.dataset.paused=String(paused);
    const label=paused?'继续代码滚动':'暂停代码滚动';
    toggle.setAttribute('aria-label',label);
    toggle.setAttribute('title',label);
    hero.dataset.codeState=canRun()?'running':'paused';
    if (canRun()&&!frame) {
      last=null;frame=requestAnimationFrame(tick);
    } else if (!canRun()) {
      if (frame) cancelAnimationFrame(frame);
      frame=0;last=null;
    }
  };
  toggle.addEventListener('click',()=>{paused=!paused;sync();});
  toggle.addEventListener('pointerenter',event=>{
    if (event.pointerType==='mouse'&&hover.matches) {hovered=true;sync();}
  });
  toggle.addEventListener('pointerleave',()=>{hovered=false;sync();});
  const motionChange=()=>{
    if (reduced.matches) {offset=0;render();}
    sync();
  };
  if (reduced.addEventListener) reduced.addEventListener('change',motionChange);
  else reduced.addListener(motionChange);
  document.addEventListener('visibilitychange',sync);
  if (typeof IntersectionObserver==='function') {
    new IntersectionObserver(entries=>{visible=entries[0].isIntersecting;sync();}).observe(hero);
  }
  window.addEventListener('beforeprint',()=>{printing=true;sync();});
  window.addEventListener('afterprint',()=>{printing=false;sync();});
  window.addEventListener('pagehide',()=>{inactive=true;sync();});
  window.addEventListener('pageshow',()=>{inactive=false;sync();});
  render();sync();
})();
