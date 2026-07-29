import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CModulesCanonicalLaneLean

structure CModuleAlgebra (A : Type u) [Ring A] where
  associative : Prop
  unital : Prop
  algebraMap : A → End ℂ
  algebraMapHom : Prop
  algebraMapHomClosed : algebraMapHom
  associativeClosed : associative
  unitalClosed : unital

structure CModuleAxiomPackage (A : Type u) [Ring A] (alg : CModuleAlgebra A) where
  moduleStructure : Type v
  scalarMultiplication : A → moduleStructure → moduleStructure
  distributivity : Prop
  associativity : Prop
  identityAction : Prop
  distributivityClosed : distributivity
  associativityClosed : associativity
  identityActionClosed : identityAction

structure CModuleAxiomEvidence {A : Type u} [Ring A] {alg : CModuleAlgebra A}
    (pkg : CModuleAxiomPackage A alg) where
  distributivityClosed : pkg.distributivity
  associativityClosed : pkg.associativity
  identityActionClosed : pkg.identityAction

def CModuleAxiomClosed {A : Type u} [Ring A] {alg : CModuleAlgebra A}
    (pkg : CModuleAxiomPackage A alg) : Prop :=
  pkg.distributivity ∧ pkg.associativity ∧ pkg.identityAction

theorem cmodule_axiom_closed_from_evidence {A : Type u} [Ring A] {alg : CModuleAlgebra A}
    (pkg : CModuleAxiomPackage A alg) (E : CModuleAxiomEvidence pkg) : CModuleAxiomClosed pkg := by
  exact And.intro E.distributivityClosed (And.intro E.associativityClosed E.identityActionClosed)

end CModulesCanonicalLaneLean
end HautevilleHouse