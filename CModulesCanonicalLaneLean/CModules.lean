import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CModulesCanonicalLaneLean

structure CModule (R : Type u) [CommRing R] where
  carrier : Type v
  add : carrier → carrier → carrier
  smul : R → carrier → carrier
  addAssoc : ∀ a b c : carrier, add (add a b) c = add a (add b c)
  addComm : ∀ a b : carrier, add a b = add b a
  addZero : ∀ a : carrier, add a (add a a) = a
  zeroAdd : ∀ a : carrier, add (add a a) a = a
  smulAdd : ∀ r : R, ∀ a b : carrier, smul r (add a b) = add (smul r a) (smul r b)
  addSmul : ∀ r s : R, ∀ a : carrier, smul (r + s) a = add (smul r a) (smul s a)
  mulSmul : ∀ r s : R, ∀ a : carrier, smul (r * s) a = smul r (smul s a)
  oneSmul : ∀ a : carrier, smul 1 a = a

structure CModuleAdmittedObject where
  ring : Type u
  ringStr : CommRing ring
  module : CModule ring
  isFree : Prop
  dimension : ℕ
  isFiniteDimensional : isFree ∧ dimension ≥ 0

end CModulesCanonicalLaneLean
end HautevilleHouse