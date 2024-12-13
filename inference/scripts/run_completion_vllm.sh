CURDIR=$(dirname "$(realpath "$0")")
INFERENCE_VLLM="$CURDIR/../inference_vllm.py"

MODEL_DIR='/data/models/Qwen2.5-Coder-7B-Instruct'

COMPLETE_DATA_PATH="$CURDIR/completion/merge"
python "$INFERENCE_VLLM" \
    --data_path "$COMPLETE_DATA_PATH" \
    --base_model "$MODEL_DIR" \
    --task 'completion'  \
    --outdir 'completion_result'

COMPLETE_DATA_PATH="$CURDIR/completion/light"
python "$INFERENCE_VLLM" \
    --data_path "$COMPLETE_DATA_PATH" \
    --base_model "$MODEL_DIR" \
    --task 'completion_light'  \
    --outdir 'completion_result'