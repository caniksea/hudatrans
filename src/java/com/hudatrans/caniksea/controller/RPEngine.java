/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hudatrans.caniksea.controller;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.hudatrans.caniksea.model.Bank;
import com.hudatrans.caniksea.model.Beneficiary;
import com.hudatrans.caniksea.model.Country;
import com.hudatrans.caniksea.model.GenericCollectionResponse;
import com.hudatrans.caniksea.model.Login;
import com.hudatrans.caniksea.model.PostGenericResponse;
import com.hudatrans.caniksea.model.RegistrationRequest;
import com.hudatrans.caniksea.model.Sale;
import com.hudatrans.caniksea.model.TransactionRequest;
import com.hudatrans.caniksea.model.User;
import com.hudatrans.caniksea.ws.client.impl.RPServiceEntry;
import java.util.Set;
import org.apache.log4j.Logger;

/**
 *
 * @author caniksea
 */
public class RPEngine {

    private static final Logger LOG = Logger.getLogger(RPEngine.class);
    private final Gson GSON = new Gson();

    public String loadLookup(String type) {
        LOG.info("Calling RP_SERVICE Lookup with " + type);
        String response = "";
        if (type.isEmpty()) {

        } else if (type.equals("country")) {
            response = RPServiceEntry.getPort().getCountries();
        }else if (type.equals("banks")){
            response = RPServiceEntry.getPort().getBanks();
        }
        LOG.info("Lookup Response: " + response);
        return response;
    }

    String getCountry(String country) {
        LOG.info("Calling RP_SERVICE getCountry with : " + country);
        String response = "";
        if (country.isEmpty()) {

        } else {
            response = RPServiceEntry.getPort().getCountry(country);
        }
        LOG.info("getCountry Response: " + response);
        return response;
    }

    String getPaymethods() {
        LOG.info("Calling RP_SERVICE getPaymethods");
        String response = RPServiceEntry.getPort().getPaymethods();
        LOG.info("getPaymethods Response: " + response);
        return response;
    }

    public PostGenericResponse registerCustomer(RegistrationRequest rr) {
        String request = GSON.toJson(rr);
        LOG.info("Calling register user with: " + request);
        String response = RPServiceEntry.getPort().register(request);
        LOG.info("Response from service: " + response);
        return GSON.fromJson(response, PostGenericResponse.class);
    }

    public TransactionRequest initiateTransaction(TransactionRequest tr) {
        String request = GSON.toJson(tr);
        LOG.info("Calling sendTransaction with : " + request);
        String response = RPServiceEntry.getPort().initiateTransaction(request);
        LOG.info("Response from service: " + response);
        return GSON.fromJson(response, TransactionRequest.class);
    }

    public GenericCollectionResponse getBeneficiaries(User user) {
        String request = GSON.toJson(user);
        LOG.info("Calling getBeneficiaries request with user ID: " + request);
        String response = RPServiceEntry.getPort().getBeneficiaries(request);
        LOG.info("Response from service: " + response);
        return GSON.fromJson(response, GenericCollectionResponse.class);
    }

    String getBanksInCountry(String country) {
        LOG.info("Calling getBanksInCountry with country code: " + country);
        String response = RPServiceEntry.getPort().getBanksInCountry(country);
        LOG.info("Response from service: " + response);
        return response;
    }

    public PostGenericResponse saveBeneficiary(Beneficiary b) {
        String request = GSON.toJson(b);
        LOG.info("Calling saveBeneficiary with request: " + request);
        String response = RPServiceEntry.getPort().saveBeneficiary(request);
        LOG.info("Response from service: " + response);
        return GSON.fromJson(response, PostGenericResponse.class);
    }

    String getBeneficiary(String beneficiaryId) {
        LOG.info("calling getBeneficiary with id: " + beneficiaryId);
        String response = RPServiceEntry.getPort().getBeneficiary(beneficiaryId);
        LOG.info("Response from service: " + response);
        return response;
    }

