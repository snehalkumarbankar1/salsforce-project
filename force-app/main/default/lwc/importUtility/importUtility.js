import { LightningElement } from 'lwc';
import MYLOGO from "@salesforce/resourceUrl/smsLogo";
import SHOWINPROD from "@salesforce/label/c.show_in_prod";
import USERINFO from "@salesforce/user/Id";
import HASPERMISSION from "@salesforce/userPermission/ViewSetup";
import DEVICEINFO from "@salesforce/client/formFactor";
import LANG from "@salesforce/i18n/lang";
import LOCALE from "@salesforce/i18n/locale";
import CURRENCY from "@salesforce/i18n/currency";
import TIMEZONE from "@salesforce/i18n/timeZone";

export default class ImportUtility extends LightningElement {
    src= MYLOGO;
    userId = USERINFO;
     hasPermission = HASPERMISSION;
    deviceInfo = DEVICEINFO;
    lang = LANG;
    locale = LOCALE;
    currency = CURRENCY;
    timeZone = TIMEZONE;
  get showInProd(){

        return SHOWINPROD == "true" ? true : false;
    }

}