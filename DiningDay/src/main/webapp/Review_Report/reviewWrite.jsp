
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>아이티윌 2강 1조</title> 
    <link href="Review_Report/css/star_point1.css" rel="stylesheet"/>
</head>

<%@ include file="/Template/header.jsp"%> 
<script src="Review_Report/js/reviewWrite.js"></script>
	<!-- main은 속성 값은 왠만하면 건들지x -->
	<main style="display: flex; align-items: center; text-align: center; padding: 100px 50px 20px 50px;">
		<!-- 예시div style속성 값 조절해서 사용! -->
		<div class="mainContainer"
			style="width: 100%; height: 100%; background: white; padding-bottom:20px; margin-bottom: 10px;">
			<form method="post" action="reviewWritePro.re" id="myform" enctype="multipart/form-data">
				<h4 style="text-align: left; padding-top: 20px;">&lt; 리뷰 평가 &gt;</h4>
				<hr>
				<div class="container">
				<h2 id="2" >이 가게를 추천하시겠어요?</h2>
				 <fieldset>
						<span class="text-bold">별점을 선택해주세요</span> <input type="radio"
							name="rev_score" value="5" id="rate1"><label for="rate1">★</label>
						<input type="radio" name="rev_score" value="4" id="rate2"><label
							for="rate2">★</label> <input type="radio" name="rev_score"
							value="3" id="rate3"><label for="rate3">★</label> <input
							type="radio" name="rev_score" value="2" id="rate4"><label
							for="rate4">★</label> <input type="radio" name="rev_score"
							value="1" id="rate5"><label for="rate5">★</label>
					</fieldset>	
					<table class="table table-hover">
						<tbody>
							<tr>	
								<td>
									<input type="hidden" name="cus_no" value="${sessionScope.CUS_NO}">
									<input type="hidden" name="res_no" value="${requestScope.RES_NO }">
									<input type="text" class="form-control"
										name="cus_nick" value="${requestScope.nick }" readonly="readonly">
								</td>
							</tr>
							<tr>
								<td>
									<input type="text" class="form-control"
									value="${requestScope.store_name }" name="store_name" maxlength="40" readonly="readonly" >
								</td>
							</tr>
							<tr>
								<td><input type="file" class="form-control"
									placeholder="사진첨부" name="rev_image"  maxlength="40">
								</td>
									
							</tr>
							<tr>
								<td><textarea class="form-control review_content"
										placeholder="리뷰 내용을 작성하세요" name="rev_content" maxlength="1024"
										style="height: 400px;" ></textarea></td>
							</tr>
						</tbody>
					</table>
					<hr>
					<input id="insertBtn" type="submit" class="btn btn-outline-success" value="등록">
					<input type="button" class="btn btn-outline-dark" value="취소" onclick="window.history.back()">
				</div>
			</form>
		</div>
	</main>
<%@ include file="/Template/footer.jsp"%>
</html> 