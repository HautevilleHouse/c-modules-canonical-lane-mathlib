import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CModulesCanonicalLaneLean

structure TensorProductPackage where
  moduleA : Type u
  moduleB : Type v
  tensorProduct : Type w
  bilinearMap : moduleA → moduleB → tensorProduct
  universalProperty : Prop

structure TensorProductEvidence (T : TensorProductPackage) where
  universalPropertyClosed : T.universalProperty

def TensorProductClosed (T : TensorProductPackage) : Prop :=
  T.universalProperty

theorem tensor_product_closed_from_evidence (T : TensorProductPackage) (E : TensorProductEvidence T) : TensorProductClosed T := by
  exact E.universalPropertyClosed

end CModulesCanonicalLaneLean
end HautevilleHouse