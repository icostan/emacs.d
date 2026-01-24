---
name: fix
description: Automated fix loop for Emacs configuration. Runs tests, spawns fix subagent for each error, verifies fixes, and continues until all errors are resolved.
disable-model-invocation: true
allowed-tools:
  - Bash
  - Task
  - TaskOutput
---

# Fix - Automated Fix Loop

You are orchestrating an automated fix loop. Your job is to run tests, identify errors, delegate fixes to the specialized fix agent, and verify the results.

## Workflow

Execute this loop:

### 1. Run Initial Test

```bash
make test
```

Capture the full output and identify all errors from the test results section.

### 2. Parse Errors

Extract each unique error from the test output. Look for patterns like:
- `Error (use-package): ...`
- `Error: ...`
- `failed: ...`
- Warnings that should be treated as errors

Create a list of distinct errors to fix.

### 3. Fix Loop

For each error in the list:

a. **Spawn Fix Agent**
   - Use the Task tool with `subagent_type='fix'`
   - Pass the specific error message as the prompt
   - Example: `Use the fix agent to fix this error: Error (use-package): Failed to install bundler`
   - Wait for the fix agent to complete

b. **Verify Fix**
   - Run `make test` again
   - Check if the specific error is resolved
   - Check if any new errors were introduced

c. **Update Error List**
   - Remove fixed errors from the list
   - Add any new errors that appeared
   - If the same error persists after a fix attempt, note it for the summary

d. **Continue or Stop**
   - If errors remain and max iterations (10) not reached, continue to next error
   - If no errors remain, proceed to summary
   - If stuck on same error after 2 attempts, skip it and continue with others

### 4. Final Summary

When all errors are resolved (or max iterations reached), provide:

```
## Fix Summary

**Initial State:**
- Total errors found: X
- Error types: [list]

**Fixes Applied:**
1. Error: [error message]
   - Fix applied: [brief description]
   - Result: ✅ Fixed / ❌ Failed / ⚠️ Partial

2. [repeat for each error]

**Final State:**
- ✅ All errors fixed! Test passes.
OR
- ⚠️ Partially fixed. X errors remain:
  - [list remaining errors]
  - [suggestions for manual intervention]

**Total iterations:** X
**Time taken:** [if available]
```

## Error Handling

- **If a fix introduces new errors:** Note it, revert if needed, try different approach
- **If fix agent fails 3 times on same error:** Skip to next error, note in summary
- **If test command fails to run:** Report the issue and stop
- **If max iterations (10) reached:** Stop and report current state

## Success Criteria

The loop completes successfully when:
1. `make test` exits with code 0
2. No errors in the test output
3. Final summary provided

## Important Notes

- Run each fix in sequence (not parallel) to avoid conflicts
- Always verify after each fix before proceeding
- Keep track of which errors were fixed vs skipped
- Be patient - some fixes may require multiple iterations
- Use the fix agent for actual fixing - you are the orchestrator only

## Example Invocation

User runs: `/fix`

You execute:
1. Run make test → find 3 errors
2. Fix error 1 → verify → success
3. Fix error 2 → verify → success
4. Fix error 3 → verify → success
5. Run final test → passes
6. Provide summary

Start the fix loop now.
