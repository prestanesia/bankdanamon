{*
* 2007-2015 PrestaShop
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License (AFL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/afl-3.0.php
* If you did not receive a copy of the license and are unable to
* obtain it through the world-wide-web, please send an email
* to license@prestashop.com so we can send you a copy immediately.
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade PrestaShop to newer
* versions in the future. If you wish to customize PrestaShop for your
* needs please refer to http://www.prestashop.com for more information.
*
*  @author PrestaShop SA <contact@prestashop.com>
*  @copyright  2007-2015 PrestaShop SA
*  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}

{capture name=path}
    <a href="{$link->getPageLink('order', true, NULL, "step=3")|escape:'html':'UTF-8'}" title="{l s='Go back to the Checkout' mod='bankdanamon'}">{l s='Checkout' mod='bankdanamon'}</a><span class="navigation-pipe">{$navigationPipe}</span>{l s='Bank Danamon payment' mod='bankdanamon'}
{/capture}

<h2>{l s='Order summary' mod='bankdanamon'}</h2>

{assign var='current_step' value='payment'}
{include file="$tpl_dir./order-steps.tpl"}

{if $nbProducts <= 0}
	<p class="warning">{l s='Your shopping cart is empty.' mod='bankdanamon'}</p>
{else}

<h3>{l s='Bank Danamon payment' mod='bankwire'}</h3>
<form action="{$link->getModuleLink('bankdanamon', 'validation', [], true)|escape:'html'}" method="post">
<p>
    <img src="{$this_path_bw}bankwire.jpg" alt="{l s='Bank Danamon' mod='bankdanamon'}" style="float:left; margin: 0px 10px 5px 0px;" />
    {l s='You have chosen to pay by Bank Danamon.' mod='bankdanamon'}
    <br/><br />
    {l s='Here is a short summary of your order:' mod='bankdanamon'}
</p>
<p style="margin-top:20px;">
    - {l s='The total amount of your order is' mod='bankdanamon'}
    <span id="amount" class="price">{displayPrice price=$total}</span>
    {if $use_taxes == 1}
        {l s='(tax incl.)' mod='bankdanamon'}
    {/if}
</p>
<p>
    -
    {if $currencies|@count > 1}
        {l s='We allow several currencies to be sent via Bank Danamon.' mod='bankdanamon'}
        <br /><br />
        {l s='Choose one of the following:' mod='bankdanamon'}
        <select id="currency_payement" name="currency_payement" onchange="setCurrency($('#currency_payement').val());">
            {foreach from=$currencies item=currency}
                <option value="{$currency.id_currency}" {if $currency.id_currency == $cust_currency}selected="selected"{/if}>{$currency.name}</option>
            {/foreach}
        </select>
    {else}
        {l s='We allow the following currency to be sent via Bank Danamon:' mod='bankdanamon'}&nbsp;<b>{$currencies.0.name}</b>
        <input type="hidden" name="currency_payement" value="{$currencies.0.id_currency}" />
    {/if}
</p>
<p>
    {l s='Bank Danamon account information will be displayed on the next page.' mod='bankdanamon'}
    <br /><br />
    <b>{l s='Please confirm your order by clicking "I confirm my order".' mod='bankdanamon'}</b>
</p>
<p class="cart_navigation" id="cart_navigation">
    <input type="submit" value="{l s='I confirm my order' mod='bankdanamon'}" class="exclusive_large" />
    <a href="{$link->getPageLink('order', true, NULL, "step=3")|escape:'html'}" class="button_large">{l s='Other payment methods' mod='bankdanamon'}</a>
</p>
</form>
{/if}