CURDIR=$(dirname "$(realpath "$0")")
source "$CURDIR/../../common.env.sh"

COMPLETION_DIR="$CURDIR/../../completion/completion_data"
OUTDIR="$CURDIR/../../results/completion_result"

INFERENCE_VLLM="$CURDIR/../inference_vllm.py"

mkdir -p "$OUTDIR"

# completion
COMPLETE_DATA_PATH="$COMPLETION_DIR/merge"
python "$INFERENCE_VLLM" \
    --data_path "$COMPLETE_DATA_PATH" \
    --base_model "$MODEL_DIR" \
    --task 'completion'  \
    --outdir "$OUTDIR"

# completion_light
COMPLETE_DATA_PATH="$COMPLETION_DIR/light"
python "$INFERENCE_VLLM" \
    --data_path "$COMPLETE_DATA_PATH" \
    --base_model "$MODEL_DIR" \
    --task 'completion_light'  \
    --outdir "$OUTDIR"