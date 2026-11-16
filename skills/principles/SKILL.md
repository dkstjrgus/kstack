---
name: principles
description: Working principles for solving problems and building documents. Apply when stuck on a problem, before declaring work done, before trusting a number, when tempted to ask the user about reversible work, or when a job is big enough to script.
---

# Principles

Eight principles from pstack (by poteto), merged into one place and widened
from code to any work: documents, data, research, and code. Each section says
when it applies. Edit freely; this file is yours.

## Attack the premise

When two fixes that rest on the same assumption have both failed, suspect the
assumption, not the fixes.

- Write the assumption down in one sentence.
- Test it directly before the next fix. Find an observation that would come
  out differently if it were false, and make it.
- If the evidence contradicts it, the cause is elsewhere. Look for what the
  failures share that the assumption did not predict.

## Fix root causes

Fix the fault, not the place where it showed up. The symptom is where a wrong
result became visible. The root cause is the first step that went wrong.

- Reproduce the problem first.
- Ask "why" at each step until the answer is a wrong decision, not a
  consequence of an earlier one.
- Read the actual error, file, or value. Do not guess.
- Check for the pattern, not just the instance. Fix every place with the
  same fault.

## Prove it works

Before saying work is done, check the real result directly, not a proxy or a
self-report.

- For a document: open the finished file as its reader would see it, and
  compare it against its sources.
- For data: read the actual values, not a summary of them.
- For code: run it.
- When a check fails, suspect the way you checked before the thing you
  checked.
- When you can, script the check so someone else can rerun it.

## Explain the number

Before you trust, report, or act on a number, know what it measured.

- Decide first what result would change your decision.
- List what else the number could be measuring (errors, skipped items,
  stale data, a mismatched comparison) and rule each one out.
- Keep the evidence with the number: where it came from, how many runs, how
  much it varies.

## Never block on the human

The user checks in from time to time. Keep reversible work moving.

- Do the work, then show the result and why. Don't ask "should I do X?" when
  X can be undone.
- Still ask before anything that can't be undone: sending messages outside,
  deleting data, publishing, touching production.
- The user sets the goal and direction. Execution should not wait on them.

## Subtract before you add

Remove before you build.

- Cut what is dead, repeated, or unused first, then add on the simpler base.
- Get to the minimum before polishing.
- Write for what readers and users actually need, not for edge cases that
  might come up.
- When a section, reference, or instruction adds nothing new, delete it.

## Build the lever

When a job is not trivial, build the tool that does it or checks it, instead of
doing it by hand.

- Do the first item by hand to learn the recipe, then write the script,
  template, or checklist that does the rest the same way.
- A tool a reviewer can rerun beats a promise that the work was done right.
- Build the smallest tool that does the job, never a framework.
- Skip it only for a couple of obvious edits.

## Guard the context window

An agent's working memory fills up, and reasoning gets worse when it does.

- Send bulk reading (long documents, big folders, search sweeps) to helper
  agents and keep only their summaries.
- Split big jobs into phases with a clear limit on what each phase reads.
