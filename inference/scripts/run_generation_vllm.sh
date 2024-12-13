CURDIR=$(dirname "$(realpath "$0")")
source "$CURDIR/../../common.env.sh"

INFERENCE_VLLM="$CURDIR/../inference_vllm.py"

COMPLETE_DATA_PATH="$CURDIR/../../results/generation"
mkdir -p "$COMPLETE_DATA_PATH"
python "$CURDIR/../inference_vllm.py" \
    --data_path "$COMPLETE_DATA_PATH" \
    --base_model "$MODEL_DIR" \
    --task 'generation'