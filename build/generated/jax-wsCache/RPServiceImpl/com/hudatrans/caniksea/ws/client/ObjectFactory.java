
package com.hudatrans.caniksea.ws.client;

import javax.xml.bind.JAXBElement;
import javax.xml.bind.annotation.XmlElementDecl;
import javax.xml.bind.annotation.XmlRegistry;
import javax.xml.namespace.QName;


/**
 * This object contains factory methods for each 
 * Java content interface and Java element interface 
 * generated in the com.hudatrans.caniksea.ws.client package. 
 * <p>An ObjectFactory allows you to programatically 
 * construct new instances of the Java representation 
 * for XML content. The Java representation of XML 
 * content can consist of schema derived interfaces 
 * and classes representing the binding of schema 
 * type definitions, element declarations and model 
 * groups.  Factory methods for each of these are 
 * provided in this class.
 * 
 */
@XmlRegistry
public class ObjectFactory {

    private final static QName _GetBeneficiaryResponse_QNAME = new QName("http://ws.caniksea.rp.com", "getBeneficiaryResponse");
    private final static QName _LoginResponse_QNAME = new QName("http://ws.caniksea.rp.com", "loginResponse");
    private final static QName _GetAllTransactionsResponse_QNAME = new QName("http://ws.caniksea.rp.com", "getAllTransactionsResponse");
    private final static QName _GetBeneficiariesResponse_QNAME = new QName("http://ws.caniksea.rp.com", "getBeneficiariesResponse");
    private final static QName _UpdateUser_QNAME = new QName("http://ws.caniksea.rp.com", "updateUser");
    private final static QName _RegisterResponse_QNAME = new QName("http://ws.caniksea.rp.com", "registerResponse");
    private final static QName _GetPaymethods_QNAME = new QName("http://ws.caniksea.rp.com", "getPaymethods");
    private final static QName _GetBeneficiaries_QNAME = new QName("http://ws.caniksea.rp.com", "getBeneficiaries");
    private final static QName _GetCountries_QNAME = new QName("http://ws.caniksea.rp.com", "getCountries");
    private final static QName _GetBanks_QNAME = new QName("http://ws.caniksea.rp.com", "getBanks");
    private final static QName _GetSuccessfulTransactions_QNAME = new QName("http://ws.caniksea.rp.com", "getSuccessfulTransactions");
    private final static QName _SaveTransaction_QNAME = new QName("http://ws.caniksea.rp.com", "saveTransaction");
    private final static QName _GetPaymethodsResponse_QNAME = new QName("http://ws.caniksea.rp.com", "getPaymethodsResponse");
    private final static QName _Register_QNAME = new QName("http://ws.caniksea.rp.com", "register");
    private final static QName _GetBanksResponse_QNAME = new QName("http://ws.caniksea.rp.com", "getBanksResponse");
    private final static QName _GetBanksInCountryResponse_QNAME = new QName("http://ws.caniksea.rp.com", "getBanksInCountryResponse");
    private final static QName _InitiateTransactionResponse_QNAME = new QName("http://ws.caniksea.rp.com", "initiateTransactionResponse");
    private final static QName _SaveBeneficiary_QNAME = new QName("http://ws.caniksea.rp.com", "saveBeneficiary");
    private final static QName _GetCountry_QNAME = new QName("http://ws.caniksea.rp.com", "getCountry");
    private final static QName _GetBankResponse_QNAME = new QName("http://ws.caniksea.rp.com", "getBankResponse");
    private final static QName _GetAllTransactions_QNAME = new QName("http://ws.caniksea.rp.com", "getAllTransactions");
    private final static QName _GetBank_QNAME = new QName("http://ws.caniksea.rp.com", "getBank");
    private final static QName _SaveBeneficiaryResponse_QNAME = new QName("http://ws.caniksea.rp.com", "saveBeneficiaryResponse");
    private final static QName _Login_QNAME = new QName("http://ws.caniksea.rp.com", "login");
    private final static QName _GetBeneficiary_QNAME = new QName("http://ws.caniksea.rp.com", "getBeneficiary");
    private final static QName _GetCountriesResponse_QNAME = new QName("http://ws.caniksea.rp.com", "getCountriesResponse");
    private final static QName _DeleteBeneficiary_QNAME = new QName("http://ws.caniksea.rp.com", "deleteBeneficiary");
    private final static QName _GetBanksInCountry_QNAME = new QName("http://ws.caniksea.rp.com", "getBanksInCountry");
    private final static QName _DeleteBeneficiaryResponse_QNAME = new QName("http://ws.caniksea.rp.com", "deleteBeneficiaryResponse");
    private final static QName _GetPendingTransactions_QNAME = new QName("http://ws.caniksea.rp.com", "getPendingTransactions");
    private final static QName _GetFailedTransactionsResponse_QNAME = new QName("http://ws.caniksea.rp.com", "getFailedTransactionsResponse");
    private final static QName _UpdateUserResponse_QNAME = new QName("http://ws.caniksea.rp.com", "updateUserResponse");
    private final static QName _GetCountryResponse_QNAME = new QName("http://ws.caniksea.rp.com", "getCountryResponse");
    private final static QName _GetSuccessfulTransactionsResponse_QNAME = new QName("http://ws.caniksea.rp.com", "getSuccessfulTransactionsResponse");
    private final static QName _GetFailedTransactions_QNAME = new QName("http://ws.caniksea.rp.com", "getFailedTransactions");
    private final static QName _InitiateTransaction_QNAME = new QName("http://ws.caniksea.rp.com", "initiateTransaction");
    private final static QName _SaveTransactionResponse_QNAME = new QName("http://ws.caniksea.rp.com", "saveTransactionResponse");
    private final static QName _GetPendingTransactionsResponse_QNAME = new QName("http://ws.caniksea.rp.com", "getPendingTransactionsResponse");

