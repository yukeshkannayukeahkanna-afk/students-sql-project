const roles = ["Web Designer & Developer", "Frontend Specialist", "UI-Focused Problem Solver"];
const typedText = document.getElementById("typed-text");
const themeToggle = document.getElementById("theme-toggle");
const yearEl = document.getElementById("year");

let roleIndex = 0;
let charIndex = 0;
let deleting = false;

function typeRole() {
  if (!typedText) return;

  const currentRole = roles[roleIndex];
  typedText.textContent = deleting
    ? currentRole.slice(0, charIndex--)
    : currentRole.slice(0, charIndex++);

  if (!deleting && charIndex > currentRole.length + 1) {
    deleting = true;
    setTimeout(typeRole, 1000);
    return;
  }

  if (deleting && charIndex < 0) {
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

yearEl.textContent = String(new Date().getFullYear());
typeRole();
