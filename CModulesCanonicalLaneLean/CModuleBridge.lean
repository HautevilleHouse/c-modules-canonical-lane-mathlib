import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CModulesCanonicalLaneLean.CModuleBasics

namespace HautevilleHouse
namespace CModulesCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  CModuleWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) :
    gateClosed A := by
  exact A.gateWitness

end CModulesCanonicalLaneLean
end HautevilleHouse