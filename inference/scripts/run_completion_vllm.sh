CURDIR=$(dirname "$(realpath "$0")")
OUTDIR="$CURDIR/completion_result"
INFERENCE_VLLM="$CURDIR/../inference_vllm.py"

MODEL_DIR='/data/models/Qwen2.5-Coder-7B-Instruct'

mkdir -p "$OUTDIR"

COMPLETE_DATA_PATH="$CURDIR/completion/merge"
python "$INFERENCE_VLLM" \
    --data_path "$COMPLETE_DATA_PATH" \
    --base_model "$MODEL_DIR" \
    --task 'completion'  \
    --outdir "$OUTDIR"

COMPLETE_DATA_PATH="$CURDIR/completion/light"
python "$INFERENCE_VLLM" \
    --data_path "$COMPLETE_DATA_PATH" \
    --base_model "$MODEL_DIR" \
    --task 'completion_light'  \
    --outdir "$OUTDIR"