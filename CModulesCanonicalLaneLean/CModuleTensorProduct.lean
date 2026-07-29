import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CModulesCanonicalLaneLean.CModuleDefinition

namespace HautevilleHouse
namespace CModulesCanonicalLaneLean

structure CModuleTensorProduct (R : Type u) [CommRing R] (M N : CModule R) where
  tensorCarrier : Type v
  tensorProduct : M.carrier → N.carrier → tensorCarrier
  bilinear : ∀ (r : R) (m m' : M.carrier) (n n' : N.carrier),
    tensorProduct (m + m') n = tensorProduct m n + tensorProduct m' n ∧
    tensorProduct m (n + n') = tensorProduct m n + tensorProduct m n' ∧
    tensorProduct (r • m) n = r • tensorProduct m n ∧
    tensorProduct m (r • n) = r • tensorProduct m n

structure TensorProductPackage (R : Type u) [CommRing R] (M N : CModule R) where
  tensorProduct : CModuleTensorProduct R M N
  universalProperty : Prop
  exactnessPreserved : Prop

structure TensorProductEvidence {R : Type u} [CommRing R] {M N : CModule R} (T : TensorProductPackage R M N) where
  universalPropertyClosed : T.universalProperty
  exactnessPreservedClosed : T.exactnessPreserved

def TensorProductClosed {R : Type u} [CommRing R] {M N : CModule R} (T : TensorProductPackage R M N) : Prop :=
  T.universalProperty ∧ T.exactnessPreserved

theorem tensor_product_closed_from_evidence {R : Type u} [CommRing R] {M N : CModule R}
    (T : TensorProductPackage R M N) (E : TensorProductEvidence T) : TensorProductClosed T := by
  exact And.intro E.universalPropertyClosed E.exactnessPreservedClosed

end CModulesCanonicalLaneLean
end HautevilleHouse