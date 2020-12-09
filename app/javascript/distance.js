window.addEventListener('load', () => {
  const distanceInput = document.getElementById("distance-integer")
  distanceInput.addEventListener("input", () => {
    const inputValue = distanceInput.value;
    const goal = document.getElementById("distance-point")
    const goalValue = goal.value;
    const distanceGoal = document.getElementById('distance-goal');
    goal.innerHTML =  Math.floor(goalValue - inputValue);
  })
})