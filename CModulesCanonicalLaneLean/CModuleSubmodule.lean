import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CModulesCanonicalLaneLean.CModuleDefinition

namespace HautevilleHouse
namespace CModulesCanonicalLaneLean

structure CModuleSubmodule (R : Type u) [CommRing R] (M : CModule R) where
  subset : Set M.carrier
  zero_mem : (0 : M.carrier) ∈ subset
  add_mem : ∀ {x y}, x ∈ subset → y ∈ subset → x + y ∈ subset
  smul_mem : ∀ (r : R) {x}, x ∈ subset → r • x ∈ subset

structure CModuleQuotient (R : Type u) [CommRing R] (M : CModule R) (N : CModuleSubmodule R M) where
  quotientSet : Setoid M.carrier := 
    { r := λ x y => x - y ∈ N.subset }
  quotientCarrier : Type v := Quotient quotientSet
  quotientModule : Module R quotientCarrier := by infer_instance

structure SubmodulePackage (R : Type u) [CommRing R] (M : CModule R) where
  submodule : CModuleSubmodule R M
  quotient : CModuleQuotient R M submodule
  inclusionClosed : Prop
  projectionClosed : Prop

structure SubmoduleEvidence {R : Type u} [CommRing R] {M : CModule R} (S : SubmodulePackage R M) where
  inclusionClosedClosed : S.inclusionClosed
  projectionClosedClosed : S.projectionClosed

def SubmoduleClosed {R : Type u} [CommRing R] {M : CModule R} (S : SubmodulePackage R M) : Prop :=
  S.inclusionClosed ∧ S.projectionClosed

theorem submodule_closed_from_evidence {R : Type u} [CommRing R] {M : CModule R}
    (S : SubmodulePackage R M) (E : SubmoduleEvidence S) : SubmoduleClosed S := by
  exact And.intro E.inclusionClosedClosed E.projectionClosedClosed

end CModulesCanonicalLaneLean
end HautevilleHouse