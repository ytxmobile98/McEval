CURDIR=$(dirname "$(realpath "$0")")
source "$CURDIR/../../common.env.sh"

RESULTS_DIR=$(realpath "$CURDIR/../../results")

for TASK in completion_light completion explain_stage1 explain_stage2; do
    RESULT_PATH="$RESULTS_DIR/eval/split/${MODEL}_${TASK}"
    SAVE_PATH="$RESULTS_DIR/eval/outputs/${MODEL}_${TASK}"

    mkdir -p "$SAVE_PATH"
    python -u "$CURDIR/../eval_all.py" --result_path "$RESULT_PATH" --save_path "$SAVE_PATH"
done