    /**
     * Create a new ObjectFactory that can be used to create new instances of schema derived classes for package: com.hudatrans.caniksea.ws.client
     * 
     */
    public ObjectFactory() {
    }

    /**
     * Create an instance of {@link GetAllTransactions }
     * 
     */
    public GetAllTransactions createGetAllTransactions() {
        return new GetAllTransactions();
    }

    /**
     * Create an instance of {@link GetCountry }
     * 
     */
    public GetCountry createGetCountry() {
        return new GetCountry();
    }

    /**
     * Create an instance of {@link GetBankResponse }
     * 
     */
    public GetBankResponse createGetBankResponse() {
        return new GetBankResponse();
    }

    /**
     * Create an instance of {@link GetBeneficiary }
     * 
     */
    public GetBeneficiary createGetBeneficiary() {
        return new GetBeneficiary();
    }

    /**
     * Create an instance of {@link Login }
     * 
     */
    public Login createLogin() {
        return new Login();
    }

    /**
     * Create an instance of {@link GetBank }
     * 
     */
    public GetBank createGetBank() {
        return new GetBank();
    }

    /**
     * Create an instance of {@link SaveBeneficiaryResponse }
     * 
     */
    public SaveBeneficiaryResponse createSaveBeneficiaryResponse() {
        return new SaveBeneficiaryResponse();
    }

    /**
     * Create an instance of {@link DeleteBeneficiaryResponse }
     * 
     */
    public DeleteBeneficiaryResponse createDeleteBeneficiaryResponse() {
        return new DeleteBeneficiaryResponse();
    }

    /**
     * Create an instance of {@link DeleteBeneficiary }
     * 
     */
    public DeleteBeneficiary createDeleteBeneficiary() {
        return new DeleteBeneficiary();
    }

    /**
     * Create an instance of {@link GetBanksInCountry }
     * 
     */
    public GetBanksInCountry createGetBanksInCountry() {
        return new GetBanksInCountry();
    }

    /**
     * Create an instance of {@link GetCountriesResponse }
     * 
     */
    public GetCountriesResponse createGetCountriesResponse() {
        return new GetCountriesResponse();
    }

    /**
     * Create an instance of {@link InitiateTransaction }
     * 
     */
    public InitiateTransaction createInitiateTransaction() {
        return new InitiateTransaction();
    }

    /**
     * Create an instance of {@link SaveTransactionResponse }
     * 
     */
    public SaveTransactionResponse createSaveTransactionResponse() {
        return new SaveTransactionResponse();
    }

