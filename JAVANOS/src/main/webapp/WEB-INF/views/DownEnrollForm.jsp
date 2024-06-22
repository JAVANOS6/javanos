<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .down-enroll {
        display: flex;
        width: 1200px;
    }

    .label-below {
        display: flex;
        flex-direction: column;
        width: 150px;
    }

    table {
        width: 100%;
    }
</style>
</head>
<body>
<jsp:include page="../common/menubar.jsp"/>


	
			<form action="${ pageContext.servletContext.contextPath }/down/enroll" method="post">
				 <div class="down-enroll">
                        <div class="label-below">
                            <span><select name="presentgeton">
                                <option value="1">잠실역 </option>
                                <option value="2">잠실나루 </option>
                                <option value="3"> 잠실새내</option>
                                </select>
                            </span>
                            <span>승차해 있는 역</span>
                        </div>
                    
            
                        <div class="label-below">
                            <span><select name="dropstation">
                                <option value="1">잠실역 </option>
                                <option value="2">잠실나루 </option>
                                <option value="3"> 잠실새내</option>
                                </select>
                            </span>
                        하차 할 역 이름
                    </div>
                 
                        <div class="label-below">
                            <span><select name="rommno">
                                <option>1-1</option>
                                <option >1-2</option>
                                <option>2-1</option>
                                </select>
                            </span>
                        칸 번호
     
                    </div>
                    
                        <div class="label-below">
                        혼잡도
                        <span>
                            <input type="radio" name="chk_info" value="high">상
                            <input type="radio" name="chk_info" value="medium">중
                            <input type="radio" name="chk_info" value="low">하
                        </span>
                    </div>
            <button type="submit" onclick="alert('등록되었습니다')">등록</button>
        </div>
			</form>
</body>
</html>