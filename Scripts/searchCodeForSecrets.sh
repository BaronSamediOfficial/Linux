#!/bin/bash

# Script first updates semgrep rules and then scans repository for secrets

codeRepository=$1
language=$2

updateSemgrepRules () {
    cd /Users/geoffreyowden/mystuff/SemGrepTool/semgrep-rules
    git pull 
    cd - > /dev/null            # Runs cd witout displaying output
}

updateSemgrepRules
semgrep -l $language --config=/Users/geoffreyowden/mystuff/SemGrepTool/semgrep-rules/generic/secrets/security -q -o SearchForSecrets.log $codeRepository
