import CModulesCanonicalLaneLean.CModuleAdmissibleClass

namespace HautevilleHouse
namespace CModulesCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  CModuleWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end CModulesCanonicalLaneLean
end HautevilleHouse