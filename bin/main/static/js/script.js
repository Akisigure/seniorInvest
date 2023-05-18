$(document).ready(function () {
    const sections = $("section");
    const animationDuration = 100; // 애니메이션 지속 시간 (밀리초 단위)
    let isAnimating = false;

    function scrollToSection(index) {
        if (isAnimating || index < 0 || index >= sections.length) return;
        isAnimating = true;
        const target = $(sections[index]);
        const windowHeight = $(window).height();
        const sectionHeight = target.outerHeight();
        const offset = target.offset().top - (windowHeight - sectionHeight) / 2;
        $("html, body").animate(
            {
                scrollTop: offset,
            },
            animationDuration,
            function () {
                isAnimating = false;
            }
        );
    }

    $(window).on("wheel", function (event) {
        if (isAnimating) return;
        const direction = event.originalEvent.deltaY > 0 ? 1 : -1;
        const currentSectionIndex = Math.floor(
            ($(window).scrollTop() + $(window).height() / 2) / $(window).height()
        );
        scrollToSection(currentSectionIndex + direction);
        event.preventDefault();
    });
});
$(document).ready(function() {
    var url = window.location.href.split('?')[0];
    $('ul.navbar-nav a.nav-link').each(function() {
        var navLinkUrl = this.href.split('?')[0];
        if (url == navLinkUrl) {
            $(this).closest('li').addClass('active');
        }
    });
});
