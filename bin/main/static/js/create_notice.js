$(document).ready(function () {
    $('#notice-form').submit(function (e) {
        e.preventDefault();

        // 폼 데이터를 객체로 가져옵니다.
        var formData = {
            'title': $('#title').val(),
            'content': $('#content').val()
        };

        // 서버로 POST 요청을 보냅니다.
        $.ajax({
            type: 'POST',
            url: '/notices',
            data: JSON.stringify(formData),
            contentType: 'application/json',
            success: function (response) {
                if (response) {
                    // 공지사항 추가 성공
                    window.location.href = '/notices';
                } else {
                    // 공지사항 추가 실패
                    console.error('Failed to add notice.');
                }
            },
            error: function (error) {
                console.error('Error:', error);
            }
        });
    });
});
