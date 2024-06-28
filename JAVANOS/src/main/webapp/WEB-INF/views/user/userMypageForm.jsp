<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Javanos</title>
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/user/userMypageForm.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
    <%@ include file="../common/menubar.jsp" %>

    <div class="mypage-wrapper">
        <h2>마이페이지</h2>
        <form action="${ pageContext.servletContext.contextPath }/user/mypage" method="post" id="mypage-form">
            <table>
                <tr>
                    <td><label for="userId">아이디</label></td>
                    <td colspan="2"><input type="text" name="userId" id="userId" value="${ sessionScope.loginUser.userId }" readonly></td>
                </tr>
                <tr>
                    <td><label for="currentPwd">현재 비밀번호</label></td>
                    <td colspan="2"><input type="password" name="currentPwd" id="currentPwd" disabled></td>
                    <td><input type="button" id="changePwdBtn" value="변경"></td>
                </tr>
                <tr>
                    <td></td>
                    <td colspan="3"><span id="userPwd" class="message"></span></td>
                </tr>
                <tr>
                    <td><label for="newPwd">새 비밀번호</label></td>
                    <td colspan="2"><input type="password" name="newPwd" id="newPwd" disabled></td>
                </tr>
                <tr>
                    <td></td>
                    <td colspan="3"><span id="userPwdType" class="message"></span></td>
                </tr>
                <tr>
                    <td><label for="confirmPwd">새 비밀번호 확인</label></td>
                    <td colspan="2"><input type="password" name="confirmPwd" id="confirmPwd" disabled></td>
                </tr>
                <tr>
                    <td></td>
                    <td colspan="3"><span id="userPwdCheckType" class="message"></span></td>
                </tr>
                <tr>
                    <td><label for="userName">이름</label></td>
                    <td colspan="2"><input type="text" name="userName" id="userName" value="${ sessionScope.loginUser.userName }" readonly></td>
                </tr>
                <tr>
                    <td><label for="userNickname">닉네임</label></td>
                    <td colspan="2"><input type="text" name="userNickname" id="userNickname" value="${ sessionScope.loginUser.userNickname }" required readonly></td>
                    <td><input type="button" id="changeNicknameBtn" value="변경"></td>
                </tr>
                <tr>
                    <td></td>
                    <td colspan="3"><span id="userNicknameType" class="message"></span></td>
                </tr>
                <tr>
                    <td><label for="userEmail">이메일</label></td>
                    <td colspan="2"><input type="email" name="userEmail" id="userEmail" value="${ sessionScope.loginUser.userEmail }" required readonly></td>
                    <td><input type="button" id="changeEmailBtn" value="변경"></td>
                </tr>
                <tr>
                    <td></td>
                    <td colspan="3"><span id="userEmailType" class="message"></span></td>
                </tr>
                <tr>
                    <td colspan="4" align="center"><input type="submit" id="updateBtn" value="수정"></td>
                </tr>
                <tr>
                    <td colspan="2"><input type="button" id="cancelBtn" value="취소"></td>
                    <td colspan="2"><input type="button" id="deleteBtn" value="회원탈퇴"></td>
                </tr>
            </table>
        </form>
    </div>

    <script>
    $(document).ready(function() {
        // 취소 버튼 클릭 시 메인페이지
        $("#cancelBtn").click(function() {
            window.location.href = "${ pageContext.request.contextPath }";
        });

        // 회원탈퇴 버튼 클릭 시 알림창
        $("#deleteBtn").click(function() {
            if (confirm("회원탈퇴 하시겠습니까?")) {
                var form = document.getElementById("mypage-form");
                form.action = "${ pageContext.servletContext.contextPath }/user/delete";
                form.submit();
            }
        });

        // 수정 버튼 클릭 시 동작
        $("#updateBtn").click(function(e) {
            // 입력 필드가 검사 중인 경우 수정을 막음
            if ($('#changeNicknameBtn').val() === '검사' || $('#changeEmailBtn').val() === '검사' || $('#changePwdBtn').val() === '검사') {
                e.preventDefault(); // 기본 이벤트(폼 전송) 막기
                alert("검사 중인 항목이 있습니다. \n수정을 완료해주세요.");
            }
        });
        
        // 비밀번호 변경 버튼 클릭 시 동작
        $('#changePwdBtn').click(function(){
        	if($(this).val() === '변경') {	// 변경 버튼 클릭 시
        		$('#currentPwd, #newPwd, #confirmPwd').prop('disabled', false);
        		$('#currentPwd').focus();
        		$(this).val('검사');
        	} else {	// 검사 버튼 클릭 시
        		validateNewPwd();	// 비밀번호 유효성 검사
        	}
        });
        
     	// 비밀번호 유효성 검사 함수
     	// 특수문자(!@#$%^&*?_) 가능
        function validateNewPwd() {
     		let currentPwd = $("#currentPwd").val().trim();
            let newPwd = $("#newPwd").val().trim();
            let confirmPwd = $("#confirmPwd").val().trim();

            let userPwdPattern = /^(?=.*[A-Za-z])(?=.*\d)|(?=.*[A-Za-z])(?=.*[!@#$%^&*?_])|(?=.*\d)(?=.*[!@#$%^&*?_])[A-Za-z\d!@#$%^&*?_]{8,16}$/;
            
            if( currentPwd === "") {
                $("#userPwd").text("현재 비밀번호는 필수입니다.").removeClass('valid').addClass('invalid');
            } else {
            	let userId = '${ sessionScope.loginUser.userId }';
            	$.ajax({
                    url: "${pageContext.servletContext.contextPath}/user/check-pwd",
                    type: "post",
                    data: {userId: userId,
                    		userPwd: currentPwd
                    		},
                    success: function(data) {
                        if (data.trim() === 'valid') {
                            $("#userPwd").text("현재 비밀번호가 일치합니다.").removeClass('invalid').addClass('valid');
                        } else {
                            $("#userPwd").text("현재 비밀번호가 일치하지 않습니다.").removeClass('valid').addClass('invalid');
                        }
                    },
                    error: function(error) {
                        $("#userPwd").text("비밀번호 확인 중 오류가 발생하였습니다.").removeClass('valid').addClass('invalid');
                    }
                });
            }

            if (newPwd === "") {
                $("#userPwdType").text("새 비밀번호는 필수입니다.").removeClass('valid').addClass('invalid');
            } else if (!userPwdPattern.test(newPwd)) {
                $("#userPwdType").text("비밀번호는 8~16자의 영문자, 숫자, 특수문자 중 2가지 이상을 사용해야 합니다.").removeClass('valid').addClass('invalid');
            } else {
                $("#userPwdType").text("사용할 수 있는 비밀번호 형식입니다.").removeClass('invalid').addClass('valid');
            }

            if (confirmPwd !== "" && newPwd === confirmPwd) {
                $("#userPwdCheckType").text("비밀번호가 일치합니다.").removeClass('invalid').addClass('valid');
            } else if (confirmPwd !== "" && newPwd !== confirmPwd) {
                $("#userPwdCheckType").text("비밀번호가 일치하지 않습니다.").removeClass('valid').addClass('invalid');
            } else {
                $("#userPwdCheckType").text("새 비밀번호 확인은 필수입니다.").removeClass('valid').addClass('invalid');
            }
        }

        // 닉네임 변경 버튼 클릭 시
        $('#changeNicknameBtn').click(function() {
            if ($(this).val() === '변경') { // 변경 버튼 클릭 시
                $('#userNickname').prop('readonly', false); // 입력 필드 활성화
                $('#userNickname').focus();
                $(this).val('검사'); // 버튼 텍스트 변경
            } else { // 검사 버튼 클릭 시
                var newNickname = $('#userNickname').val().trim();
                validateUserNickname(newNickname); // 유효성 검사
            }
        });

        // 닉네임 유효성 검사 함수
        function validateUserNickname(userNickname) {
            let userNicknamePattern = /^[가-힣a-zA-Z0-9]{2,15}$/;

            if (userNickname === "") {
                $("#userNicknameType").text("닉네임은 필수입니다.").removeClass('valid').addClass('invalid');
            } else if (userNicknamePattern.test(userNickname)) {
                dupCheckUserNickname(userNickname);
            } else {
                $("#userNicknameType").text("닉네임은 2~15자의 한글, 영문자, 숫자만 사용 가능합니다.").removeClass('valid').addClass('invalid');
            }
        }

        // 닉네임 중복 체크 함수
        function dupCheckUserNickname(userNickname) {
            $.ajax({
                url: "${ pageContext.servletContext.contextPath }/user/check-nickname",
                type: "post",
                data: {userNickname: userNickname},
                success: function(data) {
                    if (data.trim() === 'pass') {
                        $("#userNicknameType").text("사용 가능한 닉네임입니다.").removeClass('invalid').addClass('valid');
                        $('#userNickname').val(userNickname); // 입력 필드에 값 설정
                        $('#userNickname').prop('readonly', true); // 입력 필드 비활성화
                        $('#changeNicknameBtn').val('변경'); // 버튼 텍스트 원래대로 변경
                    } else {
                        $("#userNicknameType").text("이미 사용 중인 닉네임입니다.").removeClass('valid').addClass('invalid');
                    }
                },
                error: function(error) {
                    $("#userNicknameType").text("닉네임 확인 중 오류가 발생하였습니다.").removeClass('valid').addClass('invalid');
                }
            });
        }

        // 이메일 변경 버튼 클릭 시
        $('#changeEmailBtn').click(function() {
            if ($(this).val() === '변경') {
                $('#userEmail').prop('readonly', false); // 입력 필드 활성화
                $('#userEmail').focus();
                $(this).val('검사'); // 버튼 텍스트 변경
            } else {
                var newEmail = $('#userEmail').val().trim();
                validateUserEmail(newEmail);	// 유효성 검사
            }
        });

        // 이메일 유효성 검사 함수
        function validateUserEmail(userEmail) {
            let userEmailPattern = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;

            if (userEmail === "") {
                $("#userEmailType").text("이메일은 필수입니다.").removeClass('valid').addClass('invalid');
            } else if (userEmailPattern.test(userEmail)) {
                dupCheckUserEmail(userEmail);
            } else {
                $("#userEmailType").text("유효하지 않은 이메일 형식입니다.").removeClass('valid').addClass('invalid');
            }
        }

        // 이메일 중복 체크 함수
        function dupCheckUserEmail(userEmail) {
            $.ajax({
                url: "${ pageContext.servletContext.contextPath }/user/check-email",
                type: "post",
                data: {userEmail: userEmail},
                success: function(data) {
                    if (data.trim() === 'pass') {
                        $("#userEmailType").text("사용 가능한 이메일입니다.").removeClass('invalid').addClass('valid');
                        $('#userEmail').val(userEmail); // 입력 필드에 값 설정
                        $('#userEmail').prop('readonly', true); // 입력 필드 비활성화
                        $('#changeEmailBtn').val('변경'); // 버튼 텍스트 원래대로 변경
                    } else {
                        $("#userEmailType").text("이미 사용 중인 이메일입니다.").removeClass('valid').addClass('invalid');
                    }
                },
                error: function(error) {
                    $("#userEmailType").text("이메일 확인 중 오류가 발생하였습니다.").removeClass('valid').addClass('invalid');
                }
            });
        }
    });
    </script>
</body>
</html>