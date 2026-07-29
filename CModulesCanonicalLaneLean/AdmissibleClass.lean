import CModulesCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace CModulesCanonicalLaneLean

structure AdmissibleClass where
  object : CModuleAdmittedObject
  moduleFiniteGenerated : Prop
  relationSatisfied : Prop
  gateWitness : moduleFiniteGenerated ∨ relationSatisfied

def admittedClosure (A : AdmissibleClass) : Prop :=
  CModuleWitnessClosed A.object ∧ (A.moduleFiniteGenerated ∨ A.relationSatisfied)

end CModulesCanonicalLaneLean
end HautevilleHouse