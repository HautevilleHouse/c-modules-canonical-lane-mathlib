import HautevilleHouse.CModulesCanonicalLaneLean.AdmissibleClass

/-!
# Module Package for C Modules
-/

namespace HautevilleHouse
namespace CModulesCanonicalLaneLean

structure ModulePackage (R : Type u) where
  carrier : Type v
  add : carrier → carrier → carrier
  zero : carrier
  neg : carrier → carrier
  smul : R → carrier → carrier
  addAssoc : ∀ a b c : carrier, add (add a b) c = add a (add b c)
  addComm : ∀ a b : carrier, add a b = add b a
  zeroAdd : ∀ a : carrier, add zero a = a
  addZero : ∀ a : carrier, add a zero = a
  addNeg : ∀ a : carrier, add a (neg a) = zero
  smulOne : ∀ a : carrier, smul (1 : R) a = a
  smulAssoc : ∀ (r s : R) (a : carrier), smul (r * s) a = smul r (smul s a)
  smulDistrib : ∀ (r s : R) (a : carrier), smul (r + s) a = add (smul r a) (smul s a)
  smulDistribCarrier : ∀ (r : R) (a b : carrier), smul r (add a b) = add (smul r a) (smul r b)

structure ModuleEvidence (R : Type u) (M : ModulePackage R) where
  addAssocClosed : M.addAssoc
  addCommClosed : M.addComm
  zeroAddClosed : M.zeroAdd
  addZeroClosed : M.addZero
  addNegClosed : M.addNeg
  smulOneClosed : M.smulOne
  smulAssocClosed : M.smulAssoc
  smulDistribClosed : M.smulDistrib
  smulDistribCarrierClosed : M.smulDistribCarrier

def ModuleClosed (R : Type u) (M : ModulePackage R) : Prop :=
  M.addAssoc ∧ M.addComm ∧ M.zeroAdd ∧ M.addZero ∧ M.addNeg ∧
  M.smulOne ∧ M.smulAssoc ∧ M.smulDistrib ∧ M.smulDistribCarrier

theorem module_closed_from_evidence (R : Type u) (M : ModulePackage R) (E : ModuleEvidence R M) :
    ModuleClosed R M := by
  exact And.intro E.addAssocClosed (And.intro E.addCommClosed 
    (And.intro E.zeroAddClosed (And.intro E.addZeroClosed 
      (And.intro E.addNegClosed (And.intro E.smulOneClosed 
        (And.intro E.smulAssocClosed (And.intro E.smulDistribClosed E.smulDistribCarrierClosed)))))))

end CModulesCanonicalLaneLean
end HautevilleHouse