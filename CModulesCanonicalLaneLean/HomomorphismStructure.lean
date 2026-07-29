import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CModulesCanonicalLaneLean

structure HomomorphismPackage where
  sourceModule : Type u
  targetModule : Type v
  map : sourceModule → targetModule
  additive : Prop
  homogeneous : Prop

structure HomomorphismEvidence (H : HomomorphismPackage) where
  additiveClosed : H.additive
  homogeneousClosed : H.homogeneous

def HomomorphismClosed (H : HomomorphismPackage) : Prop :=
  H.additive ∧ H.homogeneous

theorem homomorphism_closed_from_evidence (H : HomomorphismPackage) (E : HomomorphismEvidence H) : HomomorphismClosed H := by
  exact And.intro E.additiveClosed E.homogeneousClosed

end CModulesCanonicalLaneLean
end HautevilleHouse