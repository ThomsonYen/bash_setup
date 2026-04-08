#!/usr/bin/env bash
# Test script — displays all parsed values from test_advanced.yaml using dict API

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/yaml_parser.sh"

yaml_parse_dict "$SCRIPT_DIR/test_advanced.yaml" cfg

echo "=== Basic scalars ==="
echo "key.item:                        $(cfg get "key.item")"
echo "key2.nested_key.nested_item:     $(cfg get "key2.nested_key.nested_item")"
echo "key2.nested_key2.nested_item2:   $(cfg get "key2.nested_key2.nested_item2")"

echo ""
echo "=== Lists ==="
echo "key2.listed_items:"
cfg get "key2.listed_items"

echo ""
echo "=== Multi-line literal | ==="
echo "multiline_literal:"
cfg get "multiline_literal"

echo ""
echo "=== Multi-line folded > ==="
echo "multiline_folded:"
cfg get "multiline_folded"

echo ""
echo "=== Inline comments ==="
echo "commented_value:     $(cfg get "commented_value")"
echo "quoted_with_hash:    $(cfg get "quoted_with_hash")"
echo "single_quoted_hash:  $(cfg get "single_quoted_hash")"

echo ""
echo "=== Flow mapping ==="
echo "flow_mapping.name:  $(cfg get "flow_mapping.name")"
echo "flow_mapping.age:   $(cfg get "flow_mapping.age")"
echo "flow_mapping.city:  $(cfg get "flow_mapping.city")"

echo ""
echo "=== Flow sequence ==="
echo "flow_sequence:"
cfg get "flow_sequence"

echo ""
echo "=== Nested flow ==="
echo "nested_flow.inline_list:"
cfg get "nested_flow.inline_list"
echo "nested_flow.inline_map.x:  $(cfg get "nested_flow.inline_map.x")"
echo "nested_flow.inline_map.y:  $(cfg get "nested_flow.inline_map.y")"

echo ""
echo "=== Anchors & aliases ==="
echo "defaults.adapter:      $(cfg get "defaults.adapter")"
echo "defaults.host:         $(cfg get "defaults.host")"
echo "development.database:  $(cfg get "development.database")"
echo "development.adapter:   $(cfg get "development.adapter")"
echo "development.host:      $(cfg get "development.host")"
echo "production.database:   $(cfg get "production.database")"
echo "production.adapter:    $(cfg get "production.adapter")"
echo "production.host:       $(cfg get "production.host")"

echo ""
echo "=== Variable references ==="
echo "base_dir:    $(cfg get "base_dir")"
echo "config_dir:  $(cfg get "config_dir")"
echo "log_dir:     $(cfg get "log_dir")"
echo "nested_ref:  $(cfg get "nested_ref")"
echo "dev_conn:    $(cfg get "dev_conn")"

echo ""
echo "=== Environment variable references ==="
echo "home_dir:              $(cfg get "home_dir")"
echo "missing_with_default:  $(cfg get "missing_with_default")"
echo "missing_no_default:    $(cfg get "missing_no_default")"
echo "combined:              $(cfg get "combined")"

cfg destroy

echo ""
echo "=== Re-parse with NONEXISTENT_VAR2 set ==="
export NONEXISTENT_VAR2="now_I_exist"
yaml_parse_dict "$SCRIPT_DIR/test_advanced.yaml" cfg
echo "missing_no_default:    $(cfg get "missing_no_default")"

# echo ""
# echo "=== All keys ==="
# cfg keys

# echo ""
# echo "=== Full dump ==="
# cfg dump

cfg destroy
