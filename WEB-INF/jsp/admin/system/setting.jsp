<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="qjk" uri="/qjk/core"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>参数设置</title>
<%@include file="../css.html"%>
<%@include file="../script.html"%>
</head>
<body>
	<jsp:include page="../menu.jsp"></jsp:include>

	<div class="ef-main">
		<jsp:include page="../toolbar.jsp"></jsp:include>
		<div class="ef-block">

			<h1>参数设置</h1>
			<p class="txt">可在此管理本平台的参数设置</p>
			<div class="content">

				<ul class="ui-tabbar">
					<c:forEach items="${settings}" var="setting">
						<li><a href="/admin/system/setting/${setting.settingId }"
							class="${setting.settingId eq currSetting.settingId ?'selected':''}">${setting.title}</a></li>
					</c:forEach>
<!-- 					<li>
					<a href="/admin/content/article/group/add"style="background-color: #35ac3e;color: white;">+</a>
					<li> -->
				</ul>
<%-- 
				<p class="ef-summary">${group.summary}</p> --%>

			</div>

			<div class="content">

				<div class="container">
				<table class="ui-table" id="settings">
					<thead>
						<tr>
							<td style="" name="name">键值</td>
							<td style="" name="value">名称 <span class="icon icon-pencil"></span></td>
							<td style="" name="title">说明 <span class="icon icon-pencil"></span></td>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${currSetting.options }" var="option">
						<tr>
							<td style="" name="name"><p>${option.name }</p></td>
							<td style="" class="editable" name="value"><p style="word-break: break-all;">${option.value }</p></td>
							<td style="width:16%;" class="editable" name="summary"><p>${option.summary }</p></td>
						</tr>
						</c:forEach>
						<tr style="display:none" class="add-item" >
							<td style="display:none" name="name"></td>
							<td style="height: 14px;" class="editable" name="value"></td>
							<td class="editable" name="summary"></td>
						</tr>
					</tbody>
					<tfoot id="editable" style="display: none;">
						<tr>
							<td colspan="3">
								<form action="/admin/system/setting" method="post">
									<input type="hidden" name="id" value="${currSetting.settingId}" />
									<input type="submit" value="保存" class="ui-btn"  />
								</form>
							</td>
						</tr>
					</tfoot>
				</table>


				</div>
			</div>
		
		<script type="text/javascript">
		
			$(function(){
				
				var table = $("#settings");
				var editable = $("#editable");
				var tbody = $(">tbody",table);
				
				var types = 15;
				
				var clear = function() {
					
					if((types & (1 << 2)) == 0) {
						
						var trs = $(">tr",tbody);
						var ltr = null;
						
						for(var i=0;i<trs.size() - 1;i++) {
							
							var tr = trs.eq(i);
							
							var td = $(">td[name=value]",tr);
							
							if(i == trs.size() - 2) {
								ltr = tr;
							}
							else if(! td.text()) {
								tr.remove();
							}
							
						}
						
						if(ltr == null || $(">td[name=value]",tr).text()) {
							var atr = $("tr.add-item",tbody);
							var tr = atr.clone().removeClass("add-item").show();
							atr.before(tr);
						}
					}
					
				};
				
				clear();
				
				var fn = function(e){
					
					var el = $(this);
					var td = el.parent();
					
					td.text(el.val());
					
					editable.show();
					clear();
				};
				

				var keydown = function(e){
					
					var el = $(this);
					
					if(e.keyCode == 13 || e.keyCode == 40) {
						// enter , down
						
						var td = el.parent();
						var tr = td.parent();
						
						el.trigger("blur");
						
						var ntr = tr.next();
						
						if(ntr.size()) {
							var i = $(">td",tr).index(td);
							var td = $(">td:eq(" +i+ ")", ntr);
							td.trigger("click");
						}
						
						return false;
					}
					else if(e.keyCode == 9) {
						// tab
						
						var td = el.parent();
						var ntd = td.next();
						
						el.trigger("blur");
						
						if(ntd.is(".editable")) {
							ntd.trigger("click");
						}
						
						return false;
					}
					else if(e.keyCode == 27) {
						// esc
						
						el.unbind("blur").remove();
						
						return false;
					}
					else if(e.keyCode == 38) {
						// up
						
						var td = el.parent();
						var tr = td.parent();
						var ptr = tr.prev();
						
						el.trigger("blur");
						
						if(ptr.size()) {
							var i = $(">td",tr).index(td);
							var td = $(">td:eq(" +i+ ")", ptr);
							td.trigger("click");
						}
						
						return false;
						
					}
				};
				
				table.bind("click",function(e){
					
					var el = $(e.target);
					
					if( ! el.is("td.editable") ) {
						el  = el.parents("td.editable");
					}
					
					if(el.size()) {
						
						el.css({ position: 'relative' });
						
						var input = $("<input type='text' class='ui-input' />")
							.css({ position : 'absolute', left : '0px' ,top : '0px', width:'100%', height:'100%' });
						
						input.val($('p',el).text()).appendTo($('p',el)).focus().select();
						
						input.bind('blur',fn).bind("keydown",keydown);
						
					}
					
				});
				
				$("form",editable).bind("submit",function(e){
					
					var trs = $(">tbody>tr",table);
					var form = $(this);
					
					for(var i=0;i<trs.size();i++) {
						
						var tr = trs.eq(i);
						
						if(! tr.is(".add-item")) {
							var tds = $(">td[name]",tr);
							var isnull = true;
							
							for(var c=0 ; c < tds.size() ; c ++) {
								var td = tds.eq(c);
								if(td.text()) {
									isnull = false;
									break;
								}
							}
							
							if(isnull) {
								continue;
							}
							
							for(var c=0 ; c < tds.size() ; c ++) {
								var td = tds.eq(c);
								$("<input type='hidden' />")
									.attr("name",	td.attr("name"))
									.val($('p',td).text()).appendTo(form);
							}
						}
						
					}
					//alert(form.serialize());
				});
				
			});
		</script>
		</div>
	</div>
</body>
</html>