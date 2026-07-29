import CModulesCanonicalLaneLean.CModuleNoetherian

namespace HautevilleHouse
namespace CModulesCanonicalLaneLean

structure CModuleEndomorphismPackage {M : CModuleStructure}
    (N : CModuleNoetherianPackage M) where
  endomorphismRing : Type u
  fittingsLemma : Prop
  primaryDecomposition : Prop
  jordanCanonicalForm : Prop

structure CModuleEndomorphismEvidence {M : CModuleStructure}
    {N : CModuleNoetherianPackage M} (E : CModuleEndomorphismPackage N) where
  fittingsLemmaClosed : E.fittingsLemma
  primaryDecompositionClosed : E.primaryDecomposition
  jordanCanonicalFormClosed : E.jordanCanonicalForm

def CModuleEndomorphismClosed {M : CModuleStructure}
    {N : CModuleNoetherianPackage M} (E : CModuleEndomorphismPackage N) : Prop :=
  E.fittingsLemma ∧ E.primaryDecomposition ∧ E.jordanCanonicalForm

theorem cmodule_endomorphism_closed_from_evidence {M : CModuleStructure}
    {N : CModuleNoetherianPackage M} (E : CModuleEndomorphismPackage N)
    (Ev : CModuleEndomorphismEvidence E) : CModuleEndomorphismClosed E := by
  exact And.intro Ev.fittingsLemmaClosed
    (And.intro Ev.primaryDecompositionClosed Ev.jordanCanonicalFormClosed)

end CModulesCanonicalLaneLean
end HautevilleHouse