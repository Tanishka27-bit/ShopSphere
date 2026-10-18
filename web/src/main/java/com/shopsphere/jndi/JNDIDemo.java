package com.shopsphere.jndi;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;

import java.util.Hashtable;

public class JNDIDemo {

    public static void main(String[] args) {

        try {

            Hashtable<String, String> environment =
                    new Hashtable<>();

            environment.put(
                    Context.INITIAL_CONTEXT_FACTORY,
                    "com.sun.jndi.rmi.registry.RegistryContextFactory"
            );

            environment.put(
                    Context.PROVIDER_URL,
                    "rmi://localhost:1099"
            );

            Context context =
                    new InitialContext(environment);

            System.out.println(
                    "JNDI Context created successfully!"
            );

            context.close();

        } catch (NamingException e) {

            System.out.println(
                    "JNDI Error: " + e.getMessage()
            );
        }
    }
}
