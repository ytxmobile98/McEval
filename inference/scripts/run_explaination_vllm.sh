CURDIR=$(dirname "$(realpath "$0")")
INFERENCE_VLLM="$CURDIR/../inference_vllm.py"

COMPLETE_DATA_PATH="$CURDIR/completion/explain_data"
MODEL_DIR='/data/models/Qwen2.5-Coder-7B-Instruct'

python "$INFERENCE_VLLM" \
    --data_path "$COMPLETE_DATA_PATH" \
    --base_model "$MODEL_DIR" \
    --task 'explain_stage1' \
    --outdir 'explain_stage1'

python "$CURDIR/../gen_stage2_instruction.py"

COMPLETE_DATA_PATH='./explain_stage2/explain_stage1'
python "$INFERENCE_VLLM" \
    --data_path "$COMPLETE_DATA_PATH" \
    --base_model "$MODEL_DIR" \
    --task 'explain_stage2' \
    --outdir 'explain_result'
