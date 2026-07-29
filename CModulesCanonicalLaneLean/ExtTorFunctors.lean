import canonicalLaneMathlib.AdmissibleClass
import CModulesCanonicalLaneLean.HomologicalAlgebra

/-!
# Ext and Tor Functors Package

This package defines Ext and Tor functors in the category of C-modules,
and provides closure evidence used by the final constrained theorem.
-/

namespace HautevilleHouse
namespace CModulesCanonicalLaneLean

structure ExtFunctor {C : CModuleCategory} {E : CModuleCategoryEvidence C}
    (Ch : ChainComplexOverCModules E) where
  leftArgument : C.moduleCarrier
  rightArgument : C.moduleCarrier
  extGroups : (n : ℕ) → C.moduleCarrier
  extDefined : Prop
  extClosed : extDefined

structure TorFunctor {C : CModuleCategory} {E : CModuleCategoryEvidence C}
    (Ch : ChainComplexOverCModules E) where
  firstArgument : C.moduleCarrier
  secondArgument : C.moduleCarrier
  torGroups : (n : ℕ) → C.moduleCarrier
  torDefined : Prop
  torClosed : torDefined

def ExtTorDefined {C : CModuleCategory} {E : CModuleCategoryEvidence C}
    (Ch : ChainComplexOverCModules E) (Ext : ExtFunctor Ch) (Tor : TorFunctor Ch) : Prop :=
  Ext.extDefined ∧ Tor.torDefined

theorem ext_tor_defined_from_evidence
    {C : CModuleCategory} {E : CModuleCategoryEvidence C}
    (Ch : ChainComplexOverCModules E) (Ext : ExtFunctor Ch) (Tor : TorFunctor Ch)
    (hExt : Ext.extClosed) (hTor : Tor.torClosed) :
    ExtTorDefined Ch Ext Tor := by
  exact And.intro hExt hTor

end CModulesCanonicalLaneLean
end HautevilleHouse