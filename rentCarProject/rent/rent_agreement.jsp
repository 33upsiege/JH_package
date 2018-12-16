<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<link rel="stylesheet" href="css/reservation.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script src="js/reservation.js"></script>

 <div class="wrap_reservation">
	<div id="qualification_div" >
		<div class="qua">  
           <h1 class="quaTitle">대여하시기 전 꼭 체크하세요!</h1>
           <div class="quaContent">
               <p class="title"> 대여 자격 기준 </p>
               <p>운전면허 (도로교통법상 유효한 운전면허증 소지자 )</p>
               <p>01. 승용차, 9인승 이하 승합차 : 2종 보통면허 이상</p>
               <p>02. 11인승 이상 승합차 : 1종 보통면허 이상</p>
               <p> 03. 외국인의 경우에는 국제 운전 면허증과 로컬면허증 동시 소지자에 한함.</p>
               <p> * 로컬 면허증 - 해당 국가에서 발급된 면허증.</p>
               <p> 04. 운전자 등록 : 실 운전자 포함 제2운전자까지 등록 가능</p>
               <p>  (운전자 자격은 대여자격과 동일하며, 운전면허증을 지참하시고 지점으로 동행방문 하셔야 등록이 가능합니다.)</p>
               <p>  05. 면허재취득하시고 1년이 안된 경우에는 반드시 운전경력면허증이나 공항내 자치경찰대에 가셔서 이전 면허확인증을 </p>
               <p>발급받으시길 바랍니다.</p>
                <p class="p_title"> 제주기준 </p>
                    <table id="qua_table">
                        <tr>
                            <th>차량종류</th>
                            <th>차량종류</th>
                            <th>차량종류</th>
                        </tr>
                        <tr>
                            <td>소형,중형,SUV 차량</td>
                            <td>만 21세 이상</td>
                            <td>운전경력 1년이상</td>
                        </tr>
                        <tr>
                            <td>대형, 고급, 승합, SUV,<br>제네시스쿠페</td>
                            <td>만 26세 이상</td>
                            <td>운전경력 3년이상</td>
                        </tr>
                        <tr>
                            <td>승합차량<br>15인승,SUV차량</td>
                            <td>만 30세 이상</td>
                            <td>운전경력 3년이상<br>대형</td>
                        </tr>
                    </table>
                    <p>01. 차량 대여 기준 연령 및 운전경력은 운전면허증 정보에 준합니다.</p>
                    <p> 02. 본인 명의의 유효한 신용카드 및 AJ렌터카 시스템에서 통용되는 결제 수단으로 가능합니다.</p>
                    <p> 03.신용카드 이외에 체크카드로 결제 시에는 신용정보조회 동의를 요청드릴 수 있습니다.</p>
                    <p class="pText">
                           * 신용정보조회는 개인신용도에는 영향을 미치지 않는 단순 조회입니다.<br>
                           **신용정보조회 시 아래 등급에 따라 대여가 불가할 수도 있습니다.<br>
                           1~7등급 - 대여가능<br>
                           8~9등급 - 연체및 개인파산에 대한 기록이 있으면 대여불가<br>
                           10등급 - 대여불가<br>
                    </p>

                   <p>04. 신용카드를 소유하고 계심에도 불구하고 그 사용을 원치 않으시는 경우,</p>
                   <p> 차량 대여 시 일단 신용카드로 결제하시고, 반납 시신용카드 승인을 취소하고 체크카드로 재정산하실 수 있습니다.</p>
                   <p> 05. 차량 대여료 결제 조건은 단기 대여의 경우에 해당되며, 중/장기 대여 시에는 별도의 대여 조건 및 결제 조건이 적용됩니다.</p>
               <p class="p_title"> 보험 </p>
                   
                   <p>대여요금에는 종합보험(자손, 대인, 대물)이 포함되어 있으며,</p>
                   <p>차량손해면책제도는 차량 인수 시 해당 지점에서 추가로 가입할 수 있습니다.</p>
                   <p>차량손해면책제도는 1일 단위로 운영되오니 이용에 참고하여 주시기 바랍니다.</p>
                   <p>등록하신 제2운전자까지 동일한 내용의 보험혜택을 받으실 수 있습니다.</p>

                       <p class="pText">(단, 계약서상 등록되지 않은 운전자의 경우, 종합보험 및 차량손해면책제도의 보험혜택을 받으실 수 없습니다.)</p>

                   <p>휴차보상 : 차량손해 면책제도 가입 여부와 관계없이 사고로 인하여 차량이 휴차할 경우에는 차량 운영의 차질로 인하여</p>
                   <p>발생한 수리기간동안 대여요금의 50%에 해당하는 휴차보상료가 청구되며, 이는 임차인이 배상하여야 합니다.</p>
             <p class="p_title"> 결제조건 </p>
                   <p>본인명의 신용카드 이외에 체크카드, 직불카드 등으로 결제 시에는 신용정보조회 동의를 요청드릴 수 있습니다.</p>

             <p class="pText">(단, 본 신용정보조회는 개인 신용도에 영향을 미치지 않는 단순 조회이며 조회결과 신용상의 문제가 발견될 경우 대여가 불가능합니다.)</p>

                   <p>본인명의 신용카드를 소유하고 계심에도 불구하고 그 사용을 원치 않으시는 경우, 차량 대여시 일단 신용카드로 결제하시고,</p> 
                   <p>반납시 신용카드 승인을 취소하고 체크카드나 직불카드로 재정산하실 수 있습니다.</p>
               
           </div>
           <div class="waringBox">
               <input type="radio" class="qua_radio" id="qua_radio"><p class="pWaring">대여자격 기준 및 보험, 결제조건을 확인하였고 이에 동의합니다.</p>
           </div>
       </div>
	</div>
    <div class="subMenu">
    	<jsp:include page="rent_rightmenu.jsp" flush="false"></jsp:include>
    </div> 
</div>
   