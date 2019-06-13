//= require jquery
//= require jquery_ujs
//= require popper
//= require bootstrap
//= require_tree .

if($('.article .article__meta_buttons').length) {
    $('.article').mousedown(function () {
        var x = document.getElementById(this.id);
        $( '.article__meta_buttons', x ).fadeIn( "fast")
    });

    $('.article').mouseleave(function () {
        var x = document.getElementById(this.id);
        $( '.article__meta_buttons', x ).fadeOut( "fast")
    });
}



$('#aside__toggle').click(function () {
    $('.heartlike__aside').toggleClass('toggled');
});