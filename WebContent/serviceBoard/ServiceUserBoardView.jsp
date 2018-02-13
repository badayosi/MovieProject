<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<p><span id="boldSpan">문의사항이나 불편사항은 이 곳에 남겨주세요. 최대한 빠른 시간 안에 답변 드리겠습니다.</span></p>
		<p><span id="graySpan">금요일 오후 6시 이후 접수된 문의는 그 다음주에 처리될 수 있습니다. FAQ를 이용하시면 궁금증을 더 빠르게 해결하실 수 있습니다.</span></p>
		<div id="serviceheaderWrap">
			<h3>문의 하기</h3>
			<p><span class="redstar">*</span>표시 황목은 필수 입력 항목입니다.</p>
		</div>
		<form action="serviceInsert.do" method="post" id="service_form" enctype="multipart/form-data">
			<p class="service_div">
				<label><span class="redstar">*</span>문의종류</label>
				<span class="lineSpan"></span>
				<input type="radio" value="문의" name="consulting" checked="checked"><span class="radioBtn">문의</span>
				<input type="radio" value="칭찬" name="consulting"><span class="radioBtn">칭찬</span>
				<input type="radio" value="불만" name="consulting"><span class="radioBtn">불만</span>
				<input type="radio" value="건의" name="consulting"><span class="radioBtn">건의</span>
			</p>
			<p class="service_div">
				<label><span class="redstar">*</span>분류</label>
				<span class="lineSpan"></span>
				<select name="classification">
					<option selected="selected">분류 선택</option>
					<option>상영관 문의</option>
					<option>영화 문의</option>
					<option>회원및 포인트 문의</option>
					<option>결제 및 관람권 문의</option>
					<option>홈페이지 이용 문의</option>
				</select>
			</p>
			<p class="service_div">
				<label><span class="redstar">*</span>제목</label>
				<span class="lineSpan"></span>
				<input type="text" name="title" id="titleInput">
			</p>
			<p class="service_div" id="contentWrap">
				<label><span class="redstar">*</span>내용</label>
				<span class="lineSpan" id="contentLine"></span>
				<textarea rows="" cols="" name="content" id="content_ta"></textarea>
			</p>
			<p class="service_div">
				<label>첨부파일</label>
				<span class="lineSpan"></span>
				<input type="file" name="fileName" id="fileInput">
			</p>
			<p id="btnGroup">
				<input type="button" value="취소" id="cencelBtn">
				<input type="submit" value="확인" id="submitBtn">
			</p>
		</form>