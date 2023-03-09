window.addEventListener("trix-file-accept", function (event) {
    const acceptedTypes = ['image/jpeg', 'image/png']
    if (!acceptedTypes.includes(event.file.type)) {
        event.preventDefault()
        alert("Only jpeg or png files can be uploaded")
    }
})