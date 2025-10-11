# {inputs, outputs, nixpkgs, ...}: {
#     flake = {
#
#       nixosConfigurations = {
#
#         jupiter = nixpkgs.lib.nixosSystem {
#           modules = [../../profiles/jupiter];
#           specialArgs = {
#             inherit inputs outputs; 
#             localUsers = ["jakob"];
#           };
#         };
#       };
#     };
# }
