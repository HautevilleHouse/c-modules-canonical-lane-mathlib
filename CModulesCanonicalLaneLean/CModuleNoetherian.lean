import CModulesCanonicalLaneLean.CModuleStructure

namespace HautevilleHouse
namespace CModulesCanonicalLaneLean

structure CModuleNoetherianPackage (M : CModuleStructure) where
  ascendingChainCondition : Prop
  submoduleFinitelyGenerated : Prop
  finiteLengthImplication : Prop

structure CModuleNoetherianEvidence {M : CModuleStructure}
    (N : CModuleNoetherianPackage M) where
  ascendingChainConditionClosed : N.ascendingChainCondition
  submoduleFinitelyGeneratedClosed : N.submoduleFinitelyGenerated
  finiteLengthImplicationClosed : N.finiteLengthImplication

def CModuleNoetherianClosed {M : CModuleStructure}
    (N : CModuleNoetherianPackage M) : Prop :=
  N.ascendingChainCondition ∧ N.submoduleFinitelyGenerated ∧ N.finiteLengthImplication

theorem cmodule_noetherian_closed_from_evidence {M : CModuleStructure}
    (N : CModuleNoetherianPackage M) (E : CModuleNoetherianEvidence N) :
    CModuleNoetherianClosed N := by
  exact And.intro E.ascendingChainConditionClosed
    (And.intro E.submoduleFinitelyGeneratedClosed E.finiteLengthImplicationClosed)

end CModulesCanonicalLaneLean
end HautevilleHouse