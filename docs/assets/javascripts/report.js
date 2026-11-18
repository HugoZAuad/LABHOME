document.addEventListener("DOMContentLoaded", () => {
  document.querySelectorAll(".progress-track").forEach((track) => {
    const value = Number(track.getAttribute("aria-valuenow"));
    const bar = track.querySelector("span");
    if (bar && Number.isFinite(value)) bar.style.width = `${Math.max(0, Math.min(100, value))}%`;
  });
});
