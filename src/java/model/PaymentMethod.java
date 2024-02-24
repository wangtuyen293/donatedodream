package model;

import java.io.Serializable;

/**
 *
 * @author OS
 */
public class PaymentMethod implements Serializable {

    private int paymentMethodId;
    private String paymentMethodName;

    public PaymentMethod(int paymentMethodId, String paymentMethodName) {
        this.paymentMethodId = paymentMethodId;
        this.paymentMethodName = paymentMethodName;
    }

    public PaymentMethod() {
    }

    public int getPaymentMethodId() {
        return paymentMethodId;
    }

    public void setPaymentMethodId(int paymentMethodId) {
        this.paymentMethodId = paymentMethodId;
    }

    public String getPaymentMethodName() {
        return paymentMethodName;
    }

    public void setPaymentMethodName(String paymentMethodName) {
        this.paymentMethodName = paymentMethodName;
    }

}
