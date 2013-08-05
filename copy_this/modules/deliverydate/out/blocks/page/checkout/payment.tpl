[{$smarty.block.parent}]
		[{* This template is used in the 3. Step of the Checkout process. *}]
		[{* BLOCK: change_shipping *}]
		<form action="[{ $oViewConf->getSslSelfLink() }]" name="deliveryDate" id="deliveryDate" method="post">
                    <div>
                        [{ $oViewConf->getHiddenSid() }]
                        [{ $oViewConf->getNavFormParams() }]
                        <input type="hidden" name="cl" value="[{ $oViewConf->getActiveClassName() }]">
                        <input type="hidden" name="fnc" value="setDeliveryDate">
                    </div>
                    <h3 id="deliveryHeader" class="blockHead">[{ oxmultilang ident="PAGE_CHECKOUT_PAYMENT_DELIVERYDATE_HEADLINE" }]</h3>
                    <ul>
                        
                            [{ if !$oView->isBeforeDeadline() && !$oView->isTomorrowWorkDay() }]
								<li>       [{ oxmultilang ident="PAGE_CHECKOUT_PAYMENT_DELIVERYDATE_NOORDER" }] </li>
							[{else}]
								[{ if ! $oView->isBeforeDeadline() }]
									<li>[{ oxmultilang ident="PAGE_CHECKOUT_PAYMENT_DELIVERYDATE_NOTTODAY" }]</li>
								[{/if}]
							    [{ assign var="deliveryDate" value=$oView->getDeliveryDate() }]
								<li> <select name="sDeliveryDate" onChange="JavaScript:document.forms.deliveryDate.submit();">
								[{ if $oView->isBeforeDeadline() }]
								    [{ assign var="today" value=$oView->getToday()}]
                                    <option value="[{$today}]" [{if $today==$deliveryDate}]SELECTED[{/if}]>[{$today|date_format:"%d.%m.%Y" }]</option>
								[{/if}]
								[{ if $oView->isTomorrowWorkDay() }]
								    [{ assign var="tomorrow" value=$oView->getTomorrow()|date_format:"%d.%m.%Y"}]
                                    <option value="[{$tomorrow}]" [{if $tomorrow==$deliveryDate}]SELECTED[{/if}]>[{$tomorrow|date_format:"%d.%m.%Y" }]</option>
								[{/if}]    
                                </select>
								</li>
							[{/if}]
					</ul>
		</form>
		
	