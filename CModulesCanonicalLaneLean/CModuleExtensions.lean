import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CModulesCanonicalLaneLean

structure CModuleExtension (A : Type u) [Ring A] (alg : CModuleAlgebra A)
    (mod : CModuleAxiomPackage A alg) (M N : Type v) [AddCommGroup M] [AddCommGroup N]
    [Module (End ℂ) M] [Module (End ℂ) N] where
  shortExactSequence : Prop
  middleTerm : Type v
  inclusion : M → middleTerm
  projection : middleTerm → N
  exactness : Prop
  exactnessClosed : exactness

structure CModuleExtGroup (A : Type u) [Ring A] (alg : CModuleAlgebra A)
    (mod : CModuleAxiomPackage A alg) where
  extGroups : ℕ → Type v
  groupStructure : Prop
  yonedaProduct : Prop
  groupStructureClosed : groupStructure
  yonedaProductClosed : yonedaProduct

structure CModuleExtensionEvidence {A : Type u} [Ring A] {alg : CModuleAlgebra A}
    {mod : CModuleAxiomPackage A alg} (epkg : CModuleExtGroup A alg mod) where
  groupStructureClosed : epkg.groupStructure
  yonedaProductClosed : epkg.yonedaProduct

def CModuleExtensionClosed {A : Type u} [Ring A] {alg : CModuleAlgebra A}
    {mod : CModuleAxiomPackage A alg} (epkg : CModuleExtGroup A alg mod) : Prop :=
  epkg.groupStructure ∧ epkg.yonedaProduct

theorem cmodule_extension_closed_from_evidence {A : Type u} [Ring A] {alg : CModuleAlgebra A}
    {mod : CModuleAxiomPackage A alg} (epkg : CModuleExtGroup A alg mod)
    (E : CModuleExtensionEvidence epkg) : CModuleExtensionClosed epkg := by
  exact And.intro E.groupStructureClosed E.yonedaProductClosed

end CModulesCanonicalLaneLean
end HautevilleHouse