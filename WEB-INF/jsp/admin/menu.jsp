<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>

	<div class="ef-left">
		<div class="ef-head">
			<img class="ef-logo" src="/img/logo.png" /> <span class="ef-title">管理后台</span>
		</div>

		<div class="ui-menu" style="margin-bottom: 24px;">

			<c:forEach items="${menu.childen }" var="child">
				<div class="ui-section ">
					<a href="javascript:;" class="ui-menu-img ${child.icon}">${child.title}<span
						class="ui-icon r icon-angle-right"></span></a>
					<ul>
						<c:forEach items="${child.childen }" var="m">

							<li>
							<c:choose>
							<c:when
									test="${fn:startsWith(requestScope['javax.servlet.forward.request_uri'], m.href)}">
									<a href="${m.href}" class="selected">${m.title}</a>

								</c:when> 
								<c:otherwise>
									<a href="${m.href}" class="">${m.title}</a>
								</c:otherwise>
								</c:choose>
							</li>
						</c:forEach>
					</ul>
				</div>
			</c:forEach>
		</div>

		<script type="text/javascript">
			var href = window.location.pathname;

			$(function() {

				$(".ui-menu>.ui-section>ul>li>.selected").parent().parent()
						.parent().addClass("selected").find("span:first")
						.removeClass("icon-angle-right").addClass(
								"icon-angle-down");

				$(".ui-menu>.ui-section>a").bind(
						"click",
						function(e) {

							var el = $(this).parent();
							var menu = el.parent();
							var sections = $(".ui-section", menu);

							if (!el.is(".selected")) {
								for (var i = 0; i < sections.size(); i++) {
									var section = sections.eq(i);
									if (section.is(el)) {
										section.addClass("selected");
										$("span.ui-icon.r", this).addClass(
												"icon-angle-down").removeClass(
												"icon-angle-right");
									} else {
										section.removeClass("selected");
										$(">a>span.ui-icon.r", section)
												.removeClass("icon-angle-down")
												.addClass("icon-angle-right");
									}
								}
							}

						});

			});
		</script>


	</div>
</body>
</html>