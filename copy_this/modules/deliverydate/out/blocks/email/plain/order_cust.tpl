[{$smarty.block.parent}]
	[{* This template is used in the Customer Order Confirmation Email. *}]
	[{* BLOCK: email_plain_order_cust_deliveryinfo *}]

    [{ oxmultilang ident="EMAIL_ORDER_CUST_HTML_DELIVERYDATE" }] [{ $order->oxorder__oxdeldate->value  }]
