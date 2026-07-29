import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CModulesCanonicalLaneLean.CModuleDefinition

namespace HautevilleHouse
namespace CModulesCanonicalLaneLean

structure CModuleHomomorphism (M N : CModule ℤ) [AddCommGroup M.carrier] [AddCommGroup N.carrier]
    [Module ℤ M.carrier] [Module ℤ N.carrier] where
  map : M.carrier → N.carrier
  additive : ∀ x y, map (x + y) = map x + map y
  linear : ∀ (r : ℤ) x, map (r • x) = r • map x

structure CModuleHomomorphismPackage (M N : CModule ℤ) where
  hom : CModuleHomomorphism M N
  kernelDefined : Prop
  imageDefined : Prop

structure CModuleHomomorphismEvidence {M N : CModule ℤ} (H : CModuleHomomorphismPackage M N) where
  kernelDefinedClosed : H.kernelDefined
  imageDefinedClosed : H.imageDefined

def CModuleHomomorphismClosed {M N : CModule ℤ} (H : CModuleHomomorphismPackage M N) : Prop :=
  H.kernelDefined ∧ H.imageDefined

theorem cmodule_homomorphism_closed_from_evidence {M N : CModule ℤ}
    (H : CModuleHomomorphismPackage M N) (E : CModuleHomomorphismEvidence H) :
    CModuleHomomorphismClosed H := by
  exact And.intro E.kernelDefinedClosed E.imageDefinedClosed

end CModulesCanonicalLaneLean
end HautevilleHouse