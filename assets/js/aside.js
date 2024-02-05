function addCategoryToAside(category) {

    let aside = document.querySelector("aside");

    // adding the form open button

    let h3 = document.createElement("h3");
    let btn = document.createElement("button");
    let btnSpan = document.createElement("span");
    h3.innerText = category.name;
    btn.classList.add("btn-add-channel");
    btn.setAttribute("data-cat", category.id);
    btn.setAttribute("aria-label", "Open the add channel form");
    btnSpan.classList.add("bi");
    btnSpan.classList.add("bi-plus-circle");

    btn.appendChild(btnSpan);
    h3.appendChild(btn);
    aside.appendChild(h3);

    btn.addEventListener("click", toggleChannelForm);

    // adding the add channel form

    let form = document.createElement("form");
    let inputCat = document.createElement("input");
    let inputChan = document.createElement("input");
    let formBtn = document.createElement("button");
    let formBtnSpan = document.createElement("span");

    form.classList.add("add-channel");
    form.classList.add("closed");
    form.setAttribute("data-cat", category.id);
    inputCat.setAttribute("type", "hidden");
    inputCat.setAttribute("name", "cat-id");
    inputCat.setAttribute("id", "cat-id");
    inputCat.setAttribute("value", category.id);
    inputChan.setAttribute("type", "text");
    inputChan.setAttribute("name", "chan-name");
    inputChan.setAttribute("id", "chan-name");
    inputChan.setAttribute("aria-label", "Channel Name");
    formBtn.setAttribute("type", "submit");
    formBtn.setAttribute("aria-label", "Add");
    formBtnSpan.classList.add("bi");
    formBtnSpan.classList.add("bi-check2")

    form.appendChild(inputCat);
    form.appendChild(inputChan);
    formBtn.appendChild(formBtnSpan);
    form.appendChild(formBtn);

    form.addEventListener("submit", addChannel);

    aside.appendChild(form);
}

function addCategory(event) {
    event.preventDefault();

    let form = event.target;

    let name = form.elements[0].value;

    if (name.length > 0) {
        let formData = new FormData();
        formData.append('cat-name', name);

        const options = {
            method: 'POST',
            body: formData
        };

        fetch('http://localhost:63342/bre01-distorsion/index.php?route=create-category', options)
            .then(response => response.json())
            .then(data => {
                console.log(data);
                addCategoryToAside(data.category);
            });
    }
}

function addChannel(event)
{
    event.preventDefault();

    let form = event.target;

    let category = form.elements[0].value;
    let name = form.elements[1].value;

    if(name.length > 0)
    {
        let formData = new FormData();
        formData.append('chan-name', name);
        formData.append('cat-id', category);

        const options = {
            method: 'POST',
            body: formData
        };

        fetch('http://localhost:63342/bre01-distorsion/index.php?route=create-channel', options)
            .then(response => response.json())
            .then(data => {
                console.log(data);
            });
    }
}

function toggleCategoryForm(event)
{
    let form = document.getElementById("add-category");
    let span = document.querySelector("#btn-add-category span");

    form.classList.toggle("closed");
    form.classList.toggle("open");
    span.classList.toggle("bi-plus-circle");
    span.classList.toggle("bi-dash-circle");

    form.addEventListener("submit", addCategory);
}

function toggleChannelForm(event)
{
    let dataCat;

    if(event.target.parentElement)
    {
        dataCat = event.target.parentElement.getAttribute("data-cat");
    }
    else
    {
        dataCat = event.target.getAttribute("data-cat");
    }

    let form = document.querySelector(`form[data-cat="${dataCat}"]`);
    let span = document.querySelector(`button[data-cat="${dataCat}"] span`);

    form.classList.toggle("closed");
    form.classList.toggle("open");
    span.classList.toggle("bi-plus-circle");
    span.classList.toggle("bi-dash-circle");

    form.addEventListener("submit", addChannel);
}

export default () => {
    let addCategoryBtn = document.getElementById("btn-add-category");
    let addChannelBtns = document.querySelectorAll(".btn-add-channel");

    addCategoryBtn.addEventListener("click", toggleCategoryForm);
    addChannelBtns.forEach((btn) => {
        btn.addEventListener("click", toggleChannelForm);
    })
};