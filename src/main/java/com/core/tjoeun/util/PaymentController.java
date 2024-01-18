package com.core.tjoeun.util;

import java.io.IOException;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

@Controller
public class PaymentController {

    private final IamportClient iamportClient;

    public PaymentController() {
        this.iamportClient = new IamportClient("3807866388127533",
                "CUQERLwJOqXRAdueKFCloM1C5IKK1gCKU4N1aUsm52iw2qCa8rz2UW6WQ5NujPkUKooAo0vDrZjRrbGo");
    }

    @ResponseBody
    @RequestMapping("/verify/{imp_uid}")
    public IamportResponse<Payment> paymentByImpUid(@PathVariable("imp_uid") String imp_uid)
            throws IamportResponseException, IOException {
    	System.out.println(imp_uid);
        return iamportClient.paymentByImpUid(imp_uid);
    }

}