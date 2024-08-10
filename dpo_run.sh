# pip install -r requirements.txt
set -x

WANDB_MODE=offline python -u train.py model=pythia28 datasets=[hh] loss=dpo loss.beta=0.1 exp_name=anthropic_dpo_pythia28 gradient_accumulation_steps=2 batch_size=64 eval_batch_size=64 n_eval_examples=8512 trainer=BasicTrainer sample_during_eval=false model.policy_dtype=float32 model.reference_dtype=float32 2>&1 | tee dpo_run.log
