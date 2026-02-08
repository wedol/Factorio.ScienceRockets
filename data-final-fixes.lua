-- Ensure cargo pod inventory is large enough for promethium delivery.
if data.raw["cargo-pod"] and data.raw["cargo-pod"]["cargo-pod"] then
  data.raw["cargo-pod"]["cargo-pod"].inventory_size = 250
end
