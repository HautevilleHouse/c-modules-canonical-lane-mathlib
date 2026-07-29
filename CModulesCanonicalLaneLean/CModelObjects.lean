import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CModulesCanonicalLaneLean

structure CModule (A : Type u) [Ring A] where
  carrier : Type v
  add : carrier → carrier → carrier
  smul : A → carrier → carrier
  add_comm : ∀ x y : carrier, add x y = add y x
  add_assoc : ∀ x y z : carrier, add (add x y) z = add x (add y z)
  zero : carrier
  zero_add : ∀ x : carrier, add zero x = x
  add_zero : ∀ x : carrier, add x zero = x
  add_left_neg : ∀ x : carrier, ∃ y : carrier, add x y = zero
  smul_add : ∀ (r : A) (x y : carrier), smul r (add x y) = add (smul r x) (smul r y)
  add_smul : ∀ (r s : A) (x : carrier), smul (r + s) x = add (smul r x) (smul s x)
  mul_smul : ∀ (r s : A) (x : carrier), smul (r * s) x = smul r (smul s x)
  one_smul : ∀ (x : carrier), smul 1 x = x

structure AdmittedCModule (A : Type u) [Ring A] where
  module : CModule A
  finitelyGenerated : Prop
  finitelyPresented : Prop
  conclusion : finitelyGenerated ∧ finitelyPresented

def CModuleWitnessClosed {A : Type u} [Ring A] (M : AdmittedCModule A) : Prop :=
  M.finitelyGenerated ∧ M.finitelyPresented

end CModulesCanonicalLaneLean
end HautevilleHouse