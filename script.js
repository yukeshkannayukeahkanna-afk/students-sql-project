const roles = ["Web Designer & Developer", "Frontend Specialist", "UI-Focused Problem Solver"];
const typedText = document.getElementById("typed-text");
const themeToggle = document.getElementById("theme-toggle");
const yearEl = document.getElementById("year");
const contactForm = document.getElementById("contact-form");
const formStatus = document.getElementById("form-status");

let roleIndex = 0;
let charIndex = 0;
let deleting = false;

function typeRole() {
  if (!typedText) return;

  const currentRole = roles[roleIndex];
  if (deleting) {
    charIndex = Math.max(0, charIndex - 1);
    typedText.textContent = currentRole.slice(0, charIndex);
  } else {
    charIndex = Math.min(currentRole.length, charIndex + 1);
    typedText.textContent = currentRole.slice(0, charIndex);
  }

  if (!deleting && charIndex === currentRole.length) {
    deleting = true;
    setTimeout(typeRole, 1000);
    return;
  }

  if (deleting && charIndex === 0) {
    deleting = false;
    roleIndex = (roleIndex + 1) % roles.length;
  }

  setTimeout(typeRole, deleting ? 40 : 90);
}

function applyTheme(theme) {
  const isDark = theme === "dark";
  document.body.classList.toggle("dark", isDark);
  themeToggle.textContent = isDark ? "☀️" : "🌙";
}

themeToggle?.addEventListener("click", () => {
  const nextTheme = document.body.classList.contains("dark") ? "light" : "dark";
  localStorage.setItem("theme", nextTheme);
  applyTheme(nextTheme);
});

const savedTheme = localStorage.getItem("theme") || "light";
applyTheme(savedTheme);

const observer = new IntersectionObserver(
  (entries) => {
    entries.forEach((entry) => {
      if (entry.isIntersecting) entry.target.classList.add("active");
    });
  },
  { threshold: 0.15 }
);

document.querySelectorAll(".reveal").forEach((el) => observer.observe(el));

contactForm?.addEventListener("submit", (event) => {
  event.preventDefault();

  const data = new FormData(contactForm);
  const name = (data.get("name") || "").toString().trim();
  const email = (data.get("email") || "").toString().trim();
  const message = (data.get("message") || "").toString().trim();

  if (!name || !email || !message) {
    formStatus.textContent = "Please complete all fields before submitting.";
    return;
  }

  formStatus.textContent = "Thanks! Your message is ready. Please email me directly at yukeshkanna022007@gmail.com.";
  contactForm.reset();
});

if (yearEl) {
  yearEl.textContent = String(new Date().getFullYear());
}
typeRole();
