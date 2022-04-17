goCartGeneral = function(){
	$("#formCart").attr("action", "/infra/product/cartGeneral").submit();
}
goCartWishList = function(){
	$("#formCart").attr("action", "/infra/product/cartWishlist").submit();
}
goCartRegular = function(){
	$("#formCart").attr("action", "/infra/product/cartRegularDelivery").submit();
}
