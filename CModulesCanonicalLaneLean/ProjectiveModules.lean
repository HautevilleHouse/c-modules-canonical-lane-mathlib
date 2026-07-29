import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CModulesCanonicalLaneLean

structure ProjectiveModulePackage where
  module : Type u
  directSummand : Prop
  liftingProperty : Prop
  freeModule : Type v
  embedding : module → freeModule
  retraction : freeModule → module

structure ProjectiveModuleEvidence (P : ProjectiveModulePackage) where
  directSummandClosed : P.directSummand
  liftingPropertyClosed : P.liftingProperty
  retractionInverse : (P.retraction ∘ P.embedding) = id

def ProjectiveModuleClosed (P : ProjectiveModulePackage) : Prop :=
  P.directSummand ∧ P.liftingProperty ∧ (P.retraction ∘ P.embedding) = id

theorem projective_module_closed_from_evidence (P : ProjectiveModulePackage) (E : ProjectiveModuleEvidence P) : ProjectiveModuleClosed P := by
  exact And.intro E.directSummandClosed (And.intro E.liftingPropertyClosed E.retractionInverse)

end CModulesCanonicalLaneLean
end HautevilleHouse