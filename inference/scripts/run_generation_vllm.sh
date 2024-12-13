CURDIR=$(dirname "$(realpath "$0")")
INFERENCE_VLLM="$CURDIR/../inference_vllm.py"

COMPLETE_DATA_PATH="$CURDIR/generation"

MODEL_DIR='/data/models/Qwen2.5-Coder-7B-Instruct'

python "$CURDIR/../inference_vllm.py" \
    --data_path $COMPLETE_DATA_PATH \
    --base_model $MODEL_DIR \
    --task 'generation'