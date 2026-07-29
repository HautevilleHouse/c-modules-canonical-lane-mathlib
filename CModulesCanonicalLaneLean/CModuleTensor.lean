import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CModulesCanonicalLaneLean

structure CModuleTensorProduct (A : Type u) [Ring A] (alg : CModuleAlgebra A)
    (mod1 mod2 : CModuleAxiomPackage A alg) where
  tensorObject : Type v
  balancedMap : (mod1.moduleStructure × mod2.moduleStructure) → tensorObject
  universalProperty : Prop
  universalPropertyClosed : universalProperty

structure CModuleTensorProductEvidence {A : Type u} [Ring A] {alg : CModuleAlgebra A}
    {mod1 mod2 : CModuleAxiomPackage A alg}
    (tpkg : CModuleTensorProduct A alg mod1 mod2) where
  universalPropertyClosed : tpkg.universalProperty

def CModuleTensorProductClosed {A : Type u} [Ring A] {alg : CModuleAlgebra A}
    {mod1 mod2 : CModuleAxiomPackage A alg}
    (tpkg : CModuleTensorProduct A alg mod1 mod2) : Prop :=
  tpkg.universalProperty

theorem cmodule_tensor_product_closed_from_evidence {A : Type u} [Ring A] {alg : CModuleAlgebra A}
    {mod1 mod2 : CModuleAxiomPackage A alg}
    (tpkg : CModuleTensorProduct A alg mod1 mod2)
    (E : CModuleTensorProductEvidence tpkg) : CModuleTensorProductClosed tpkg := by
  exact E.universalPropertyClosed

end CModulesCanonicalLaneLean
end HautevilleHouse