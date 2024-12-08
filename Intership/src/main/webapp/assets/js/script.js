'use strict';



/**
 * add event on element
 */

const addEventOnElem = function (elem, type, callback) {
  if (elem.length > 1) {
    for (let i = 0; i < elem.length; i++) {
      elem[i].addEventListener(type, callback);
    }
  } else {
    elem.addEventListener(type, callback);
  }
}



/**
 * navbar toggle
 */

const navbar = document.querySelector("[data-navbar]");
const navTogglers = document.querySelectorAll("[data-nav-toggler]");
const navLinks = document.querySelectorAll("[data-nav-link]");
const overlay = document.querySelector("[data-overlay]");

const toggleNavbar = function () {
  navbar.classList.toggle("active");
  overlay.classList.toggle("active");
}

addEventOnElem(navTogglers, "click", toggleNavbar);

const closeNavbar = function () {
  navbar.classList.remove("active");
  overlay.classList.remove("active");
}

addEventOnElem(navLinks, "click", closeNavbar);



/**
 * header active when scroll down to 100px
 */

const header = document.querySelector("[data-header]");
const backTopBtn = document.querySelector("[data-back-top-btn]");

const activeElem = function () {
  if (window.scrollY > 100) {
    header.classList.add("active");
    backTopBtn.classList.add("active");
  } else {
    header.classList.remove("active");
    backTopBtn.classList.remove("active");
  }
}

addEventOnElem(window, "scroll", activeElem);


// Animation: 

gsap.registerPlugin(ScrollTrigger);

  // Hero section animation
  function animateHeroContent() {
    const tl = gsap.timeline();

    tl.from(".hero-content h1", {
      opacity: 0,
      y: 30,
      duration: 1,
      ease: "power3.out"
    })
    .from(".hero-content p", {
      opacity: 0,
      y: 30,
      duration: 0.8,
      ease: "power3.out"
    }, "-=0.5")
    .from(".hero-content .btn", {
      opacity: 0,
      y: 20,
      duration: 0.7,
      ease: "power3.out"
    }, "-=0.5");
  }

  window.addEventListener('load', animateHeroContent);

  gsap.registerPlugin(ScrollTrigger);

  function fadeInUp(elements, delay = 0) {
    gsap.from(elements, {
      y: 50,
      opacity: 0,
      duration: 1,
      delay: delay,
      scrollTrigger: {
        trigger: elements,
        start: "top 80%",
        end: "bottom 20%",
        toggleActions: "play reverse play reverse"
      },
    });
  }

  function scaleIn(elements, delay = 0) {
    gsap.from(elements, {
      scale: 0.8,
      opacity: 0,
      duration: 1,
      delay: delay,
      scrollTrigger: {
        trigger: elements,
        start: "top 80%",
        end: "bottom 20%",
        toggleActions: "play reverse play reverse"
      },
    });
  }

  fadeInUp(".hero-content h1", 0.3);
  // fadeInUp(".hero-content p", 0.5);
  // fadeInUp(".hero-content .btn", 0.7);
  scaleIn(".hero-banner .img-holder", 0.5);

  // Animate category section
  fadeInUp(".category .section-title", 0.3);
  gsap.from(".category-card", {
    y: 50,
    opacity: 0,
    duration: 1,
    stagger: 0.2,
    scrollTrigger: {
      trigger: ".category",
      start: "top 80%",
      end: "bottom 20%",
      toggleActions: "play reverse play reverse"
    },
  });

  // Animate about section
  fadeInUp(".about-content .section-title", 0.3);
  // fadeInUp(".about-content p", 0.3);
  function fadeInUp(selector, delay = 0.3) {
    const elements = document.querySelectorAll(selector);
    
    const observer = new IntersectionObserver((entries) => {
      entries.forEach(entry => {
        entry.target.style.transition = `opacity ${delay}s ease-out, transform ${delay}s ease-out`;
        if (entry.intersectionRatio >= 0.8) {
          entry.target.style.opacity = 1;
          entry.target.style.transform = 'translateY(0)';
        } else {
          entry.target.style.opacity = 0;
          entry.target.style.transform = 'translateY(20px)';
        }
      });
    }, { threshold: [0, 0.8] });
  
    elements.forEach(element => {
      element.style.opacity = 0;
      element.style.transform = 'translateY(20px)';
      observer.observe(element);
    });
  }
  
  // Apply the function
  fadeInUp('.about-content p', 0.3);
  
  function fadeInUp(selector, delay = 0.3) {
  const elements = document.querySelectorAll(selector);

  const observerOptions = {
    root: null,  
    threshold: [0, 0.8],  
  };

  const observerCallback = (entries) => {
    entries.forEach(entry => {
      if (entry.intersectionRatio >= 0.8) {
        entry.target.style.transition = `opacity ${delay}s ease-out, transform ${delay}s ease-out`;
        entry.target.style.opacity = 1;
        entry.target.style.transform = 'translateY(0)';
      } else {
        entry.target.style.opacity = 0;
        entry.target.style.transform = 'translateY(20px)';  
      }
    });
  };

  const observer = new IntersectionObserver(observerCallback, observerOptions);

  elements.forEach(element => {
    element.style.opacity = 0;
    element.style.transform = 'translateY(20px)'; // Initial position
    observer.observe(element);
  });
}

