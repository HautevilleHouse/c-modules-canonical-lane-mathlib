import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CModulesCanonicalLaneLean

structure ModuleSpacePackage where
  ring : Type u
  abelianGroup : Type v
  scalarMultiplication : ring → abelianGroup → abelianGroup
  distributivity : Prop
  associativity : Prop
  identityAction : Prop

structure ModuleSpaceEvidence (M : ModuleSpacePackage) where
  distributivityClosed : M.distributivity
  associativityClosed : M.associativity
  identityActionClosed : M.identityAction

def ModuleSpaceClosed (M : ModuleSpacePackage) : Prop :=
  M.distributivity ∧ M.associativity ∧ M.identityAction

theorem module_space_closed_from_evidence (M : ModuleSpacePackage) (E : ModuleSpaceEvidence M) : ModuleSpaceClosed M := by
  exact And.intro E.distributivityClosed (And.intro E.associativityClosed E.identityActionClosed)

end CModulesCanonicalLaneLean
end HautevilleHouse