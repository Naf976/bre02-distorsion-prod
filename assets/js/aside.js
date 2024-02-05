function addCategory(event)
{
    event.preventDefault();

    let form = event.target;

    let name = form.elements[0].value;

    if(name.length > 0)
    {
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