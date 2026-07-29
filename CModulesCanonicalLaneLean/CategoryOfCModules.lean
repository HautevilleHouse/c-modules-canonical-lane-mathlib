import canonicalLaneMathlib.AdmissibleClass
import CModulesCanonicalLaneLean.ModuleHomomorphism

namespace HautevilleHouse
namespace CModulesCanonicalLaneLean

structure CategoryOfCModulesPackage where
  objects : Type u
  morphisms : objects → objects → Type v
  identity : (X : objects) → morphisms X X
  composition : {X Y Z : objects} → morphisms X Y → morphisms Y Z → morphisms X Z
  associativity : Prop
  identityLaw : Prop
  underlyingCModule : objects → CModulePackage
  morphismIsHomomorphism : {X Y : objects} → (f : morphisms X Y) → ModuleHomomorphismPackage (underlyingCModule X) (underlyingCModule Y)

def CategoryOfCModulesClosed (C : CategoryOfCModulesPackage) : Prop :=
  C.associativity ∧ C.identityLaw

theorem category_of_cmodules_closed (C : CategoryOfCModulesPackage) (hAssoc : C.associativity) (hId : C.identityLaw) : CategoryOfCModulesClosed C := by
  exact And.intro hAssoc hId

end CModulesCanonicalLaneLean
end HautevilleHouse