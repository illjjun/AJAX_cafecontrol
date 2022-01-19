<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
    <title>카페관리</title>
</head>
<style>
.bound{ 
    border-collapse: collapse;
    border:1px solid lightskyblue;
    height: 460px;
    width: 260px;
    background-color: lightcyan;
    color:black;
    font-style: inherit;
}
#selMenu,#selOrder,#selSales,#selMenu1 {
    width: 240px;
}
#selMenu,#selSales,#selOrder{
    background-color: powderblue;
    color:black;
    font-style: oblique;
}

</style>
<body>
    <table align="center">
        <tr>
            <td valign=top>
                <table class='bound' id=mlist>
                    <caption>메뉴목록</caption>
                    <tr>
                        <td align="right" colspan=2>
                        <button id=btnMenu >메뉴관리</button>
                    </td>
                    </tr>
                    <tr>
                        <td colspan=2>
                            <select id=selMenu size=13 ></select>
                        </td>
                    </tr>
                    <tr>
                        <td>메뉴명</td>
                        <td><input type="text" id=menuname readonly></td>
                    </tr>
                    <tr>
                        <td>수량</td>
                        <td><input type="number" id=count min=1></td>
                    </tr>
                    <tr>
                        <td>금액</td>
                        <td><input type="number" id=price readonly></td>
                    </tr>
                    <tr>
                        <td><button id=btnReset>지우기</button></td>
                        <td align="right"><button id=btnAdd>메뉴추가</button></td>
                    </tr>
                </table>
            </td>
            <td valign=top>
                <table class='bound'>
                    <caption id=capt1>주문목록</caption>
                    <tr>
                        <td colspan="2">
                            <select id=selOrder size=14></select>
                        </td>
                    </tr>
                    <tr>
                        <td>총액</td>
                        <td><input type="number" id=total></td>
                    </tr>
                    <tr>
                        <td>모바일</td>
                        <td><input type=phone id=mobile size=13></td>
                    </tr>
                    <tr>
                        <td colspan="2">&nbsp;</td>
                    </tr>
                    <tr>
                        <td><button id=btnCancel>주문취소</button></td>
                        <td align="right"><button id=btnDone>주문완료</button></td>
                    </tr>
                </table>
            </td>
            <td valign=top>
                <table class='bound' >
                    <caption id=capt1>판매내역</caption>
                    <tr>
                        <td>
                            <select id=selSales size=17></select>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <button id=clean>초기화</button>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <dialog>
    <div id=dlgMenu title='메뉴 관리'>
       <table>
        <tr>
            <td>
                <select id=selMenu1 size=10></select>
            </td>
            <td>
                <table>
                <tr>
                    <td>메뉴명</td><td><input type=text id=_menuname></td>
                </tr>
                <tr>
                    <td>단가(가격)</td><td><input type=number id=_price step=100 min=100>원</td>
                </tr>
                <tr>
                    <td  colspan=2 align=center>
                        <button id=btnPlus>추가</button>&nbsp;
                        <button id=btnMinus>삭제</button>&nbsp;
                        <button id=btnUpdate>변경</button>&nbsp;
                    </td>
                </tr>
                </table>
            </td>
        </tr>    
        </table>
    
    </div>
    </dialog>

</body>
<script src='https://code.jquery.com/jquery-3.5.0.js'></script>
<script>
$(document)
.ready(function(){
	loadMenu();
	return false;
})
function loadMenu(){
	$('#selMenu').empty();
	$.get('select_menu',{},function(txt){
			console.log(txt);
		let rec=txt.split(';');
		for(i=0; i<rec.length;i++){
			let field=rec[i].split(',');
			let html='<option value='+field[0]+'>'+field[0]+'&nbsp;'+field[1]+'</option>';
	          $('#selMenu').append(html);
		}
	},'text');
	return false;
}

</script>
</html>