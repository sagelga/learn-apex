trigger HellloWorldTrigger on Account (before insert) {
	System.debug('Hello World!');
}
