/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import com.paypal.api.payments.Amount;
import com.paypal.api.payments.Details;
import com.paypal.api.payments.Item;
import com.paypal.api.payments.ItemList;
import com.paypal.api.payments.Links;
import com.paypal.api.payments.Payer;
import com.paypal.api.payments.PayerInfo;
import com.paypal.api.payments.Payment;
import com.paypal.api.payments.PaymentExecution;
import com.paypal.api.payments.RedirectUrls;
import com.paypal.api.payments.Transaction;
import com.paypal.base.rest.APIContext;
import com.paypal.base.rest.PayPalRESTException;
import java.util.ArrayList;
import java.util.List;
import model.PaymentDetails;

/**
 *
 * @author Trinh
 */
public class PaymentServices {

    private static final String CLIENT_ID = "Ae2FKzx17U3yqSUn68TPTlLFdGND6K8MwT8P0bXIR8JkNj5IJIKMpkgURiKjTfX0kvzf76_VzItss3un";
    private static final String CLIENT_SECRET = "EMx0hnwxp-AdzF3OohCEEnzyKoMtGjaBuPwoxP18RQNKnYoccUxD9VOjJwpBOu-P8KWLRa1f5Li4xyPT";
    private static final String MODE = "sandbox";

    public String authorizePayment(PaymentDetails orderDetail) throws PayPalRESTException {
        Payer payer = getPayerInfomation();
        RedirectUrls redirecturls = getReirectUrls();
        List<Transaction> listTransaction = getTransactionInfomation(orderDetail);

        Payment requestPayment = new Payment();
        requestPayment.setTransactions(listTransaction);
        requestPayment.setRedirectUrls(redirecturls);
        requestPayment.setPayer(payer);
        requestPayment.setIntent("authorize");

        APIContext apiContext = new APIContext(CLIENT_ID, CLIENT_SECRET, MODE);
        Payment approvedPayment = requestPayment.create(apiContext);

        System.out.println(approvedPayment);

        return getApprovalLink(approvedPayment);
    }

    private String getApprovalLink(Payment approvedPayment) {
        List<Links> links = approvedPayment.getLinks();
        String approvalLink = null;
        for (Links link : links) {
            if (link.getRel().equalsIgnoreCase("approval_url")) {
                approvalLink = link.getHref();
            }
        }
        return approvalLink;
    }

    private List<Transaction> getTransactionInfomation(PaymentDetails orderDetail) {
        Amount amount = new Amount();
        amount.setCurrency("USD");
        amount.setTotal(Double.toString(orderDetail.getPayAmount()));

        Transaction transaction = new Transaction();
        transaction.setAmount(amount);

        ItemList itemList = new ItemList();
        List<Item> items = new ArrayList<>();

        Item item = new Item();
        item.setCurrency("USD");
        item.setQuantity("1");
        item.setPrice(Double.toString(orderDetail.getPayAmount())); // Set price here

        items.add(item);
        itemList.setItems(items);
        transaction.setItemList(itemList);

        List<Transaction> listTransation = new ArrayList<>();
        listTransation.add(transaction);

        return listTransation;
    }

    private Payer getPayerInfomation() {
        Payer payer = new Payer();
        payer.setPaymentMethod("paypal");

        PayerInfo payerInfo = new PayerInfo();
        payerInfo.setFirstName("Trinh");
        payerInfo.setLastName("Nguyen");
        payerInfo.setEmail("trinhnguyen@gmail.com");
        payer.setPayerInfo(payerInfo);
        return payer;
    }

    public Payment getPaymentDetails(String paymentId) throws PayPalRESTException {
        APIContext apicontext = new APIContext(CLIENT_ID, CLIENT_SECRET, MODE);
        return Payment.get(apicontext, paymentId);
    }

    public Payment executePayment(String paymentId, String payerId) throws PayPalRESTException {
        PaymentExecution paymentExecution = new PaymentExecution();
        paymentExecution.setPayerId(payerId);
        Payment payment = new Payment().setId(paymentId);
        APIContext apiContext = new APIContext(CLIENT_ID, CLIENT_SECRET, MODE);
        return payment.execute(apiContext, paymentExecution);
    }

    private RedirectUrls getReirectUrls() {
        RedirectUrls redirecturls = new RedirectUrls();
        redirecturls.setCancelUrl("http://localhost:8080/airline-reservation-system/cancel.jsp");
        redirecturls.setReturnUrl("http://localhost:8080/airline-reservation-system/PaymentServlet");
        return redirecturls;
    }
}
