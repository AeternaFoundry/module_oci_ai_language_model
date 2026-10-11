output "ai_language_models_id" {
  description = "Map of id values across all ai_language_models, keyed the same as var.ai_language_models except keys with no id are omitted"
  value       = { for k, v in oci_ai_language_model.ai_language_models : k => v.id if v.id != null && length(v.id) > 0 }
}
output "ai_language_models_compartment_id" {
  description = "Map of compartment_id values across all ai_language_models, keyed the same as var.ai_language_models except keys with no compartment_id are omitted"
  value       = { for k, v in oci_ai_language_model.ai_language_models : k => v.compartment_id if v.compartment_id != null && length(v.compartment_id) > 0 }
}
output "ai_language_models_defined_tags" {
  description = "Map of defined_tags values across all ai_language_models, keyed the same as var.ai_language_models except keys with no defined_tags are omitted"
  value       = { for k, v in oci_ai_language_model.ai_language_models : k => v.defined_tags if v.defined_tags != null && length(v.defined_tags) > 0 }
}
output "ai_language_models_description" {
  description = "Map of description values across all ai_language_models, keyed the same as var.ai_language_models except keys with no description are omitted"
  value       = { for k, v in oci_ai_language_model.ai_language_models : k => v.description if v.description != null && length(v.description) > 0 }
}
output "ai_language_models_display_name" {
  description = "Map of display_name values across all ai_language_models, keyed the same as var.ai_language_models except keys with no display_name are omitted"
  value       = { for k, v in oci_ai_language_model.ai_language_models : k => v.display_name if v.display_name != null && length(v.display_name) > 0 }
}
output "ai_language_models_evaluation_results" {
  description = "Map of evaluation_results values across all ai_language_models, keyed the same as var.ai_language_models except keys with no evaluation_results are omitted"
  value       = { for k, v in oci_ai_language_model.ai_language_models : k => v.evaluation_results if v.evaluation_results != null && length(v.evaluation_results) > 0 }
}
output "ai_language_models_freeform_tags" {
  description = "Map of freeform_tags values across all ai_language_models, keyed the same as var.ai_language_models except keys with no freeform_tags are omitted"
  value       = { for k, v in oci_ai_language_model.ai_language_models : k => v.freeform_tags if v.freeform_tags != null && length(v.freeform_tags) > 0 }
}
output "ai_language_models_lifecycle_details" {
  description = "Map of lifecycle_details values across all ai_language_models, keyed the same as var.ai_language_models except keys with no lifecycle_details are omitted"
  value       = { for k, v in oci_ai_language_model.ai_language_models : k => v.lifecycle_details if v.lifecycle_details != null && length(v.lifecycle_details) > 0 }
}
output "ai_language_models_model_details" {
  description = "Map of model_details values across all ai_language_models, keyed the same as var.ai_language_models except keys with no model_details are omitted"
  value       = { for k, v in oci_ai_language_model.ai_language_models : k => one(v.model_details) if v.model_details != null && length(v.model_details) > 0 }
}
output "ai_language_models_project_id" {
  description = "Map of project_id values across all ai_language_models, keyed the same as var.ai_language_models except keys with no project_id are omitted"
  value       = { for k, v in oci_ai_language_model.ai_language_models : k => v.project_id if v.project_id != null && length(v.project_id) > 0 }
}
output "ai_language_models_state" {
  description = "Map of state values across all ai_language_models, keyed the same as var.ai_language_models except keys with no state are omitted"
  value       = { for k, v in oci_ai_language_model.ai_language_models : k => v.state if v.state != null && length(v.state) > 0 }
}
output "ai_language_models_system_tags" {
  description = "Map of system_tags values across all ai_language_models, keyed the same as var.ai_language_models except keys with no system_tags are omitted"
  value       = { for k, v in oci_ai_language_model.ai_language_models : k => v.system_tags if v.system_tags != null && length(v.system_tags) > 0 }
}
output "ai_language_models_test_strategy" {
  description = "Map of test_strategy values across all ai_language_models, keyed the same as var.ai_language_models except keys with no test_strategy are omitted"
  value       = { for k, v in oci_ai_language_model.ai_language_models : k => one(v.test_strategy) if v.test_strategy != null && length(v.test_strategy) > 0 }
}
output "ai_language_models_time_created" {
  description = "Map of time_created values across all ai_language_models, keyed the same as var.ai_language_models except keys with no time_created are omitted"
  value       = { for k, v in oci_ai_language_model.ai_language_models : k => v.time_created if v.time_created != null && length(v.time_created) > 0 }
}
output "ai_language_models_time_updated" {
  description = "Map of time_updated values across all ai_language_models, keyed the same as var.ai_language_models except keys with no time_updated are omitted"
  value       = { for k, v in oci_ai_language_model.ai_language_models : k => v.time_updated if v.time_updated != null && length(v.time_updated) > 0 }
}
output "ai_language_models_training_dataset" {
  description = "Map of training_dataset values across all ai_language_models, keyed the same as var.ai_language_models except keys with no training_dataset are omitted"
  value       = { for k, v in oci_ai_language_model.ai_language_models : k => one(v.training_dataset) if v.training_dataset != null && length(v.training_dataset) > 0 }
}
output "ai_language_models_version" {
  description = "Map of version values across all ai_language_models, keyed the same as var.ai_language_models except keys with no version are omitted"
  value       = { for k, v in oci_ai_language_model.ai_language_models : k => v.version if v.version != null && length(v.version) > 0 }
}

