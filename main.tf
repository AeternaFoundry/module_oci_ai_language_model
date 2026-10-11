resource "oci_ai_language_model" "ai_language_models" {
  for_each = var.ai_language_models

  compartment_id = each.value.compartment_id
  project_id     = each.value.project_id
  defined_tags   = each.value.defined_tags
  description    = each.value.description
  display_name   = each.value.display_name
  freeform_tags  = each.value.freeform_tags

  model_details {
    dynamic "classification_mode" {
      for_each = each.value.model_details.classification_mode != null ? [each.value.model_details.classification_mode] : []
      content {
        classification_mode = classification_mode.value.classification_mode
        version             = classification_mode.value.version
      }
    }
    language_code = each.value.model_details.language_code
    model_type    = each.value.model_details.model_type
    version       = each.value.model_details.version
  }

  training_dataset {
    dataset_id   = each.value.training_dataset.dataset_id
    dataset_type = each.value.training_dataset.dataset_type
    dynamic "location_details" {
      for_each = each.value.training_dataset.location_details != null ? [each.value.training_dataset.location_details] : []
      content {
        bucket        = location_details.value.bucket
        location_type = location_details.value.location_type
        namespace     = location_details.value.namespace
        object_names  = location_details.value.object_names
      }
    }
  }

  dynamic "test_strategy" {
    for_each = each.value.test_strategy != null ? [each.value.test_strategy] : []
    content {
      strategy_type = test_strategy.value.strategy_type
      testing_dataset {
        dataset_id   = test_strategy.value.testing_dataset.dataset_id
        dataset_type = test_strategy.value.testing_dataset.dataset_type
        dynamic "location_details" {
          for_each = test_strategy.value.testing_dataset.location_details != null ? [test_strategy.value.testing_dataset.location_details] : []
          content {
            bucket        = location_details.value.bucket
            location_type = location_details.value.location_type
            namespace     = location_details.value.namespace
            object_names  = location_details.value.object_names
          }
        }
      }
      dynamic "validation_dataset" {
        for_each = test_strategy.value.validation_dataset != null ? [test_strategy.value.validation_dataset] : []
        content {
          dataset_id   = validation_dataset.value.dataset_id
          dataset_type = validation_dataset.value.dataset_type
          dynamic "location_details" {
            for_each = validation_dataset.value.location_details != null ? [validation_dataset.value.location_details] : []
            content {
              bucket        = location_details.value.bucket
              location_type = location_details.value.location_type
              namespace     = location_details.value.namespace
              object_names  = location_details.value.object_names
            }
          }
        }
      }
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

