import TomSelect from 'tom-select/dist/js/tom-select.popular'

document.addEventListener('DOMContentLoaded', () => {
    const bookAuthorNames = document.querySelector('#book_author_names');

    if (bookAuthorNames !== null) {
        new TomSelect(bookAuthorNames, {
            maxItems: 5,
            persist: false,
            createOnBlur: true,
            placeholder: 'Select an author...',
            create: true,
            plugins: {
                remove_button: {
                    title: 'Remove',
                },
            },
        });
    }

});



