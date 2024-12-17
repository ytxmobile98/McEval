CURDIR=$(dirname "$(realpath "$0")")
source "$CURDIR/../../common.env.sh"

SPLIT_RESULT_PY="$CURDIR/../../inference/split_result.py"

RESULTS_DIR="$CURDIR/../../results"
SAVE_DIR="$RESULTS_DIR/eval/split"

mkdir -p "$SAVE_DIR"

function split_result {
    local TASK=$1

    if [[ "$TASK" == completion_light ]] || [[ "$TASK" == completion ]]; then
        local SPLIT_FILE_DIR="completion_result"
    else
        local SPLIT_FILE_DIR="$TASK"
    fi
    SPLIT_FILE_DIR="$RESULTS_DIR/$SPLIT_FILE_DIR"

    local SPLIT_FILE="$SPLIT_FILE_DIR/${MODEL}_${TASK}.jsonl"
    python "$SPLIT_RESULT_PY" --split_file "$SPLIT_FILE" --save_dir "$SAVE_DIR"
}

for TASK in completion_light completion explain_stage1 explain_stage2; do
    split_result "$TASK"
done