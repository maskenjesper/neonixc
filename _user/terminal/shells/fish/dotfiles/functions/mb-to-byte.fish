
function mb-to-byte
    math "$argv * 1024 * 1024" | string trim | wl-copy
end
