public with sharing class AccountRatingHandler {
  public static void applyRating(List<Account> accounts) {
    if (accounts == null || accounts.isEmpty()) {
      return;
    }

    for (Account acc : accounts) {
      if (acc.AnnualRevenue == null) {
        acc.Rating = 'Cold';
      } else if (acc.AnnualRevenue > 1000000) {
        acc.Rating = 'Hot';
      } else if (acc.AnnualRevenue > 100000) {
        acc.Rating = 'Warm';
      } else {
        acc.Rating = 'Cold';
      }
    }
  }
}
