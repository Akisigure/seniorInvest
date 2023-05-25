$.ajax({
    url: '/notices',
    type: 'GET',
    success: function(response) {
        var noticeList = $('#notice-list');  // HTML 페이지에서 공지사항을 표시할 div 요소 선택

        // 서버로부터 받은 각 공지사항에 대하여
        response.forEach(function(notice) {
            // 공지사항 제목, 내용, 날짜를 표시할 div 요소 생성
            var noticeElement = $('<div>');
            
            // 공지사항 제목 표시
            var titleElement = $('<h2>').text(notice.title);
            noticeElement.append(titleElement);

            // 공지사항 내용 표시
            var contentElement = $('<p>').text(notice.content);
            noticeElement.append(contentElement);

            // 공지사항 날짜 표시
            var dateElement = $('<p>').text(notice.date);
            noticeElement.append(dateElement);

            // 공지사항을 목록에 추가
            noticeList.append(noticeElement);
        });
    }
});

$(document).ready(function () {
    $.ajax({
        url: '/notices',
        type: 'GET',
        success: function(response) {
            var noticeList = $('#notice-list');
            response.forEach(function(notice) {
                var noticeElement = $('<div>').text(notice.title + ': ' + notice.content);
                noticeList.append(noticeElement);
            });
        },
        error: function(error) {
            console.log(error);
        }
    });
});