<?php
/**
 * Delivery Date Module
 *
 * NOTICE OF LICENSE
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; version 3 of the License
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see http://www.gnu.org/licenses/
 *
 * @copyright   Copyright (c) 2013 Peter Wiedeking
 * @author      Peter Wiedeking
 * @license     http://opensource.org/licenses/GPL-3.0  GNU General Public License, version 3 (GPL-3.0)
 */


/**
 * Extends payment object
 *
 * This is important for the 3. Step in the Checkout Process 
 * to Display and set the DeliveryDate
 *
 * Template: out\blocks\page\checkout\payment.tpl
 * 
 */
class deliverydate_payment extends deliverydate_payment_parent
{
    /**
	*  Checks the DEADLINE Setting of the Modul
	*  Returns TRUE if NOW is bevor Deadline
	*
	*  @returns boolean
	*/
	public function isBeforeDeadline()
	{
	   $myconfig = oxRegistry::get("oxConfig");
	   $deadline = $myconfig->getConfigParam("DeadLine");
	   return (boolean) (DATE('G') < $deadline );
	}
	
	/** 
	*  Checks if tomorrow is a working day. 
	*  TODO: How to handle banking Holidays / Feiertage
	*
	*  @returns boolean
	*/
	public function isTomorrowWorkDay()
	{
	   return (boolean) (DATE('w') != 0 && DATE('w') != 6 );
	}
	/** 
	*  returns tomorrows date
	*
	*  @returns date
	*/
	public function getTomorrow()
	{
	   return (date("Y-m-d", strtotime("tomorrow")));
	}
  	/** 
	*  returns todays date
	*
	*  @returns date
	*/
	public function getToday()
	{
	   return (date("Y-m-d"));
	}
	/** 
	*  The FORM on out\blocks\page\checkout\payment.tpl calls this function and sets a new Delivery Date
	*
	*  Delivery Date will be stored in user session
	*/
    public function setDeliveryDate()
    {
   		oxSession::setVar( 'sDeliveryDate', $this->getConfig()->getRequestParameter( 'sDeliveryDate' ) ); 
    } 
	
	/** 
	*  the delivery date from the session will be retrieved and returned to out\blocks\page\checkout\payment.tpl
	*  
	*  if delivery Date is not yet in session, it will be stored in session
	*  DEFAULT Delivery DATE is today. If NOW is after DEADLINE, DEFAULT is TOMORROW.
	*
	*  @returns date
	*/
	public function getDeliveryDate()
	{
        $deliveryDate = oxSession::getVar( 'sDeliveryDate') ; 
		if( $deliveryDate === null ) {
		    if ( $this->isBeforeDeadline() ) {
				$deliveryDate = $this->getToday();
			} else {
				$deliveryDate = $this->getTomorrow();
			}
			oxSession::setVar( 'sDeliveryDate',$deliveryDate); 
        }
		return $deliveryDate; 
    }
	
} 