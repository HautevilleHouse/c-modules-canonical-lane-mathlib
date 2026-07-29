import canonicalLaneMathlib.AdmissibleClass
import CModulesCanonicalLaneLean.ModuleCategory

/-!
# Homological Algebra of C-Modules Package

This package encapsulates homological constructions over C-modules,
including chain complexes and derived functors, as admissible-class bridges.
-/

namespace HautevilleHouse
namespace CModulesCanonicalLaneLean

structure ChainComplexOverCModules {C : CModuleCategory} (E : CModuleCategoryEvidence C) where
  chainGroups : ℕ → C.moduleCarrier
  differentials : (n : ℕ) → (chainGroups (n+1)) → (chainGroups n)
  differentialSquared : (n : ℕ) → (differentials n) ∘ (differentials (n+1)) = 0
  chainComplexDefined : Prop

theorem chain_complex_squares_zero
    {C : CModuleCategory} {E : CModuleCategoryEvidence C}
    (Ch : ChainComplexOverCModules E) (n : ℕ) :
    (Ch.differentials n) ∘ (Ch.differentials (n+1)) = 0 :=
  Ch.differentialSquared n

structure DerivedFunctor {C : CModuleCategory} (E : CModuleCategoryEvidence C)
    (Ch : ChainComplexOverCModules E) where
  source : C.moduleCarrier
  target : C.moduleCarrier
  derivedDefined : Prop
  derivedClosed : derivedDefined

end CModulesCanonicalLaneLean
end HautevilleHouse