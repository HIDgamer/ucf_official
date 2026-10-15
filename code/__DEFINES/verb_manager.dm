/// Tick usage above which only critical verbs are queued
#define VERB_OVERTIME_QUEUE_THRESHOLD 100
/// Tick usage above which latency-sensitive verbs are queued
#define VERB_HIGH_PRIORITY_QUEUE_THRESHOLD 95
/// Tick usage above which ordinary verbs are queued
#define VERB_DEFAULT_QUEUE_THRESHOLD 85

/// Runs the callback now, or next tick through the subsystem when the server is overloaded
#define QUEUE_OR_CALL_VERB(_verb_callback, _tick_check, _subsystem_to_use) queue_or_call_verb(_verb_callback, _tick_check, _subsystem_to_use)
#define QUEUE_OR_CALL_VERB_FOR(_verb_callback, _subsystem_to_use) queue_or_call_verb(_verb_callback, VERB_DEFAULT_QUEUE_THRESHOLD, _subsystem_to_use)
#define DEFAULT_QUEUE_OR_CALL_VERB(_verb_callback) queue_or_call_verb(_verb_callback, VERB_DEFAULT_QUEUE_THRESHOLD, null)
