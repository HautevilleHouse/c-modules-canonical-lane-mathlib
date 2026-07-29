import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CModulesCanonicalLaneLean

structure CModuleDerivedEquivalence (A B : Type u) [Ring A] [Ring B]
    (algA : CModuleAlgebra A) (algB : CModuleAlgebra B)
    (modA : CModuleAxiomPackage A algA) (modB : CModuleAxiomPackage B algB) where
  derivedFunctor : Type u
  quasiInverse : Type u
  unit : Prop
  counit : Prop
  triangleIdentities : Prop
  unitClosed : unit
  counitClosed : counit
  triangleIdentitiesClosed : triangleIdentities

structure CModuleEquivalenceEvidence {A B : Type u} [Ring A] [Ring B]
    {algA : CModuleAlgebra A} {algB : CModuleAlgebra B}
    {modA : CModuleAxiomPackage A algA} {modB : CModuleAxiomPackage B algB}
    (epkg : CModuleDerivedEquivalence A B algA algB modA modB) where
  unitClosed : epkg.unit
  counitClosed : epkg.counit
  triangleIdentitiesClosed : epkg.triangleIdentities

def CModuleEquivalenceClosed {A B : Type u} [Ring A] [Ring B]
    {algA : CModuleAlgebra A} {algB : CModuleAlgebra B}
    {modA : CModuleAxiomPackage A algA} {modB : CModuleAxiomPackage B algB}
    (epkg : CModuleDerivedEquivalence A B algA algB modA modB) : Prop :=
  epkg.unit ∧ epkg.counit ∧ epkg.triangleIdentities

theorem cmodule_equivalence_closed_from_evidence {A B : Type u} [Ring A] [Ring B]
    {algA : CModuleAlgebra A} {algB : CModuleAlgebra B}
    {modA : CModuleAxiomPackage A algA} {modB : CModuleAxiomPackage B algB}
    (epkg : CModuleDerivedEquivalence A B algA algB modA modB)
    (E : CModuleEquivalenceEvidence epkg) : CModuleEquivalenceClosed epkg := by
  exact And.intro E.unitClosed (And.intro E.counitClosed E.triangleIdentitiesClosed)

end CModulesCanonicalLaneLean
end HautevilleHouse