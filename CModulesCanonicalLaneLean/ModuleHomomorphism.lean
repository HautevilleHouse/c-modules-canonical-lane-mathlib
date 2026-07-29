import canonicalLaneMathlib.AdmissibleClass
import CModulesCanonicalLaneLean.CModuleStructure

namespace HautevilleHouse
namespace CModulesCanonicalLaneLean

structure ModuleHomomorphismPackage (M N : CModulePackage) where
  map : M.carrier → N.carrier
  additive : Prop
  homogeneous : Prop
  additiveClosed : additive
  homogeneousClosed : homogeneous

structure ModuleHomomorphismEvidence {M N : CModulePackage} (H : ModuleHomomorphismPackage M N) where
  additiveClosed : H.additive
  homogeneousClosed : H.homogeneous

def ModuleHomomorphismClosed {M N : CModulePackage} (H : ModuleHomomorphismPackage M N) : Prop :=
  H.additive ∧ H.homogeneous

theorem module_homomorphism_closed_from_evidence {M N : CModulePackage} (H : ModuleHomomorphismPackage M N) (E : ModuleHomomorphismEvidence H) : ModuleHomomorphismClosed H := by
  exact And.intro E.additiveClosed E.homogeneousClosed

end CModulesCanonicalLaneLean
end HautevilleHouse