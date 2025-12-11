trigger AccountRatingTrigger on Account(before insert, before update) {
  if (Trigger.isBefore && (Trigger.isInsert || Trigger.isUpdate)) {
    AccountRatingHandler.applyRating(Trigger.new);
  }
}
