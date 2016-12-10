$(document).on("turbolinks:load", CommentSetup);

function CommentSetup() {
    onEnterSubmitComment();
    $('.comment-text').linkify();

}
function onEnterSubmitComment(){
    $(".comment-form-text").keypress(function(event) {
        if (event.which == 13) {
            event.preventDefault();
            $("#" + event.currentTarget.form.id).submit()
        }
    });
}
