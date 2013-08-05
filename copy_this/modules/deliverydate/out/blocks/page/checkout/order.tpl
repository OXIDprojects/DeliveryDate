[{$smarty.block.parent}]
	[{* This template is used in the 4. Step of the Checkout process. *}]
	[{* BLOCK: shippingAndPayment *}]
			<div id="orderPayment">
                    <form action="[{ $oViewConf->getSslSelfLink() }]" method="post">
                        <h3 class="section">
                            <strong>[{ oxmultilang ident="PAGE_CHECKOUT_ORDER_DELIVERYDATE_HEADLINE" }]</strong>
                            [{ $oViewConf->getHiddenSid() }]
                            <input type="hidden" name="cl" value="payment">
                            <input type="hidden" name="fnc" value="">
                            <button type="submit" class="submitButton largeButton">[{ oxmultilang ident="PAGE_CHECKOUT_ORDER_MODIFY3" }]</button>
                        </h3>
                    </form>
                    [{assign var="sDeliveryDate" value=$oView->getDeliveryDate() }]
                    [{ $oView->getDeliveryDate()|date_format:"%d.%m.%Y" }]
            </div>