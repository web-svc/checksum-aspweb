<!--#include file="functions.asp"-->
<%
		'key = "44q9dn7WCUrLHgi8bPsdiBIlLi6WaHI0" 'replace ur 32 bit secure key , Get your secure key from your Reseller Control panel
    key = Request.QueryString("key")
		'---------------------------
		'Below are the  parameters which will be passed from foundation as http GET request
		'---------------------------
		
		'paymentTypeId = Request.QueryString("paymenttypeid")	'payment id 
    paymentTypeId = Request.QueryString("paymenttypeid")
		'transId = Request.QueryString("transid")	'This refers to a unique transaction ID which we generate for each transaction
    transId = Request.QueryString("transid")
		'userId = Request.QueryString("userid")	'userid of the user who is trying to make the payment
    userId = Request.QueryString("userid")
		'userType = Request.QueryString("usertype")  		  'This refers to the type of user perofrming this transaction. The possible values are "Customer" or "Reseller"
    userType = Request.QueryString("usertype")
        'transactionType = Request.QueryString("transactiontype")'Type of transaction (ResellerAddFund/CustomerAddFund/ResellerPayment/CustomerPayment)
    transactionType = Request.QueryString("transactiontype")
		'invoiceIds = Request.QueryString("invoiceids")	'comma separated Invoice Ids, This will have a value only if the transactiontype is "ResellerPayment" or "CustomerPayment"        
    invoiceIds = Request.QueryString("invoiceids")
        'debitNoteIds = Request.QueryString("debitnoteids")	'comma separated DebitNotes Ids, This will have a value only if the transactiontype is "ResellerPayment" or "CustomerPayment"
	debitNoteIds = Request.QueryString("debitnoteids")
		'description = Request.QueryString("description")	'description of the transaction
    description = Request.QueryString("description")
		'sellingCurrencyAmount = Request.QueryString("sellingcurrencyamount")	 'This refers to the amount of transaction in your Selling Currency
    sellingCurrencyAmount = Request.QueryString("sellingcurrencyamount")
        'accountingCurrencyAmount = Request.QueryString("accountingcurrencyamount")	'This refers to the amount of transaction in your Accounting Currency
    accountingCurrencyAmount = Request.QueryString("accountingcurrencyamount")
		 
		
		'redirectUrl = Request.QueryString("redirecturl")	'This is the URL on our server, to which you need to send the user once you have finished charging him
    redirectUrl = Request.QueryString("redirecturl")
		
		
		'checksum = Request.QueryString("checksum") 'checksum for validation 
    checksum = Request.QueryString("checksum")

		 'Response.write "File paymentpage.asp<br>"
         'Response.write "Checksum Verification.............."
		 
    
    if(verifyChecksum(paymentTypeId, transId, userId, userType, transactionType, invoiceIds, debitNoteIds, description, sellingCurrencyAmount, accountingCurrencyAmount, key, checksum)) then
    Response.Write("true")
    Response.End
    else
    Response.Write("false")
    Response.End
    end if
		%>