<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>현재 페이지 타이틀 vd</title>
</head>
	<%@ include file="/Template/store_sidebar_open.jsp"%> 	
	
    	<!-- main은 속성 값은 왠만하면 건들지x -->
		<main style="display: flex;  align-items: center; text-align: center; padding:20px;">
			
			<!-- 예시div style속성 값 조절해서 사용! -->
			<div class="mainContainer" style="width: 100%; height: 850px; background:white; ">
				<!--
    참고 : 이 페이지는 리뷰 아이템입니다
    사용되는 페이지들 : 상품상세 리뷰 목록, 해시태그 모아보기, 작성자글 모아보기, 리뷰 목록
-->
<li class="grid ec-board-list-item" data-bulletin-no="{$*bulletin_no}" style="display:none;">
    <div class="reviewInfo square">
        <div class="reviewImg {$*display_bulletin_thumbnail_visible_class}">
            <a href="#none" class="reviewThumb square ec-board-list-review-read">{$*display_bulletin_thumbnail_url}</a>
            <div class="gradeLayer" title="{$*rating}">
                <div class="ec-board-grade ec-board-star medium">
                    {$*display_bulletin_rating_medium_tpl}
                </div>
                <div class="gradeBg"></div>
            </div>
        </div>
        <div class="prdOption typeSimple square {$*display_bulletin_thumbnail_no_image_class} {$*product_option_info_display} {$*product_option_info_visible_display}">
            <p class="normal {$*normal_product_info_display}"><span class="option">{$*display_product_option_info}</span></p>
            <ul class="set {$*set_product_info_display}">
                {$*display_product_set_info}
            </ul>
        </div>
        <a href="#none" class="summary ec-board-list-review-read">
            <strong class="heading square {$*display_bulletin_thumbnail_no_image_class}">
                <div class="icons">
                    <span class="icon {$*display_best_icon_visible_class}">{$*display_best_icon_url}</span>
                    <span class="icon {$*display_mobile_icon_visible_class}">{$*display_mobile_icon_url}</span>
                    <span class="icon {$*display_new_icon_visible_class}">{$*display_new_icon_url}</span>
                </div>
                {$*display_subject_long}
            </strong>
            <span class="info square">
                {$*display_group_icon}{$*display_nick_icon} <strong>{$*display_writer}</strong> <br>
                <span class="date">{$*display_writen_date}</span>
            </span>
        </a>
        <div class="community">
            <a href="#none" class="comment ec-board-list-review-read {$*display_comment_visible_class} {$*display_comment_visible_underline_class}">댓글 <strong class="count ec-board-comment-count">{$*comment_cnt}</strong></a>
            <div class="social">
                <button type="button" class="btnLike {$*display_like_selected} ec-board-list-sns-share-button-{$*bulletin_no}">좋아요</button>
                <button type="button" class="btnShare {$*display_sns_share_visible_class}">공유하기</button>
                <div class="shareLayer">
                    <ul>
                        <li class="{$*sns_share_facebook_display}"><img src="//img.echosting.cafe24.com/skin/base/board/review/ico_facebook.gif" alt="페이스북" /> <a href="#none" data-sns-share="facebook">페이스북</a></li>
                        <li><img src="//img.echosting.cafe24.com/skin/base/board/review/ico_kakao_story.gif" alt="카카오스토리" /> <a href="#none" data-sns-share="kakaostory">카카오스토리</a></li>
                        <li class="{$*display_sns_share_instagram_class}"><img src="//img.echosting.cafe24.com/skin/base/board/review/ico_instagram.gif" alt="인스타그램" /> <a href="#none" data-sns-share="instagram">인스타그램</a></li>
                    </ul>
                    <span class="edge"></span>
                </div>
            </div>
        </div>
    </div>
    <div class="prdInfo square {$*display_product_info_visible_class}">
        <p class="reviewThumb">
            <a href="/product/detail.html?product_no={$*prd_no}">{$*display_product_image_tag}</a>
        </p>
        <div class="summary">
            <a href="/product/detail.html?product_no={$*prd_no}" class="heading square"><strong>{$*product_name|cut:15,...}</strong></a>
            <div class="prdOption typeSimple square {$*product_option_info_display}">
                <p class="normal {$*normal_product_info_display}"><span class="option">{$*display_product_option_info}</span></p>
                <ul class="set {$*set_product_info_display}">
                    {$*display_product_set_info}
                </ul>
            </div>
            <div class="info">
                <dl class="{$*display_rating_visible_class}">
                    <dt>평점</dt>
                    <dd>{$*display_product_info_rating_avg}</dd>
                </dl>
                <dl>
                    <dt>리뷰</dt>
                    <dd>{$*display_product_info_review_count}</dd>
                </dl>
            </div>
        </div>
    </div>
