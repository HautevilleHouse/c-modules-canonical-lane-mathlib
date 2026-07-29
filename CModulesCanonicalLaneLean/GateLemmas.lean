import canonicalLaneMathlib.AdmissibleClass
import CModulesCanonicalLaneLean.BridgeLemmas

namespace HautevilleHouse
namespace CModulesCanonicalLaneLean

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) :
    gateClosed A := by
  exact A.gateWitness

end CModulesCanonicalLaneLean
end HautevilleHouse