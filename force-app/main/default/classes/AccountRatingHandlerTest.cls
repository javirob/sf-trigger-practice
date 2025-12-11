@isTest
private class AccountRatingHandlerTest {
  @isTest
  static void testHotRating() {
    Account acc = new Account(name = 'Big Account', AnnualRevenue = 1500000);
    insert acc;

    acc = [SELECT Id, Rating FROM Account WHERE Id = :acc.Id];
    System.assertEquals('Hot', acc.Rating, 'Revenue > 1M -> rating is Hot');
  }

  @isTest
  static void testWarmRating() {
    Account acc = new Account(name = 'Warm Account', AnnualRevenue = 200000);
    insert acc;

    acc = [SELECT Id, Rating FROM Account WHERE Id = :acc.Id];
    System.assertEquals('Warm', acc.Rating, 'Revenue > 100K -> rating is Warm');
  }

  @isTest
  static void testColdRating() {
    Account coldAcc = new Account(name = 'Cold Account', AnnualRevenue = 10000);

    Account noRevenue = new Account(name = 'No revenue Account');

    insert new List<Account>{ coldAcc, noRevenue };

    Map<Id, Account> results = new Map<Id, Account>(
      [
        SELECT Id, Rating
        FROM Account
        WHERE Id IN :new List<Id>{ coldAcc.Id, noRevenue.Id }
      ]
    );

    System.assertEquals(
      'Cold',
      results.get(coldAcc.Id).Rating,
      'Revenue < 100k -> Cold Account'
    );
    System.assertEquals(
      'Cold',
      results.get(noRevenue.Id).Rating,
      'No Revenue -> Cold Account'
    );
  }
}
