import canonicalLaneMathlib.AdmissibleClass
import CModulesCanonicalLaneLean.ModuleCategory

namespace HautevilleHouse
namespace CModulesCanonicalLaneLean

structure MoritaContextPackage (A B : CMAdmittedObject) where
  bimodule : Type u
  equivalenceGiven : Prop
  bimoduleFiniteProjective : Prop
  inverseBimoduleFiniteProjective : Prop
  equivalenceGivenTerm : equivalenceGiven
  bimoduleFiniteProjectiveTerm : bimoduleFiniteProjective
  inverseBimoduleFiniteProjectiveTerm : inverseBimoduleFiniteProjective

structure MoritaEquivalenceEvidence (A B : CMAdmittedObject) (M : MoritaContextPackage A B) where
  equivalenceGivenClosed : M.equivalenceGiven
  bimoduleFiniteProjectiveClosed : M.bimoduleFiniteProjective
  inverseBimoduleFiniteProjectiveClosed : M.inverseBimoduleFiniteProjective

def MoritaEquivalenceClosed (A B : CMAdmittedObject) (M : MoritaContextPackage A B) : Prop :=
  M.equivalenceGiven ∧ M.bimoduleFiniteProjective ∧ M.inverseBimoduleFiniteProjective

theorem morita_equivalence_closed_from_evidence (A B : CMAdmittedObject) (M : MoritaContextPackage A B) (E : MoritaEquivalenceEvidence A B M) :
    MoritaEquivalenceClosed A B M := by
  exact And.intro E.equivalenceGivenClosed (And.intro E.bimoduleFiniteProjectiveClosed E.inverseBimoduleFiniteProjectiveClosed)

end CModulesCanonicalLaneLean
end HautevilleHouse