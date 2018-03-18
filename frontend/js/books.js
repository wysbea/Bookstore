$(function () {
    var $form = $('#bookAdd');
    var $bookList = $('#booksList');
    var $bookEditSelect = $('#bookEditSelect');
    var $bookEditForm = $('#bookEdit');
    var $authorSelect = $('#author_id');
    var $authorIdEdit = $('#author_id_edit');


    //add books
    $form.on('submit', function (event) {
        event.preventDefault();

        var title = $('#title').val(),
            description = $('#description').val(),
            bookAuthorId = $authorSelect.val();

        var newBook = {
            title: title,
            description: description,
            author_id: bookAuthorId
        };

        $.ajax({
            url: '../rest/rest.php/book',
            type: 'POST',
            dataType: 'json',
            data: newBook
        })
            .done(function (response) {
                renderBook(response.success[0]);
                renderEditSelect(response.success[0]);
                showModal("Pomyślnie dodano książkę!");

            })
            .fail(function (error) {
                console.log('Błąd dodania książki', error);
            });
    });

    function getBooks() {
        $.ajax({
            url: '../rest/rest.php/book',
            type: 'GET'
        })
            .done(function (response) {
                for (var i = 0; i < response.success.length; i++) {
                    renderBook(response.success[i]);
                    renderEditSelect(response.success[i]);

                }
            })
            .fail(function (error) {
                console.log('Create book error', error);
            });
    }

    function renderBook(book) {
        var string = `<li class="list-group-item">
                        <div class="panel-heading">
                        <span class="bookTitle" data-id="${book.id}">${book.title}</span>
                        <button data-id="${book.id}" class="btn btn-danger pull-right btn-xs btn-book-remove">
                        <i class="fa fa-trash"></i></button>
                        <button data-id="${book.id}" class="btn btn-primary pull-right btn-xs btn-book-show-description">
                        <i class="fa fa-info-circle"></i></button>
                        </div>
                        <div class="panel-body book-description">                      
                        </div>
                        </li>`;

        $bookList.html($bookList.html() + string);
    }

    //shows Edit book
    $bookEditSelect.on('change', function () {
        var id = $(this).val();

        $.ajax({
            url: '../rest/rest.php/book/' + id,
            type: 'GET'
        })
            .done(function (response) {

                var bookTitle = $bookEditForm.find('#title');
                var bookDesc = $bookEditForm.find('#description');
                var bookId = $bookEditForm.find('#id');

                bookId.val(response.success[0].id);
                bookTitle.val(response.success[0].title);
                bookDesc.val(response.success[0].description);

                $bookEditForm.slideDown();

            })
            .fail(function (error) {
                console.log('Błąd edycji książki', error);
            });
    });

    $('body').on('submit', '.bookEditForm', function (element) {

        element.preventDefault();
        var id = $(this).find('#id').val();

        console.log(id);

        var bookTitle = $bookEditForm.find('#title').val();
        var bookDesc = $bookEditForm.find('#description').val();
        var bookAuthorEditId = $authorIdEdit.val();

        var editedBook = {
            title: bookTitle,
            description: bookDesc,
            author_id: bookAuthorEditId
        };

        console.log('Ajax');

        $.ajax({
            url: '../rest/rest.php/book/' + id,
            type: 'PATCH',
            data: editedBook
        })
            .done(function (response) {
                console.log('done, book id: ' + id + " edited in db");
                $bookEditForm.slideUp();

                console.log(id);

                var $bookListTitle = $('[class="bookTitle"][data-id=' + id + ']');
                $bookListTitle.text(response.success[0].title);

            })
            .fail(function (error) {
                console.log('Fail');
                console.log('Błąd edycji książki', error);
                console.log(JSON.stringify(error));
            });

    })


    //delete books
    $('body').on('click', '.btn-book-remove', function () {
        var id = $(this).data('id');
        var that = $(this);

        $.ajax({
            url: '../rest/rest.php/book/' + id,
            type: 'DELETE'
        })
            .done(function (response) {
                that.closest('.list-group-item').remove();
                $bookEditSelect.find("option[value=\"" + id + "\"]").remove();
                showModal("Pomyśłnie usunięto książkę!");
            })
            .fail(function (error) {
                console.log('Błąd usunięcia książki', error);
            });
    });


    $('body').on('click', '.btn-book-show-description', function () {
        var id = $(this).data('id');
        var that = $(this);
        $.ajax({
            url: '../rest/rest.php/book/' + id,
            type: 'GET'
        })
            .done(function (response) {
                var descElement = that.closest('.list-group-item').find('.book-description');

                descElement.text(response.success[0].description);
                descElement.slideToggle();

            })
            .fail(function (error) {
                console.log('Błąd dodania książki', error);
            });
    });





    function renderEditSelect(book) {
        var string = `<option value="${book.id}">${book.title}</option>`;
        $bookEditSelect.html($bookEditSelect.html() + string);
    }

    function renderAuthorSelect(author) {
        var string = `<option value="${author.id}">${author.name} ${author.surname}</option>`;
        $authorSelect.html($authorSelect.html() + string);
    }

    function renderAuthorIdEdit(author) {
        var string = `<option value="${author.id}">${author.name} ${author.surname}</option>`;
        $authorIdEdit.html($authorIdEdit.html() + string);
    }

    function getAuthors() {
        $.ajax({
            url: '../rest/rest.php/author',
            type: 'GET'
        })
            .done(function (response) {
                for (var i = 0; i < response.success.length; i++) {
                    renderAuthorSelect(response.success[i]);
                    renderAuthorIdEdit(response.success[i]);

                }
            })
            .fail(function (error) {
                console.log('Create author error', error);
            });
    }

    getAuthors();
    getBooks();


});