trigger LeadAddressValidation on Lead (before insert, before update) {

    for (Lead l : Trigger.new) {

        // Check if Phone is entered
        if (!String.isBlank(l.Phone)) {

            // Check if any address field is missing
            if (
                String.isBlank(l.Street) ||
                String.isBlank(l.City) ||
                String.isBlank(l.State) ||
                String.isBlank(l.PostalCode) ||
                String.isBlank(l.Country)
            ) {
                l.addError(
                    'Complete Address (Street, City, State, Postal Code, Country) is required when Phone is entered.'
                );
            }
        }
    }
}