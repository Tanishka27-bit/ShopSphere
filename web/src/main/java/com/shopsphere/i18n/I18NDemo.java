package com.shopsphere.i18n;

import java.text.NumberFormat;
import java.util.Locale;

public class I18NDemo {

    public static void main(String[] args) {

        double price = 2499.50;

        // English - India
        Locale indiaLocale = new Locale("en", "IN");

        NumberFormat indiaFormat =
                NumberFormat.getCurrencyInstance(indiaLocale);

        System.out.println(
                "India: " + indiaFormat.format(price)
        );

        // English - USA
        Locale usaLocale = Locale.US;

        NumberFormat usaFormat =
                NumberFormat.getCurrencyInstance(usaLocale);

        System.out.println(
                "USA: " + usaFormat.format(price)
        );

        // French - France
        Locale franceLocale = Locale.FRANCE;

        NumberFormat franceFormat =
                NumberFormat.getCurrencyInstance(franceLocale);

        System.out.println(
                "France: " + franceFormat.format(price)
        );
    }
}
