import CModulesCanonicalLaneLean.CModuleObjects

/-!
# Auslander-Reiten Theory Package
-/

namespace HautevilleHouse
namespace CModulesCanonicalLaneLean

structure ARPackage where
  irrMorphismsClassified : Prop
  almostSplitSequencesExist : Prop
  transpositionDefined : Prop
  componentsComputed : Prop

structure AREvidence (AR : ARPackage) where
  irrMorphismsClassifiedClosed : AR.irrMorphismsClassified
  almostSplitSequencesExistClosed : AR.almostSplitSequencesExist
  transpositionDefinedClosed : AR.transpositionDefined
  componentsComputedClosed : AR.componentsComputed

def ARClosed (AR : ARPackage) : Prop :=
  AR.irrMorphismsClassified ∧ AR.almostSplitSequencesExist ∧
  AR.transpositionDefined ∧ AR.componentsComputed

theorem ar_closed_from_evidence (AR : ARPackage) (E : AREvidence AR) : ARClosed AR := by
  exact And.intro E.irrMorphismsClassifiedClosed
    (And.intro E.almostSplitSequencesExistClosed
      (And.intro E.transpositionDefinedClosed E.componentsComputedClosed))

end CModulesCanonicalLaneLean
end HautevilleHouse