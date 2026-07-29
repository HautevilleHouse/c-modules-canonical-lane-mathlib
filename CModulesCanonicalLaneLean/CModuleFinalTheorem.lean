import CModulesCanonicalLaneLean.CModuleGateLemmas

namespace HautevilleHouse
namespace CModulesCanonicalLaneLean

def ConstrainedCModuleClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_cmodule_endgame (A : AdmissibleClass) :
    ConstrainedCModuleClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end CModulesCanonicalLaneLean
end HautevilleHouse