CURDIR=$(dirname "$(realpath "$0")")

INFERENCE_VLLM="$CURDIR/../inference_vllm.py"

MODEL_DIR='/data/models/Qwen2.5-Coder-7B-Instruct'

COMPLETE_DATA_PATH="$CURDIR/../../results/generation"
mkdir -p "$COMPLETE_DATA_PATH"
python "$CURDIR/../inference_vllm.py" \
    --data_path "$COMPLETE_DATA_PATH" \
    --base_model "$MODEL_DIR" \
    --task 'generation'