    /**
     * Create an instance of {@link GetPendingTransactionsResponse }
     * 
     */
    public GetPendingTransactionsResponse createGetPendingTransactionsResponse() {
        return new GetPendingTransactionsResponse();
    }

    /**
     * Create an instance of {@link GetFailedTransactions }
     * 
     */
    public GetFailedTransactions createGetFailedTransactions() {
        return new GetFailedTransactions();
    }

    /**
     * Create an instance of {@link GetFailedTransactionsResponse }
     * 
     */
    public GetFailedTransactionsResponse createGetFailedTransactionsResponse() {
        return new GetFailedTransactionsResponse();
    }

    /**
     * Create an instance of {@link UpdateUserResponse }
     * 
     */
    public UpdateUserResponse createUpdateUserResponse() {
        return new UpdateUserResponse();
    }

    /**
     * Create an instance of {@link GetCountryResponse }
     * 
     */
    public GetCountryResponse createGetCountryResponse() {
        return new GetCountryResponse();
    }

    /**
     * Create an instance of {@link GetSuccessfulTransactionsResponse }
     * 
     */
    public GetSuccessfulTransactionsResponse createGetSuccessfulTransactionsResponse() {
        return new GetSuccessfulTransactionsResponse();
    }

    /**
     * Create an instance of {@link GetPendingTransactions }
     * 
     */
    public GetPendingTransactions createGetPendingTransactions() {
        return new GetPendingTransactions();
    }

    /**
     * Create an instance of {@link GetBeneficiaryResponse }
     * 
     */
    public GetBeneficiaryResponse createGetBeneficiaryResponse() {
        return new GetBeneficiaryResponse();
    }

    /**
     * Create an instance of {@link LoginResponse }
     * 
     */
    public LoginResponse createLoginResponse() {
        return new LoginResponse();
    }

    /**
     * Create an instance of {@link UpdateUser }
     * 
     */
    public UpdateUser createUpdateUser() {
        return new UpdateUser();
    }

    /**
     * Create an instance of {@link GetAllTransactionsResponse }
     * 
     */
    public GetAllTransactionsResponse createGetAllTransactionsResponse() {
        return new GetAllTransactionsResponse();
    }

    /**
     * Create an instance of {@link GetBeneficiariesResponse }
     * 
     */
    public GetBeneficiariesResponse createGetBeneficiariesResponse() {
        return new GetBeneficiariesResponse();
    }

    /**
     * Create an instance of {@link GetBanks }
     * 
     */
    public GetBanks createGetBanks() {
        return new GetBanks();
    }

    /**
     * Create an instance of {@link GetPaymethods }
     * 
     */
    public GetPaymethods createGetPaymethods() {
        return new GetPaymethods();
    }

    /**
     * Create an instance of {@link GetBeneficiaries }
     * 
     */
    public GetBeneficiaries createGetBeneficiaries() {
        return new GetBeneficiaries();
    }

    /**
     * Create an instance of {@link GetCountries }
     * 
     */
    public GetCountries createGetCountries() {
        return new GetCountries();
    }

    /**
     * Create an instance of {@link RegisterResponse }
     * 
     */
    public RegisterResponse createRegisterResponse() {
        return new RegisterResponse();
    }

    /**
     * Create an instance of {@link GetBanksInCountryResponse }
     * 
     */
    public GetBanksInCountryResponse createGetBanksInCountryResponse() {
        return new GetBanksInCountryResponse();
    }

    /**
     * Create an instance of {@link InitiateTransactionResponse }
     * 
     */
    public InitiateTransactionResponse createInitiateTransactionResponse() {
        return new InitiateTransactionResponse();
    }

    /**
     * Create an instance of {@link SaveBeneficiary }
     * 
     */
    public SaveBeneficiary createSaveBeneficiary() {
        return new SaveBeneficiary();
    }

    /**
     * Create an instance of {@link GetBanksResponse }
     * 
     */
    public GetBanksResponse createGetBanksResponse() {
        return new GetBanksResponse();
    }

    /**
     * Create an instance of {@link GetSuccessfulTransactions }
     * 
     */
    public GetSuccessfulTransactions createGetSuccessfulTransactions() {
        return new GetSuccessfulTransactions();
    }

    /**
     * Create an instance of {@link SaveTransaction }
     * 
     */
    public SaveTransaction createSaveTransaction() {
        return new SaveTransaction();
    }

