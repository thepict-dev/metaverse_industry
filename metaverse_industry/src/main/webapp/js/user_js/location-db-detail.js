let seleced_start_date = null;
let seleced_end_date = null;

document.querySelector(".select_start_date").addEventListener("click", () => {
    document.querySelector("#start_date").showPicker();
})

document.querySelector("#start_date").addEventListener("change", (e) => {
    seleced_start_date = e.target.value;
    document.querySelector(".seleced_start_date").classList.remove("not-seleced");
    document.querySelector(".seleced_start_date").textContent = seleced_start_date;
})


document.querySelector(".select_end_date").addEventListener("click", () => {
    document.querySelector("#end_date").showPicker();
})

document.querySelector("#end_date").addEventListener("change", (e) => {
    seleced_end_date = e.target.value;
    document.querySelector(".seleced_end_date").classList.remove("not-seleced");
    document.querySelector(".seleced_end_date").textContent = seleced_end_date;
})


//탭
const tabItem = document.querySelectorAll('.navigator li');
const tabInner = document.querySelectorAll('.view-info-container');

function activateTab(items, index) {
    tabInner.forEach((inner) => {
        inner.classList.remove('active');
    });

    items.forEach((item) => {
        item.classList.remove('active');
    });

    items[index].classList.add('active');
    tabInner[index].classList.add('active');
}

tabItem.forEach((tab, idx) => {
    tab.addEventListener('click', function() {
        activateTab(tabItem, idx);
    });
});