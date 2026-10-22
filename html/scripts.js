document.addEventListener('DOMContentLoaded', function() {
    const customsMenu = document.getElementById('customsMenu');
    const closeButton = document.getElementById('closeButton');
    const saveButton = document.getElementById('saveButton');

    // Handle close button click
    closeButton.addEventListener('click', function() {
        fetch('https://qb-customs/closeMenu', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json; charset=UTF-8',
            },
            body: JSON.stringify({})
        }).then(resp => resp.json()).then(resp => {
            customsMenu.style.display = 'none';
        });
    });

    // Handle save button click
    saveButton.addEventListener('click', function() {
        fetch('https://qb-customs/saveModifications', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json; charset=UTF-8',
            },
            body: JSON.stringify({})
        }).then(resp => resp.json()).then(resp => {
            // Handle save response
        });
    });

    // Handle NUI messages
    window.addEventListener('message', function(event) {
        const item = event.data;
        if (item.action === 'openCustomsMenu') {
            customsMenu.style.display = 'block';
            customsMenu.style.backgroundColor = `rgba(${item.color.r}, ${item.color.g}, ${item.color.b}, ${item.color.a / 255})`;
        }
    });
});