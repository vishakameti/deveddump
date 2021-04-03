trigger docutriggerver on ContentVersion (after insert) {
  system.debug('trigger is executed');
}