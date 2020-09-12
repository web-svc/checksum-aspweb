<!--#include file="functions.asp"-->
<%
		'key = "44q9dn7WCUrLHgi8bPsdiBIlLi6WaHI0" 'replace ur 32 bit secure key , Get your secure key from your Reseller Control panel
    key = Request.QueryString("key")
		'Below are the passed from foundation 
		
		'redirectUrl = session("redirecturl")'redirectUrl received from foundation
    redirectUrl = Request.QueryString("redirecturl")
		'transId = session("transid")   'Pass the same transid which was passsed to your Gateway URL at the beginning of the transaction.
    transId = Request.QueryString("transid")
		'sellingCurrencyAmount = session("sellingcurrencyamount")
    sellingCurrencyAmount = Request.QueryString("sellingcurrencyamount")
		'accountingCurrencyAmount = session("accountingcurencyamount")
    accountingCurrencyAmount = Request.QueryString("accountingcurencyamount")

		status = Request.QueryString("status")'Transaction status received from your Payment Gateway
        'This can be either 'Y' or 'N'. A 'Y' signifies that the Transaction went through SUCCESSFULLY and that the amount has been collected.
        'An 'N' on the other hand, signifies that the Transaction FAILED.		
		
				

	    '==========================================================================================
	    'HERE YOU HAVE TO VERIFY THAT THE STATUS PASSED FROM YOUR PAYMENT GATEWAY IS VALID.
	    ' And it has not been tampered with. The data has not been changed since it can * easily be done with HTTP request. 
		'==========================================================================================

		 'Randomize
		'rkey = rnd()   
    rkey = Request.QueryString("rkey")
		


		checksum = generateChecksum(transId,sellingCurrencyAmount,accountingCurrencyAmount,status, rkey, key)
Response.write(checksum)
Response.End


	'==========================================================================================
	' Once your Payment Gateway response is verified, you can redirect the Customer to the Foundation server for processing the Order.
	'==========================================================================================

%>