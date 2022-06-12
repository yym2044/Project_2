<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<script type="text/javascript">
goCartGeneral = function(){
	$("#formCart").attr("action", "/infra/product/cartGeneral").submit();
}
goCartWishList = function(){
	$("#formCart").attr("action", "/infra/product/cartWishlist").submit();
}
goCartRegular = function(){
	$("#formCart").attr("action", "/infra/product/cartRegularDelivery").submit();
}


</script>