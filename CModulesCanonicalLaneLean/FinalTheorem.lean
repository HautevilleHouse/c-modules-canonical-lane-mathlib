import canonicalLaneMathlib.AdmissibleClass
import CModulesCanonicalLaneLean.ModuleCategory
import CModulesCanonicalLaneLean.HomologicalAlgebra
import CModulesCanonicalLaneLean.ExtTorFunctors

/-!
# Final Constrained Theorem for C Modules

This module defines the constrained C-module closure and proves the endgame.
-/

namespace HautevilleHouse
namespace CModulesCanonicalLaneLean

def ConstrainedCModuleClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_c_module_endgame (A : AdmissibleClass) :
    ConstrainedCModuleClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end CModulesCanonicalLaneLean
end HautevilleHouse