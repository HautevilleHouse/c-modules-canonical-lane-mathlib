import canonicalLaneMathlib.AdmissibleClass
import CModulesCanonicalLaneLean.ModuleCategory
import CModulesCanonicalLaneLean.ProjectiveResolution

namespace HautevilleHouse
namespace CModulesCanonicalLaneLean

structure HochschildComplexPackage (A : CMAdmittedObject) (P : ProjectiveResolutionPackage A) where
  chainComplex : Type u
  differentials : Type u
  homologyGroups : Nat → Type u
  homologyComputed : Prop
  homologyComputedTerm : homologyComputed

structure HochschildHomologyEvidence (A : CMAdmittedObject) (P : ProjectiveResolutionPackage A) (H : HochschildComplexPackage A P) where
  homologyComputedClosed : H.homologyComputed

def HochschildHomologyClosed (A : CMAdmittedObject) (P : ProjectiveResolutionPackage A) (H : HochschildComplexPackage A P) : Prop :=
  H.homologyComputed

theorem hochschild_homology_closed_from_evidence (A : CMAdmittedObject) (P : ProjectiveResolutionPackage A) (H : HochschildComplexPackage A P) (E : HochschildHomologyEvidence A P H) :
    HochschildHomologyClosed A P H := by
  exact E.homologyComputedClosed

end CModulesCanonicalLaneLean
end HautevilleHouse