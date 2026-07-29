import canonicalLaneMathlib.AdmissibleClass
import CModulesCanonicalLaneLean.ModuleCategory

namespace HautevilleHouse
namespace CModulesCanonicalLaneLean

structure ProjectiveModule (A : Type u) [Ring A] (cat : ModuleCategory A) where
  object : cat.objects
  liftingProperty : ∀ (f : cat.morphisms object (someTarget : cat.objects)) (epi : cat.morphisms (someSource : cat.objects) object),
    ∃ (lift : cat.morphisms object (someSource : cat.objects)), f = cat.compose lift epi
  someSource : cat.objects
  someTarget : cat.objects

structure AdmittedProjectives (A : Type u) [Ring A] (cat : ModuleCategory A) where
  projectiveObjects : List (ProjectiveModule A cat)
  enoughResolutions : Prop
  conclusion : enoughResolutions

end CModulesCanonicalLaneLean
end HautevilleHouse