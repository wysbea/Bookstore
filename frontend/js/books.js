$(function () {
    var $bookAddForm = $('#bookAdd')


    //funkcja dodająca książkę
    $.get('http://localhost/Bookstore/rest/rest.php/book')
        .done(function (data) {
            // console.log('get data', data)
            if (data.success && data.success.length > 0) {
                data.success.forEach(function (elm) {
                    createNewBook(elm)
                })
            }
        })

    $bookAddForm.on('submit', function (event) {
        event.preventDefault()

        $.post('http://localhost/Bookstore/rest/rest.php/book', $(this).serialize())
            .done(function (data) {
                // console.log('submit', data)
                if (data.success && data.success.length > 0) {
                    createNewBook(data.success[0])
                }
            })
    })
})


let createNewBook = (book) => {
    let $booksList = $('#booksList')
    let $li = $('<li>', {class: 'list-group-item'})
    let $panel = $('<div>', {class: 'panel panel-default'})
    let $heading = $('<div>', {class: 'panel-heading'})
    let $bookTitle = $('<span>', {class: 'bookTitle'})
    let $buttonRemove = $('<button class="btn btn-danger pull-right btn-xs btn-book-remove"><i class="fa fa-trash"></i></button>')
    let $buttonShowDescription = $('<button class="btn btn-primary pull-right btn-xs btn-book-show-description"><i class="fa fa-info-circle"></i></button>')
    let $bookDescription = $('<span>', {class: 'panel-body book-description'})

    $bookTitle.text(book.title)
    $bookDescription.text(book.description)
    $buttonRemove.attr('data-id', book.id)
    $buttonShowDescription.attr('data-id', book.id)

    $heading.append($bookTitle).append($buttonRemove).append($buttonShowDescription)
    $panel.append($heading).append($bookDescription)
    $li.append($panel)
    $booksList.append($li)
}

//wyświetlanie opisu (description) danej książki
$(document).on('click', '.btn-book-show-description', function () {
    var id = $(this).data('id');
    var that = $(this);
    $
        .ajax({
            url: '../rest/rest.php/book/' + id,
            type: 'GET'
        })
        .done(function (response) {
            var descElement = that.closest('.list-group-item').find('.book-description');

            descElement.text(response.success[0].description);
            descElement.slideToggle()
        })
        .fail(function (error) {
            console.log('Błąd', error);
        })
})


//Usuwanie książki
$(document).on('click', '.btn-book-remove', function () {
    var id = $(this).data('id')
    var that = $(this)
    $
        .ajax({
            url: '../rest/rest.php/book/' + id,
            type: 'DELETE'
        })
        .done(function (response) {
            that.closest('.list-group-item').remove()
            console.log('Książka została usunięta', response)

        })
        .fail(function (error) {
            console.log('Błąd usunęcia książki', error)
        })
})

//Zaznaczanie książki do edycji
var $bookEditSelect = $('#bookEditSelect')
var $bookEditForm = $('#bookEdit')

$bookEditSelect.on('change', function () {
    var id = $(this).val();


    $.ajax({
        url: '../rest/rest.php/book/' + id,
        type: 'GET'
    })
        .done(function (response) {

            //reference directly to the element,
            var bookTitle = $bookEditForm.find('#title')
            var bookDesc = $bookEditForm.find('#description')
            var bookId = $bookEditForm.find('#id')

            //use val() instead of .text() to add value to input it into element
            bookId.val(response.success[0].id)
            bookTitle.val(response.success[0].title)
            bookDesc.val(response.success[0].description)

            $bookEditForm.slideDown()

        })
        .fail(function (error) {
            console.log('Edit book error', error)
        })
})
$('body').on('submit', '.bookEditForm', function (element) {

    element.preventDefault();
    var id = $(this).find('#id').val()

    console.log(id)

    var bookTitle = $bookEditForm.find('#title').val()
    var bookDesc = $bookEditForm.find('#description').val()
   // var bookAuthorEditId = $authorIdEdit.val()



    var editedBook = {
        title: bookTitle,
        description: bookDesc,
       // author_id: bookAuthorEditId
    };

    console.log('Ajax')
    //ajax query - edits book title and/or description in db
    $.ajax({
        url: '../rest/rest.php/book/' + id,
        type: 'PATCH',
        data: editedBook
    })
        .done(function (response) {
            console.log('done, book id: ' + id + " edited in db")
            $bookEditForm.slideUp()

            //here should edit the relevant id in books list
            console.log(id);
            //updates relevant existing book list title
            var $bookListTitle = $('[class="bookTitle"][data-id=' + id + ']')
            $bookListTitle.text(response.success[0].title);


        })
        .fail(function (error) {
            console.log('Fail')
            console.log('Edit book error', error)
            console.log(JSON.stringify(error))
        })

})