fadeInUp('.about-content p', 0.3);

  fadeInUp(".about-content ul", 0.7);
  scaleIn(".about-banner .img-holder", 0.5);

  // Animate course section
  fadeInUp(".course .section-title", 0.3);
  gsap.from(".course-card", {
    y: 30,
    opacity: 0,
    duration: 1,
    stagger: 0.2,
    scrollTrigger: {
      trigger: ".course",
      start: "top 80%",
      end: "bottom 20%",
      toggleActions: "play reverse play reverse"
    },
  });

  // Animate video section
  scaleIn(".video-card", 0.3);

  // Animate stats section
  gsap.from(".stats-card", {
    scale: 0.8,
    opacity: 0,
    duration: 1,
    stagger: 0.2,
    scrollTrigger: {
      trigger: ".stats",
      start: "top 80%",
      end: "bottom 20%",
      toggleActions: "play reverse play reverse"
    },
  });

  // Animate blog section
  fadeInUp(".blog .section-title", 0.3);
  gsap.from(".blog-card", {
    y: 50,
    opacity: 0,
    duration: 1,
    stagger: 0.2,
    scrollTrigger: {
      trigger: ".blog",
      start: "top 80%",
      end: "bottom 20%",
      toggleActions: "play reverse play reverse"
    },
  });

  // Add hover animations to buttons
  gsap.utils.toArray(".btn").forEach(btn => {
    btn.addEventListener("mouseenter", () => {
      gsap.to(btn, { scale: 1.05, duration: 0.3 });
    });
    btn.addEventListener("mouseleave", () => {
      gsap.to(btn, { scale: 1, duration: 0.3 });
    });
  });

  gsap.utils.toArray(".has-bg-image").forEach(section => {
    gsap.to(section, {
      backgroundPosition: `50% ${innerHeight / 2}px`,
      ease: "none",
      scrollTrigger: {
        trigger: section,
        start: "top bottom",
        end: "bottom top",
        scrub: true
      }
    });
  });

  function handleIntersection(entries, observer) {
    entries.forEach(entry => {
      if (entry.isIntersecting) {
        entry.target.classList.add('is-visible');
      } else {
        entry.target.classList.remove('is-visible');
      }
    });
  }

  const observer = new IntersectionObserver(handleIntersection, {
    threshold: 0.1
  });

  document.querySelectorAll('.fade-in, .scale-in, .slide-in-left, .slide-in-right').forEach(el => {
    observer.observe(el);
  });