---
name: figure-it-out
description: "Design an auditable playbook when no narrower one fits: a big or messy problem, a large document or research job, an ambitious multi-part change, or work a human reviews after stepping away. Scales rigor to the task, runs a hypothesis loop, and logs decisions. Use for /figure-it-out or 'figure it out'."
disable-model-invocation: true
---

# Figure it out

When the task matches no playbook, design one. The deliverable before any work is the workflow itself: a sequence of phases that scales rigor to the task, runs the scientific method, and leaves a decision trail a human can audit after stepping away.

## Start

Open a todolist whose first item is to read the **principles** skill. Then add the phases below as todos.

## Phase A: Frame

Ground first, then commit. Don't start the run until you can state:

- The definition of done as a statement you can check true or false (Prove it works, in the **principles** skill).
- Scope, quantified: rough units and effort, plus the blockers grounding surfaced.
- The rigor level, biased high. One-way doors and high blast radius get more. Reversible low-stakes steps get less. Rigor is gates and artifacts, not "try harder".

Present the framing and tradeoffs before committing to a long run. Reversible work proceeds (Never block on the human, in the **principles** skill), but a multi-hour run earns one checkpoint.

## Phase B: Design the workflow

Decompose into small units that can each be finished and checked on their own. Do the riskiest unknown first. Decide how you will check the work before doing it.

- Build the check before the work, and capture the starting state, so the check reads as "before vs after". For a document, the check is a list of what it must contain and the sources each fact is checked against. For code, it is a test or a script.
- For a decision that is hard to undo, write down two or three options and pick one with evidence. Use the **council** skill when a second opinion would help. Skip this when the shape of the work is already clear.
- Decide what fans out. Parallelize only across parts that do not touch each other, and give each worker its own files or branch. Don't over-fan.
- Write the designed phase list down. That list is what the human reviews.

Then execute the design. Add its steps to the todolist as concrete items between the Phase C and Phase D entries. Run each under the Phase C loop discipline, and weave the Phase D log through them, a row as each step lands, rather than saving the whole trail for the end.

## Phase C: Run the loop

Each unit is an experiment. State the hypothesis, make the smallest change, measure against the predicate on the real artifact, keep it if it advanced, revert it if it didn't. Verify each unit before starting the next instead of batching checks at the end.

- Verify by inspecting the artifact, never a self-report. When something passes too easily, suspect the observation method before the system.
- Pair delegated work with a judge. If a worker games the gate, reset and harden the contract. If the gate itself is wrong, fix the gate in its own change rather than routing around it.
- A verdict is VERIFIED, NOT VERIFIED, or INCONCLUSIVE. Inconclusive is not a pass. Don't hide a negative.

## Phase D: Keep the audit trail

Log the run via the **show-me-your-work** skill. figure-it-out's work is usually ambitious enough to keep the trail with the result (committed with the PR, or attached to the document) so the reviewer can read it. The trail plus the diff is what lets the human come back and trust the work.

## Phase E: Verify and hand back

Check the whole against the Phase A definition of done on the real result, not just the check you built. Run the **unslop** skill over every piece of prose you hand back. If you made the same correction twice, turn it into a checklist, template, or script, or run the **reflect** skill.

**Reply:** the playbook you designed, the rigor level and why, the decision-trail path, what's verified against the predicate, and what's still open.
