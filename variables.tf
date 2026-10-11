variable "ai_language_models" {
  description = <<EOT
Map of ai_language_models, attributes below
Required:
    - compartment_id
    - project_id
    - model_details (block):
        - classification_mode (optional, block):
            - classification_mode (required)
            - version (optional)
        - language_code (optional)
        - model_type (required)
        - version (optional)
    - training_dataset (block):
        - dataset_id (optional)
        - dataset_type (required)
        - location_details (optional, block):
            - bucket (required)
            - location_type (required)
            - namespace (required)
            - object_names (required)
Optional:
    - defined_tags
    - description
    - display_name
    - freeform_tags
    - test_strategy (block):
        - strategy_type (required)
        - testing_dataset (required, block):
            - dataset_id (optional)
            - dataset_type (required)
            - location_details (optional, block):
                - bucket (required)
                - location_type (required)
                - namespace (required)
                - object_names (required)
        - validation_dataset (optional, block):
            - dataset_id (optional)
            - dataset_type (required)
            - location_details (optional, block):
                - bucket (required)
                - location_type (required)
                - namespace (required)
                - object_names (required)
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
EOT

  type = map(object({
    compartment_id = string
    project_id     = string
    defined_tags   = optional(map(string))
    description    = optional(string)
    display_name   = optional(string)
    freeform_tags  = optional(map(string))
    model_details = object({
      classification_mode = optional(object({
        classification_mode = string
        version             = optional(string)
      }))
      language_code = optional(string)
      model_type    = string
      version       = optional(string)
    })
    training_dataset = object({
      dataset_id   = optional(string)
      dataset_type = string
      location_details = optional(object({
        bucket        = string
        location_type = string
        namespace     = string
        object_names  = list(string)
      }))
    })
    test_strategy = optional(object({
      strategy_type = string
      testing_dataset = object({
        dataset_id   = optional(string)
        dataset_type = string
        location_details = optional(object({
          bucket        = string
          location_type = string
          namespace     = string
          object_names  = list(string)
        }))
      })
      validation_dataset = optional(object({
        dataset_id   = optional(string)
        dataset_type = string
        location_details = optional(object({
          bucket        = string
          location_type = string
          namespace     = string
          object_names  = list(string)
        }))
      }))
    }))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.ai_language_models : (
        contains([for v in ["HEALTH_NLU", "NAMED_ENTITY_RECOGNITION", "PII", "PRE_TRAINED_HEALTH_NLU", "PRE_TRAINED_KEYPHRASE_EXTRACTION", "PRE_TRAINED_LANGUAGE_DETECTION", "PRE_TRAINED_NAMED_ENTITY_RECOGNITION", "PRE_TRAINED_PII", "PRE_TRAINED_SENTIMENT_ANALYSIS", "PRE_TRAINED_SUMMARIZATION", "PRE_TRAINED_TEXT_CLASSIFICATION", "PRE_TRAINED_TRANSLATION", "PRE_TRAINED_UNIVERSAL", "TEXT_CLASSIFICATION"] : lower(v)], lower(v.model_details.model_type))
      )
    ])
    error_message = "must be one of: \"HEALTH_NLU\", \"NAMED_ENTITY_RECOGNITION\", \"PII\", \"PRE_TRAINED_HEALTH_NLU\", \"PRE_TRAINED_KEYPHRASE_EXTRACTION\", \"PRE_TRAINED_LANGUAGE_DETECTION\", \"PRE_TRAINED_NAMED_ENTITY_RECOGNITION\", \"PRE_TRAINED_PII\", \"PRE_TRAINED_SENTIMENT_ANALYSIS\", \"PRE_TRAINED_SUMMARIZATION\", \"PRE_TRAINED_TEXT_CLASSIFICATION\", \"PRE_TRAINED_TRANSLATION\", \"PRE_TRAINED_UNIVERSAL\", \"TEXT_CLASSIFICATION\""
  }
  validation {
    condition = alltrue([
      for k, v in var.ai_language_models : (
        v.model_details.classification_mode == null || (contains([for v in ["MULTI_CLASS", "MULTI_LABEL"] : lower(v)], lower(v.model_details.classification_mode.classification_mode)))
      )
    ])
    error_message = "must be one of: \"MULTI_CLASS\", \"MULTI_LABEL\""
  }
  validation {
    condition = alltrue([
      for k, v in var.ai_language_models : (
        contains([for v in ["DATA_SCIENCE_LABELING", "OBJECT_STORAGE"] : lower(v)], lower(v.training_dataset.dataset_type))
      )
    ])
    error_message = "must be one of: \"DATA_SCIENCE_LABELING\", \"OBJECT_STORAGE\""
  }
  validation {
    condition = alltrue([
      for k, v in var.ai_language_models : (
        v.training_dataset.location_details == null || (contains([for v in ["OBJECT_LIST"] : lower(v)], lower(v.training_dataset.location_details.location_type)))
      )
    ])
    error_message = "must be one of: \"OBJECT_LIST\""
  }
  validation {
    condition = alltrue([
      for k, v in var.ai_language_models : (
        v.test_strategy == null || (contains([for v in ["TEST_AND_VALIDATION_DATASET"] : lower(v)], lower(v.test_strategy.strategy_type)))
      )
    ])
    error_message = "must be one of: \"TEST_AND_VALIDATION_DATASET\""
  }
  validation {
    condition = alltrue([
      for k, v in var.ai_language_models : (
        v.test_strategy == null || (contains([for v in ["DATA_SCIENCE_LABELING", "OBJECT_STORAGE"] : lower(v)], lower(v.test_strategy.testing_dataset.dataset_type)))
      )
    ])
    error_message = "must be one of: \"DATA_SCIENCE_LABELING\", \"OBJECT_STORAGE\""
  }
  validation {
    condition = alltrue([
      for k, v in var.ai_language_models : (
        v.test_strategy == null || (v.test_strategy.testing_dataset.location_details == null || (contains([for v in ["OBJECT_LIST"] : lower(v)], lower(v.test_strategy.testing_dataset.location_details.location_type))))
      )
    ])
    error_message = "must be one of: \"OBJECT_LIST\""
  }
  validation {
    condition = alltrue([
      for k, v in var.ai_language_models : (
        v.test_strategy == null || (v.test_strategy.validation_dataset == null || (contains([for v in ["DATA_SCIENCE_LABELING", "OBJECT_STORAGE"] : lower(v)], lower(v.test_strategy.validation_dataset.dataset_type))))
      )
    ])
    error_message = "must be one of: \"DATA_SCIENCE_LABELING\", \"OBJECT_STORAGE\""
  }
  validation {
    condition = alltrue([
      for k, v in var.ai_language_models : (
        v.test_strategy == null || (v.test_strategy.validation_dataset == null || (v.test_strategy.validation_dataset.location_details == null || (contains([for v in ["OBJECT_LIST"] : lower(v)], lower(v.test_strategy.validation_dataset.location_details.location_type)))))
      )
    ])
    error_message = "must be one of: \"OBJECT_LIST\""
  }
}

