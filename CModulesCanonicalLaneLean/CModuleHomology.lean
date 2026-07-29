import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CModulesCanonicalLaneLean

structure CModuleChainComplex (A : Type u) [Ring A] (alg : CModuleAlgebra A)
    (mod : CModuleAxiomPackage A alg) where
  chainGroups : ℕ → Type v
  differentials : ∀ n, chainGroups (n+1) → chainGroups n
  differentialComposition : Prop
  differentialCompositionClosed : differentialComposition

structure CModuleHomologyPackage (A : Type u) [Ring A] (alg : CModuleAlgebra A)
    (mod : CModuleAxiomPackage A alg) (cc : CModuleChainComplex A alg mod) where
  homologyGroups : ℕ → Type w
  wellDefined : Prop
  functoriality : Prop
  wellDefinedClosed : wellDefined
  functorialityClosed : functoriality

structure CModuleHomologyEvidence {A : Type u} [Ring A] {alg : CModuleAlgebra A}
    {mod : CModuleAxiomPackage A alg} {cc : CModuleChainComplex A alg mod}
    (hpkg : CModuleHomologyPackage A alg mod cc) where
  wellDefinedClosed : hpkg.wellDefined
  functorialityClosed : hpkg.functoriality

def CModuleHomologyClosed {A : Type u} [Ring A] {alg : CModuleAlgebra A}
    {mod : CModuleAxiomPackage A alg} {cc : CModuleChainComplex A alg mod}
    (hpkg : CModuleHomologyPackage A alg mod cc) : Prop :=
  hpkg.wellDefined ∧ hpkg.functoriality

theorem cmodule_homology_closed_from_evidence {A : Type u} [Ring A] {alg : CModuleAlgebra A}
    {mod : CModuleAxiomPackage A alg} {cc : CModuleChainComplex A alg mod}
    (hpkg : CModuleHomologyPackage A alg mod cc)
    (E : CModuleHomologyEvidence hpkg) : CModuleHomologyClosed hpkg := by
  exact And.intro E.wellDefinedClosed E.functorialityClosed

def CModuleHomologyBridge {A : Type u} [Ring A] {alg : CModuleAlgebra A}
    {mod : CModuleAxiomPackage A alg} {cc : CModuleChainComplex A alg mod}
    (hpkg : CModuleHomologyPackage A alg mod cc) : Prop :=
  CModuleHomologyClosed hpkg

end CModulesCanonicalLaneLean
end HautevilleHouse