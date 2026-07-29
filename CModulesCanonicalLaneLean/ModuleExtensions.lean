import canonicalLaneMathlib.AdmissibleClass
import CModulesCanonicalLaneLean.ModuleCategory

namespace HautevilleHouse
namespace CModulesCanonicalLaneLean

structure ModuleExtension (A : Type u) [Ring A] (cat : ModuleCategory A) where
  source : cat.objects
  target : cat.objects
  extensionClass : Type (max u v)
  zeroElement : extensionClass
  addition : extensionClass → extensionClass → extensionClass
  baerSum : extensionClass → extensionClass → extensionClass
  add_comm : ∀ (x y : extensionClass), addition x y = addition y x
  add_assoc : ∀ (x y z : extensionClass), addition (addition x y) z = addition x (addition y z)
  zero_add : ∀ (x : extensionClass), addition zeroElement x = x
  add_zero : ∀ (x : extensionClass), addition x zeroElement = x
  baerAddCompat : ∀ (x y : extensionClass), baerSum x y = addition x y

structure AdmittedExtensions (A : Type u) [Ring A] (cat : ModuleCategory A) where
  extGroup : ModuleExtension A cat
  yonedaProduct : Prop
  conclusion : yonedaProduct

end CModulesCanonicalLaneLean
end HautevilleHouse