import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CModulesCanonicalLaneLean

structure CModule (R : Type u) [CommRing R] where
  carrier : Type v
  [addCommGroup : AddCommGroup carrier]
  [module : Module R carrier]

structure CModuleDefinition where
  ring : Type u
  [commRing : CommRing ring]
  module : CModule ring
  scalarMultiplicationWellDefined : Prop
  additiveStructure : Prop

structure CModuleDefinitionEvidence (C : CModuleDefinition) where
  scalarMultiplicationWellDefinedClosed : C.scalarMultiplicationWellDefined
  additiveStructureClosed : C.additiveStructure

def CModuleDefinitionClosed (C : CModuleDefinition) : Prop :=
  C.scalarMultiplicationWellDefined ∧ C.additiveStructure

theorem cmodule_definition_closed_from_evidence (C : CModuleDefinition)
    (E : CModuleDefinitionEvidence C) : CModuleDefinitionClosed C := by
  exact And.intro E.scalarMultiplicationWellDefinedClosed E.additiveStructureClosed

end CModulesCanonicalLaneLean
end HautevilleHouse