    /**
     * Create an instance of {@link GetPaymethodsResponse }
     * 
     */
    public GetPaymethodsResponse createGetPaymethodsResponse() {
        return new GetPaymethodsResponse();
    }

    /**
     * Create an instance of {@link Register }
     * 
     */
    public Register createRegister() {
        return new Register();
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link GetBeneficiaryResponse }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://ws.caniksea.rp.com", name = "getBeneficiaryResponse")
    public JAXBElement<GetBeneficiaryResponse> createGetBeneficiaryResponse(GetBeneficiaryResponse value) {
        return new JAXBElement<GetBeneficiaryResponse>(_GetBeneficiaryResponse_QNAME, GetBeneficiaryResponse.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link LoginResponse }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://ws.caniksea.rp.com", name = "loginResponse")
    public JAXBElement<LoginResponse> createLoginResponse(LoginResponse value) {
        return new JAXBElement<LoginResponse>(_LoginResponse_QNAME, LoginResponse.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link GetAllTransactionsResponse }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://ws.caniksea.rp.com", name = "getAllTransactionsResponse")
    public JAXBElement<GetAllTransactionsResponse> createGetAllTransactionsResponse(GetAllTransactionsResponse value) {
        return new JAXBElement<GetAllTransactionsResponse>(_GetAllTransactionsResponse_QNAME, GetAllTransactionsResponse.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link GetBeneficiariesResponse }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://ws.caniksea.rp.com", name = "getBeneficiariesResponse")
    public JAXBElement<GetBeneficiariesResponse> createGetBeneficiariesResponse(GetBeneficiariesResponse value) {
        return new JAXBElement<GetBeneficiariesResponse>(_GetBeneficiariesResponse_QNAME, GetBeneficiariesResponse.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link UpdateUser }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://ws.caniksea.rp.com", name = "updateUser")
    public JAXBElement<UpdateUser> createUpdateUser(UpdateUser value) {
        return new JAXBElement<UpdateUser>(_UpdateUser_QNAME, UpdateUser.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link RegisterResponse }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://ws.caniksea.rp.com", name = "registerResponse")
    public JAXBElement<RegisterResponse> createRegisterResponse(RegisterResponse value) {
        return new JAXBElement<RegisterResponse>(_RegisterResponse_QNAME, RegisterResponse.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link GetPaymethods }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://ws.caniksea.rp.com", name = "getPaymethods")
    public JAXBElement<GetPaymethods> createGetPaymethods(GetPaymethods value) {
        return new JAXBElement<GetPaymethods>(_GetPaymethods_QNAME, GetPaymethods.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link GetBeneficiaries }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://ws.caniksea.rp.com", name = "getBeneficiaries")
    public JAXBElement<GetBeneficiaries> createGetBeneficiaries(GetBeneficiaries value) {
        return new JAXBElement<GetBeneficiaries>(_GetBeneficiaries_QNAME, GetBeneficiaries.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link GetCountries }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://ws.caniksea.rp.com", name = "getCountries")
    public JAXBElement<GetCountries> createGetCountries(GetCountries value) {
        return new JAXBElement<GetCountries>(_GetCountries_QNAME, GetCountries.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link GetBanks }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://ws.caniksea.rp.com", name = "getBanks")
    public JAXBElement<GetBanks> createGetBanks(GetBanks value) {
        return new JAXBElement<GetBanks>(_GetBanks_QNAME, GetBanks.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link GetSuccessfulTransactions }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://ws.caniksea.rp.com", name = "getSuccessfulTransactions")
    public JAXBElement<GetSuccessfulTransactions> createGetSuccessfulTransactions(GetSuccessfulTransactions value) {
        return new JAXBElement<GetSuccessfulTransactions>(_GetSuccessfulTransactions_QNAME, GetSuccessfulTransactions.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link SaveTransaction }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://ws.caniksea.rp.com", name = "saveTransaction")
    public JAXBElement<SaveTransaction> createSaveTransaction(SaveTransaction value) {
        return new JAXBElement<SaveTransaction>(_SaveTransaction_QNAME, SaveTransaction.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link GetPaymethodsResponse }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://ws.caniksea.rp.com", name = "getPaymethodsResponse")
    public JAXBElement<GetPaymethodsResponse> createGetPaymethodsResponse(GetPaymethodsResponse value) {
        return new JAXBElement<GetPaymethodsResponse>(_GetPaymethodsResponse_QNAME, GetPaymethodsResponse.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link Register }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://ws.caniksea.rp.com", name = "register")
    public JAXBElement<Register> createRegister(Register value) {
        return new JAXBElement<Register>(_Register_QNAME, Register.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link GetBanksResponse }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://ws.caniksea.rp.com", name = "getBanksResponse")
    public JAXBElement<GetBanksResponse> createGetBanksResponse(GetBanksResponse value) {
        return new JAXBElement<GetBanksResponse>(_GetBanksResponse_QNAME, GetBanksResponse.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link GetBanksInCountryResponse }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://ws.caniksea.rp.com", name = "getBanksInCountryResponse")
    public JAXBElement<GetBanksInCountryResponse> createGetBanksInCountryResponse(GetBanksInCountryResponse value) {
        return new JAXBElement<GetBanksInCountryResponse>(_GetBanksInCountryResponse_QNAME, GetBanksInCountryResponse.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link InitiateTransactionResponse }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://ws.caniksea.rp.com", name = "initiateTransactionResponse")
    public JAXBElement<InitiateTransactionResponse> createInitiateTransactionResponse(InitiateTransactionResponse value) {
        return new JAXBElement<InitiateTransactionResponse>(_InitiateTransactionResponse_QNAME, InitiateTransactionResponse.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link SaveBeneficiary }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://ws.caniksea.rp.com", name = "saveBeneficiary")
    public JAXBElement<SaveBeneficiary> createSaveBeneficiary(SaveBeneficiary value) {
        return new JAXBElement<SaveBeneficiary>(_SaveBeneficiary_QNAME, SaveBeneficiary.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link GetCountry }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://ws.caniksea.rp.com", name = "getCountry")
    public JAXBElement<GetCountry> createGetCountry(GetCountry value) {
        return new JAXBElement<GetCountry>(_GetCountry_QNAME, GetCountry.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link GetBankResponse }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://ws.caniksea.rp.com", name = "getBankResponse")
    public JAXBElement<GetBankResponse> createGetBankResponse(GetBankResponse value) {
        return new JAXBElement<GetBankResponse>(_GetBankResponse_QNAME, GetBankResponse.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link GetAllTransactions }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://ws.caniksea.rp.com", name = "getAllTransactions")
    public JAXBElement<GetAllTransactions> createGetAllTransactions(GetAllTransactions value) {
        return new JAXBElement<GetAllTransactions>(_GetAllTransactions_QNAME, GetAllTransactions.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link GetBank }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://ws.caniksea.rp.com", name = "getBank")
    public JAXBElement<GetBank> createGetBank(GetBank value) {
        return new JAXBElement<GetBank>(_GetBank_QNAME, GetBank.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link SaveBeneficiaryResponse }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://ws.caniksea.rp.com", name = "saveBeneficiaryResponse")
    public JAXBElement<SaveBeneficiaryResponse> createSaveBeneficiaryResponse(SaveBeneficiaryResponse value) {
        return new JAXBElement<SaveBeneficiaryResponse>(_SaveBeneficiaryResponse_QNAME, SaveBeneficiaryResponse.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link Login }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://ws.caniksea.rp.com", name = "login")
    public JAXBElement<Login> createLogin(Login value) {
        return new JAXBElement<Login>(_Login_QNAME, Login.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link GetBeneficiary }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://ws.caniksea.rp.com", name = "getBeneficiary")
    public JAXBElement<GetBeneficiary> createGetBeneficiary(GetBeneficiary value) {
        return new JAXBElement<GetBeneficiary>(_GetBeneficiary_QNAME, GetBeneficiary.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link GetCountriesResponse }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://ws.caniksea.rp.com", name = "getCountriesResponse")
    public JAXBElement<GetCountriesResponse> createGetCountriesResponse(GetCountriesResponse value) {
        return new JAXBElement<GetCountriesResponse>(_GetCountriesResponse_QNAME, GetCountriesResponse.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link DeleteBeneficiary }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://ws.caniksea.rp.com", name = "deleteBeneficiary")
    public JAXBElement<DeleteBeneficiary> createDeleteBeneficiary(DeleteBeneficiary value) {
        return new JAXBElement<DeleteBeneficiary>(_DeleteBeneficiary_QNAME, DeleteBeneficiary.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link GetBanksInCountry }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://ws.caniksea.rp.com", name = "getBanksInCountry")
    public JAXBElement<GetBanksInCountry> createGetBanksInCountry(GetBanksInCountry value) {
        return new JAXBElement<GetBanksInCountry>(_GetBanksInCountry_QNAME, GetBanksInCountry.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link DeleteBeneficiaryResponse }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://ws.caniksea.rp.com", name = "deleteBeneficiaryResponse")
    public JAXBElement<DeleteBeneficiaryResponse> createDeleteBeneficiaryResponse(DeleteBeneficiaryResponse value) {
        return new JAXBElement<DeleteBeneficiaryResponse>(_DeleteBeneficiaryResponse_QNAME, DeleteBeneficiaryResponse.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link GetPendingTransactions }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://ws.caniksea.rp.com", name = "getPendingTransactions")
    public JAXBElement<GetPendingTransactions> createGetPendingTransactions(GetPendingTransactions value) {
        return new JAXBElement<GetPendingTransactions>(_GetPendingTransactions_QNAME, GetPendingTransactions.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link GetFailedTransactionsResponse }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://ws.caniksea.rp.com", name = "getFailedTransactionsResponse")
    public JAXBElement<GetFailedTransactionsResponse> createGetFailedTransactionsResponse(GetFailedTransactionsResponse value) {
        return new JAXBElement<GetFailedTransactionsResponse>(_GetFailedTransactionsResponse_QNAME, GetFailedTransactionsResponse.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link UpdateUserResponse }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://ws.caniksea.rp.com", name = "updateUserResponse")
    public JAXBElement<UpdateUserResponse> createUpdateUserResponse(UpdateUserResponse value) {
        return new JAXBElement<UpdateUserResponse>(_UpdateUserResponse_QNAME, UpdateUserResponse.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link GetCountryResponse }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://ws.caniksea.rp.com", name = "getCountryResponse")
    public JAXBElement<GetCountryResponse> createGetCountryResponse(GetCountryResponse value) {
        return new JAXBElement<GetCountryResponse>(_GetCountryResponse_QNAME, GetCountryResponse.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link GetSuccessfulTransactionsResponse }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://ws.caniksea.rp.com", name = "getSuccessfulTransactionsResponse")
    public JAXBElement<GetSuccessfulTransactionsResponse> createGetSuccessfulTransactionsResponse(GetSuccessfulTransactionsResponse value) {
        return new JAXBElement<GetSuccessfulTransactionsResponse>(_GetSuccessfulTransactionsResponse_QNAME, GetSuccessfulTransactionsResponse.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link GetFailedTransactions }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://ws.caniksea.rp.com", name = "getFailedTransactions")
    public JAXBElement<GetFailedTransactions> createGetFailedTransactions(GetFailedTransactions value) {
        return new JAXBElement<GetFailedTransactions>(_GetFailedTransactions_QNAME, GetFailedTransactions.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link InitiateTransaction }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://ws.caniksea.rp.com", name = "initiateTransaction")
    public JAXBElement<InitiateTransaction> createInitiateTransaction(InitiateTransaction value) {
        return new JAXBElement<InitiateTransaction>(_InitiateTransaction_QNAME, InitiateTransaction.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link SaveTransactionResponse }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://ws.caniksea.rp.com", name = "saveTransactionResponse")
    public JAXBElement<SaveTransactionResponse> createSaveTransactionResponse(SaveTransactionResponse value) {
        return new JAXBElement<SaveTransactionResponse>(_SaveTransactionResponse_QNAME, SaveTransactionResponse.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link GetPendingTransactionsResponse }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://ws.caniksea.rp.com", name = "getPendingTransactionsResponse")
    public JAXBElement<GetPendingTransactionsResponse> createGetPendingTransactionsResponse(GetPendingTransactionsResponse value) {
        return new JAXBElement<GetPendingTransactionsResponse>(_GetPendingTransactionsResponse_QNAME, GetPendingTransactionsResponse.class, null, value);
    }

}
