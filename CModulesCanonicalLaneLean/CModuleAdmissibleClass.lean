import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CModulesCanonicalLaneLean

structure CModule where
  ring : Type u
  abelianGroup : Type v
  smul : ring → abelianGroup → abelianGroup
  moduleAxioms : Prop

structure AdmittedCModule where
  carrier : CModule
  noetherian : Prop
  finiteLength : Prop
  conclusion : finiteLength

structure AdmissibleClass where
  object : AdmittedCModule
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  CModuleWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

def CModuleWitnessClosed (O : AdmittedCModule) : Prop :=
  O.finiteLength

end CModulesCanonicalLaneLean
end HautevilleHouse