import CModulesCanonicalLaneLean.CModuleAdmissibleClass

namespace HautevilleHouse
namespace CModulesCanonicalLaneLean

structure CModuleStructure where
  ring : Type u
  abGroup : Type v
  moduleActions : ring → abGroup → abGroup
  homomorphismType : Type w
  compositionSeries : Prop
  jordanHolderProperty : Prop

structure CModuleStructureEvidence (M : CModuleStructure) where
  compositionSeriesClosed : M.compositionSeries
  jordanHolderPropertyClosed : M.jordanHolderProperty

def CModuleStructureClosed (M : CModuleStructure) : Prop :=
  M.compositionSeries ∧ M.jordanHolderProperty

theorem cmodule_structure_closed_from_evidence (M : CModuleStructure)
    (E : CModuleStructureEvidence M) : CModuleStructureClosed M := by
  exact And.intro E.compositionSeriesClosed E.jordanHolderPropertyClosed

end CModulesCanonicalLaneLean
end HautevilleHouse