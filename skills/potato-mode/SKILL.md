---
name: potato-mode
description: >-
  Work in potato's style: how they want replies, delegation, usage limits,
  reviews and content files handled. Use when the user says "potato mode",
  "/potato-mode", or asks you to work in their style.
disable-model-invocation: true
---

# Potato mode

Working conventions mined from the user's sessions (2026-10-27 to 11-16) and confirmed by them. Project rules in `<work-root>\CLAUDE.md` (or `AGENTS.md`) still apply. `<work-root>` is the user's main work folder. This file doesn't repeat them.

## Replies

- Call the `unslop` skill before sending every report or reply, and before writing any brief, doc, commit message or PR text. Load it each time; don't apply its rules from memory.
- Plain English, short, answer first. Use Korean only for content terms and file names (변형 선지, 미주, 평가원).
- Define every internal label the first time you use it: phase 1, fix round, B4, S02, linter error, "the ban". The user asked "what do you mean by X" about eight of these in three weeks.
- Give decisions as a numbered list, one item per decision, each with a recommendation. The user answers "1. yes 2. replace it" or "go with the recommendations".
- When the user asks where an issue is, show it. Embed a crop or screenshot of the exact spot, not just a page number.
- Before a multi-agent or multi-hour job, restate the task in two or three lines. If the user describes earlier work, check it against the threads and files and correct them where their memory is off. They ask for this ("correct me if I am wrong").

## Delegation and usage

- The main thread (the T3 thread the user talks to) is the only orchestrator. It launches every agent itself with `delegate_task`, and every brief says "Do not start sub-agents. Do the work yourself." Don't start a separate orchestrator thread: a report from a sub-agent's own sub-agent often never reached the main thread.
- HWPX batches follow `<work-root>\_dev\work\audit-workflow-2.0.md` for stages, briefs, the batch state file and parallelism.
- Use the model and effort the user names ("sol high" means GPT-6.1 Sol at high effort). When they name none, use these roles:

  | Role | Default |
  |---|---|
  | Orchestrates | The main thread |
  | Writes Korean text (variants, solutions) | Opus 5.5, high |
  | Builds, fixes, deploys | GPT-6.1 Sol, high (several in parallel is fine) |
  | Text audit before the build | 변형 선지: GPT-6 Astra medium + Sol 6.1 high + Opus 5.5 high. 숫자 변형: Astra medium only |
  | Build audit, re-check of fixes | One Sol 6.1 high, fresh context |
  | Visual review of a PDF | Opus 5.5, medium |
  | Final audit, fresh context | Fable 5.2 medium and GPT-6 Astra high, in parallel, same brief |
  | Advisor | Fable 5.2, one narrow question |
  | Review of a web app change | One GPT reviewer |

- Claude agents are approved for the Claude roles in this table. Anything else goes to a GPT model. Ask before starting any other Claude agent.
- Call the Fable advisor only when the solver and the writer (or two reviewers) disagree on the physics, an original problem looks wrong, a builder fails the same fix twice, or the batch type is new. Not for wording, layout, typos or status.
- Don't use Terra as an auditor; it stopped early in four audit rounds. Don't use Argon; it used a week's quota without returning an audit.
- Keep the main thread's context small. Workers write a report file first, then reply in at most ten lines. Keep a `BATCH_STATE.md` in the batch folder and read it first after the context is summarized.
- The user tracks their own usage limits and tells you where they stand. Claude is the tighter limit, and the main thread spends it for the whole batch. When they have usage to burn, run more builders or writers in parallel, not more audits. When they say a limit is close, have every worker on that limit finish its current item and write a progress record, then cancel the rest and record the resume point.
- Fast mode only when asked, and only for the run they name.
- "Pause" means tell running agents to stop at a safe point and wait. Don't cancel them. "Resume" restarts them.
- "Check on task N" means read that thread now and say what it's doing, whether it waits on the user, and what's left.

## Review before ship

- Audits use a fresh-context agent. When the user asks for a score out of 10, give auditors the rubric but not the target score the loop is aiming for.
- An auditor that returns "incomplete" has not passed. Report what it didn't cover.
- Done means checked in the rendered output: PDF pages viewed as images, the live site in a browser. A passing script alone isn't done.
- HWPX batches follow `<work-root>\_dev\work\audit-workflow-2.0.md`. One fix round, then stop and let the user decide. They often say "make this the final".
- Code for a live site: a reviewer checks it first. If the review finds nothing big, deploy without asking again. Bundle small fixes into one release.

## Content and files

- Fix typos without asking, in original problems and 해설 too. Log each fix before and after.
- Keep physics or content errors in an original as written and add a red `[편집자 주] 원문 오류: …` note. Don't rewrite them silently.
- Wording the user dictated is locked. When a rebuild or restyle runs, list those items in the brief so they carry forward.
- Ask when the intent of a content change is unclear. Typo and layout fixes need no question.
- Never overwrite a deliverable without a backup. New outputs get a dated name (`[YYMMDD] …`). When a final is replaced, back up the old file and record both hashes.
- To change a skill, rules file or workflow, make a versioned copy (`…-2.0`) and leave the original alone. State how to adopt it and how to revert.
- When the user corrects a behavior that will recur, put the fix in the skill or brief that caused it, not only in the current run.

## Other skills

- `principles` before declaring work done or trusting a number.
- `figure-it-out` when no other skill fits a problem.
