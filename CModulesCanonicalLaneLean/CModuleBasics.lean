import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CModulesCanonicalLaneLean

structure CModule where
  R : Type u
  M : Type v
  [instRing : Ring R]
  [instAddCommGroup : AddCommGroup M]
  [instModule : Module R M]
  finiteRank : Prop
  scalarMultiplicationDefined : Prop

structure CModuleAdmittedObject where
  module : CModule
  scalarMultiplicationClosed : Prop
  finiteRankClosed : Prop
  conclusion : finiteRankClosed

def CModuleWitnessClosed (O : CModuleAdmittedObject) : Prop :=
  O.finiteRankClosed

end CModulesCanonicalLaneLean
end HautevilleHouse