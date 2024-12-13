CURDIR=$(dirname "$(realpath "$0")")
source "$CURDIR/../../common.env.sh"

# TASK=completion_light
TASK=completion
# TASK=explain_stage1
# TASK=explain_stage2
# TASK=generation

RESULTS_DIR=$(realpath "$CURDIR/../../results")
RESULT_PATH="$RESULTS_DIR/eval/split/${MODEL}_${TASK}"
SAVE_PATH="$RESULTS_DIR/eval/outputs/${MODEL}_${TASK}"

mkdir -p "$SAVE_PATH"
python -u "$CURDIR/../eval_all.py" --result_path "$RESULT_PATH" --save_path "$SAVE_PATH"