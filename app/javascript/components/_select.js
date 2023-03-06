import TomSelect from 'tom-select/dist/js/tom-select.popular'

document.addEventListener('DOMContentLoaded', () => {
    new TomSelect("#book_author_names", {
        maxItems: 5,
        persist: false,
        createOnBlur: true,
        placeholder: 'Select a author...',
        create: true,
        plugins: {
            remove_button: {
                title: "Remove",
            },
        },
    });

});



