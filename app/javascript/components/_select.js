import TomSelect from 'tom-select/dist/js/tom-select.popular'

document.addEventListener('DOMContentLoaded', () => {
    const bookAuthorNames = document.querySelector('#book_author_names');
    const bookGenres = document.querySelector('#book_genre_ids');

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

    if (bookGenres !== null) {
        new TomSelect(bookGenres, {
            maxItems: 6,
            persist: false,
            createOnBlur: true,
            placeholder: 'Select an genre...',
            create: true,
            plugins: {
                remove_button: {
                    title: 'Remove',
                },
            },
        });
    }

});



