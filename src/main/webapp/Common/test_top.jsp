<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <script>
        // Video객체를 저장할 전역변수
        var video;
        onload=function(){
            // 각 엘리먼트의 DOM을 획득
            var currentSpan = document.getElementById("currenttime");
            var totalSpan = document.getElementById('totaltime');
            // video의 DOM을 획득
            video = document.getElementById('video');
            // 첫 재생시의 볼륨 설정
            video.volume=0.5;
            /* 
            동영상 재생시 지속적으로 발생되는 timeupdate()이벤트를 처리할 리스너 생성
            currentTime : 현재 재생시간을 반환
            duration : 전체 재생시간을 반환
            */
            video.addEventListener('timeupdate', function(){
                // 재생시간을 화면에 출력
                currentSpan.innerHTML = timeShow(video.currentTime);
                totalSpan.innerHTML = video.duration;

                // 반환되는 시간을 통해 프로그레스바를 설정
                progress.max=video.duration;
                progress.value=video.currentTime;
            })
        }
        // 재생
        function play(){
            // 화면을 숨기고 싶을때 사용하는 속성
            video.hidden="";
            video.play();
        }
        // 일시정지
        function stop(){
            video.hidden=true;
            video.pause();
        }
        // 처음부터 다시 재생
        function start(){
            // 재생시간을 강제로 0으로 설정
            video.currentTime=0;
            video.play();
        }
        /* 
        timeupdate 이벤트를 통해 반환받은 재생시간은 123.xxx와 같은 형태이므로
        가독성을 높여주기 위해 00:00:00형식으로 변환 후 출력
        */
        function timeShow(seconds){
            // 시간을 반올림 처리
            seconds = Math.round(seconds);
            var h = parseInt(seconds/3600);
            var m = parseInt((seconds%3600)/60);
            var s = parseInt(seconds%60);

            /* 
            만약 구한 시간이 10보다 작은 경우 0:0:0과 같이 출력되므로 강제로
            0을 붙여 두자리의 포맷을 생성
            */
            var hour = (h<10)?'0'+h:h;
            var min = (m<10)?'0'+m:m;
            var sec = (s<10)?'0'+s:s;

            return hour+':'+min+":"+sec;
        }
        // 볼륨조절 (0~1사이로 조절가능)
        function setVolumn(value){
            if(value==0){
                // 볼륨 0이면 음소거 처리
                video.muted=true;
            }
            else{
                // 볼륨 0이 아닐 경우 음소거를 해제
                video.muted = false;
                var nowVolume = video.volume;
                if(value==1){
                    // 만약 볼륨이 1을 초과하면 1로 맞춤설정
                    nowVolume+=0.1;
                    video.volume=(nowVolume>1)?1:nowVolume;
                }else{
                    // 만약 음수가 되면 0으로 맞춤설정
                    nowVolume -= 0.1;
                    video.volume=(nowVolume<0)?0:nowVolume;
                }
            }
        }
        // 재생속도 조절
        function setPlaybackRate(value){
            if(value==1){
                video.playbackRate+=0.25;
            }else{
                video.playbackRate-=0.25;
            }
        }
        // 건너뛰기(skip)
        function setTime(value){
            if(value==1){
                video.currentTime+=10;
            }else{
                video.currentTime-=10;
            }
        }
    </script>
    <style>
        div {
            border: 1px solid red;
            width: 300px;
        }
        input {
            position: relative;	z-index: 2; height: 40px; line-height: 35px;
            background-color: #333;	border: 2px solid #333;
            color: #fff;
        }
        input:hover {
            background-color: #fff; border-color: #59b1eb; color: #59b1eb;
        }
        input::before, input::after {
            top: 0; width: 50%; height: 100%;
            background-color: #333;
        }
        input:hover::before, input:hover::after {
            width: 0; background-color: #59b1eb;
        }
    </style>
</head>
<body>
    <h2>Javascript를 이용한 커스텀 비디오 만들기</h2>
    <!--
        autoplay : 자동재생
        muted : 첫 재생시 음소거 상태로 시작
        controols : 컨트롤 바 보임 여부 설정
        poster : 인트로 화면을 이미지로 대체
    -->
    <div>
        <video id="video" width="300" height="200"
        src="media/video.mp4" muted autoplay
        poster="images/html5.png"></video>
    </div>
    <!-- 재생 진행상황 표시 -->
    <div>
        <progress value="0" id="progress" style="width: 300px;"></progress>
    </div>
    <!-- 현재 재생시간 / 총 재생시간 표시 -->
    <div>
        <span id="currenttime"></span> / <span id="totaltime"></span>
    </div>
    <input type="button" value="재생하기" onclick="play();">
    <input type="button" value="일시정지" onclick="stop();">
    <input type="button" value="처음부터 재생하기" onclick="start();">
    <input type="button" value="볼륨+" onclick="setVolumn(1);">
    <input type="button" value="볼륨-" onclick="setVolumn(-1);">
    <input type="button" value="음소거" onclick="setVolumn(0);">
    <input type="button" value="재생속도+" onclick="setPlaybackRate(1);">
    <input type="button" value="재생속도-" onclick="setPlaybackRate(-1);">
    <input type="button" value="10초앞으로" onclick="setTime(1);">
    <input type="button" value="10초뒤로" onclick="setTime(-1);">
</body>
</html>
