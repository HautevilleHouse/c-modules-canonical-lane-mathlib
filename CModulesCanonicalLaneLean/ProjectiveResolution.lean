import canonicalLaneMathlib.AdmissibleClass
import CModulesCanonicalLaneLean.ModuleCategory

namespace HautevilleHouse
namespace CModulesCanonicalLaneLean

structure ProjectiveResolutionPackage (A : CMAdmittedObject) where
  resolution : Type u
  augmentation : resolution → A.obj.carrier
  exactness : Prop
  eachProjective : Prop
  exactnessTerm : exactness
  eachProjectiveTerm : eachProjective

structure ProjectiveResolutionEvidence (A : CMAdmittedObject) (P : ProjectiveResolutionPackage A) where
  exactnessClosed : P.exactness
  eachProjectiveClosed : P.eachProjective

def ProjectiveResolutionClosed (A : CMAdmittedObject) (P : ProjectiveResolutionPackage A) : Prop :=
  P.exactness ∧ P.eachProjective

theorem projective_resolution_closed_from_evidence (A : CMAdmittedObject) (P : ProjectiveResolutionPackage A) (E : ProjectiveResolutionEvidence A P) :
    ProjectiveResolutionClosed A P := by
  exact And.intro E.exactnessClosed E.eachProjectiveClosed

end CModulesCanonicalLaneLean
end HautevilleHouse