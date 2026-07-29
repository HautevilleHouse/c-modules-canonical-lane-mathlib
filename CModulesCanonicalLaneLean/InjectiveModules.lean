import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CModulesCanonicalLaneLean

structure InjectiveModulePackage where
  module : Type u
  extensionProperty : Prop
  dual : Type v
  dualityPairing : module → dual → Type w
  nondegenerate : Prop

structure InjectiveModuleEvidence (I : InjectiveModulePackage) where
  extensionPropertyClosed : I.extensionProperty
  nondegenerateClosed : I.nondegenerate

def InjectiveModuleClosed (I : InjectiveModulePackage) : Prop :=
  I.extensionProperty ∧ I.nondegenerate

theorem injective_module_closed_from_evidence (I : InjectiveModulePackage) (E : InjectiveModuleEvidence I) : InjectiveModuleClosed I := by
  exact And.intro E.extensionPropertyClosed E.nondegenerateClosed

end CModulesCanonicalLaneLean
end HautevilleHouse