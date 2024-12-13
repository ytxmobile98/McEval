CURDIR=$(dirname "$(realpath "$0")")
RESULTS_DIR="$CURDIR/../../results"
EXPLIAIN_DIR="$CURDIR/../../explanation/explaination_data"

INFERENCE_VLLM="$CURDIR/../inference_vllm.py"

MODEL_DIR='/data/models/Qwen2.5-Coder-7B-Instruct'

# stage 1
COMPLETE_DATA_PATH="$EXPLIAIN_DIR"
OUTDIR="$RESULTS_DIR/explain_stage1"
mkdir -p "$OUTDIR"
python "$INFERENCE_VLLM" \
    --data_path "$COMPLETE_DATA_PATH" \
    --base_model "$MODEL_DIR" \
    --task 'explain_stage1' \
    --outdir "$OUTDIR"

python "$CURDIR/../gen_stage2_instruction.py"

# stage 2
COMPLETE_DATA_PATH="$RESULTS_DIR/explain_stage1"
OUTDIR="$RESULTS_DIR/explain_stage2"
mkdir -p "$OUTDIR"
python "$INFERENCE_VLLM" \
    --data_path "$COMPLETE_DATA_PATH" \
    --base_model "$MODEL_DIR" \
    --task 'explain_stage2' \
    --outdir "$OUTDIR"