    public PostGenericResponse loginUser(Login login) {
        String request = GSON.toJson(login);
        LOG.info("Calling loginUser with request: " + request);
        String response = RPServiceEntry.getPort().login(request);
        LOG.info("Response from service: " + response);
        return GSON.fromJson(response, PostGenericResponse.class);
    }

    String getBank(String country, String bankId) {
        int bankID = Integer.parseInt(bankId);
        Bank bank = Bank.builder().country_code(country).bank_id(bankID).build();
        String request = GSON.toJson(bank);
        LOG.info("Calling getBank with request: " + request);
        String response = RPServiceEntry.getPort().getBank(request);
        LOG.info("Response from service: " + response);
        return response;
    }

    public User getUserFromJson(Object jsonUser) {
        String userString = GSON.toJson(jsonUser);
        return GSON.fromJson(userString, User.class);
    }

    Beneficiary getBeneficiaryFromJson(Object data) {
        String dataString = GSON.toJson(data);
        return GSON.fromJson(dataString, Beneficiary.class);
    }

    Bank getBankFromJson(Object data) {
        String dataString = GSON.toJson(data);
        return GSON.fromJson(dataString, Bank.class);
    }

    Country getCountryFromJson(JsonArray jsonArray) {
        JsonObject o = (JsonObject) jsonArray.get(0);
        if (o != null) {
            String dataString = GSON.toJson(o);
            return GSON.fromJson(dataString, Country.class);
        } else {
            return null;
        }
    }

    public PostGenericResponse saveTransaction(Sale sale) {
        String request = GSON.toJson(sale);
        LOG.info("Calling saveTransaction with request: " + request);
        String response = RPServiceEntry.getPort().saveTransaction(request);
        LOG.info("Response from service: " + response);
        return GSON.fromJson(response, PostGenericResponse.class);
    }

    public Sale getSaleFromJson(Object jsonSale) {
        String userString = GSON.toJson(jsonSale);
        return GSON.fromJson(userString, Sale.class);
    }

    public GenericCollectionResponse getTransactions(int userId, String type) {
        String userID = String.valueOf(userId);
        LOG.info("Calling getTransaction [" + type + "] with request: " + userID);
        String response;
        switch (type) {
            case "PENDING":
                response = RPServiceEntry.getPort().getPendingTransactions(userID);
                break;
            case "COMPLETED":
                response = RPServiceEntry.getPort().getSuccessfulTransactions(userID);
                break;
            case "FAILED":
                response = RPServiceEntry.getPort().getFailedTransactions(userID);
                break;
            default:
                response = RPServiceEntry.getPort().getAllTransactions(userID);
                break;
        }
        LOG.info("Response from service: " + response);
        return GSON.fromJson(response, GenericCollectionResponse.class);
    }

    public JsonArray getJsonArrayFromObjects(Set<Object> objects) {
        String salesString = GSON.toJson(objects);
        JsonArray jsonArray = (JsonArray) new JsonParser().parse(salesString);
        return jsonArray;
    }
    
    public JsonArray getJsonArrayLookUpData(String type){
        String jsonString = loadLookup(type);
        return (JsonArray) new JsonParser().parse(jsonString);
    }
    
    public PostGenericResponse deleteBeneficiary(String beneficiaryId){
        LOG.info("Calling deleteBeneficiary with id: "+beneficiaryId);
        String response = RPServiceEntry.getPort().deleteBeneficiary(beneficiaryId);
        return GSON.fromJson(response, PostGenericResponse.class);
    }
    
    public PostGenericResponse updateUser(User user){
        String request = GSON.toJson(user);
        LOG.info("Calling updateUser with request: "+request);
        String response = RPServiceEntry.getPort().updateUser(request);
        LOG.info("Response from service: " + response);
        return GSON.fromJson(response, PostGenericResponse.class);
    }
}