</li>
<li class="grid ec-board-list-item" data-bulletin-no="{$*bulletin_no}" style="display:none;">
    <div class="reviewInfo square">
        <div class="reviewImg {$*display_bulletin_thumbnail_visible_class}">
            <a href="#none" class="reviewThumb square ec-board-list-review-read">{$*display_bulletin_thumbnail_url}</a>
            <div class="gradeLayer" title="{$*rating}">
                <div class="ec-board-grade ec-board-star medium">
                    {$*display_bulletin_rating_medium_tpl}
                </div>
                <div class="gradeBg"></div>
            </div>
        </div>
        <div class="prdOption typeSimple square {$*display_bulletin_thumbnail_no_image_class} {$*product_option_info_display} {$*product_option_info_visible_display}">
            <p class="normal {$*normal_product_info_display}"><span class="option">{$*display_product_option_info}</span></p>
            <ul class="set {$*set_product_info_display}">
                {$*display_product_set_info}
            </ul>
        </div>
        <a href="#none" class="summary ec-board-list-review-read">
            <strong class="heading square {$*display_bulletin_thumbnail_no_image_class}">
                <div class="icons">
                    <span class="icon {$*display_best_icon_visible_class}">{$*display_best_icon_url}</span>
                    <span class="icon {$*display_mobile_icon_visible_class}">{$*display_mobile_icon_url}</span>
                    <span class="icon {$*display_new_icon_visible_class}">{$*display_new_icon_url}</span>
                </div>
                {$*display_subject_long}
            </strong>
            <span class="info square">
                {$*display_group_icon}{$*display_nick_icon} <strong>{$*display_writer}</strong> <br>
                <span class="date">{$*display_writen_date}</span>
            </span>
        </a>
        <div class="community">
            <a href="#none" class="comment ec-board-list-review-read {$*display_comment_visible_class} {$*display_comment_visible_underline_class}">댓글 <strong class="count ec-board-comment-count">{$*comment_cnt}</strong></a>
            <div class="social">
                <button type="button" class="btnLike {$*display_like_selected} ec-board-list-sns-share-button-{$*bulletin_no}">좋아요</button>
                <button type="button" class="btnShare {$*display_sns_share_visible_class}">공유하기</button>
                <div class="shareLayer">
                    <ul>
                        <li class="{$*sns_share_facebook_display}"><img src="//img.echosting.cafe24.com/skin/base/board/review/ico_facebook.gif" alt="페이스북" /> <a href="#none" data-sns-share="facebook">페이스북</a></li>
                        <li><img src="//img.echosting.cafe24.com/skin/base/board/review/ico_kakao_story.gif" alt="카카오스토리" /> <a href="#none" data-sns-share="kakaostory">카카오스토리</a></li>
                        <li class="{$*display_sns_share_instagram_class}"><img src="//img.echosting.cafe24.com/skin/base/board/review/ico_instagram.gif" alt="인스타그램" /> <a href="#none" data-sns-share="instagram">인스타그램</a></li>
                    </ul>
                    <span class="edge"></span>
                </div>
            </div>
        </div>
    </div>
    <div class="prdInfo square {$*display_product_info_visible_class}">
        <p class="reviewThumb">
            <a href="/product/detail.html?product_no={$*prd_no}">{$*display_product_image_tag}</a>
        </p>
        <div class="summary">
            <a href="/product/detail.html?product_no={$*prd_no}" class="heading square"><strong>{$*product_name|cut:15,...}</strong></a>
            <div class="prdOption typeSimple square {$*product_option_info_display}">
                <p class="normal {$*normal_product_info_display}"><span class="option">{$*display_product_option_info}</span></p>
                <ul class="set {$*set_product_info_display}">
                    {$*display_product_set_info}
                </ul>
            </div>
            <div class="info">
                <dl class="{$*display_rating_visible_class}">
                    <dt>평점</dt>
                    <dd>{$*display_product_info_rating_avg}</dd>
                </dl>
                <dl>
                    <dt>리뷰</dt>
                    <dd>{$*display_product_info_review_count}</dd>
                </dl>
            </div>
        </div>
    </div>
</li>
			</div>
			
    	</main>	
	<%@ include file="/Template/store_sidevar_close.jsp"%> 	
</html> 



