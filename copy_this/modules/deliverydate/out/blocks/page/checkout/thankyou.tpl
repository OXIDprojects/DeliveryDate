[{$smarty.block.parent}]
		[{* This template is used in the 5. Step of the Checkout process. *}]
		[{* It retrieves the value, stores in the Database oxorder:oxdeldate *}]
		[{* BLOCK: checkout_thankyou_info *}]
		[{ oxmultilang ident="PAGE_CHECKOUT_THANKYOU_DELIVERYDATE" }] [{ $order->oxorder__oxdeldate->value|date_format:"%d.%m.%Y" }] <br><br>
          