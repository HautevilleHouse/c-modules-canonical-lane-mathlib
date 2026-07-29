import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CModulesCanonicalLaneLean

structure ExactSequencePackage where
  modules : List Type
  maps : List (Type → Type)
  kernelImageEquality : Prop
  exactAtEach : Prop

structure ExactSequenceEvidence (E : ExactSequencePackage) where
  kernelImageEqualityClosed : E.kernelImageEquality
  exactAtEachClosed : E.exactAtEach

def ExactSequenceClosed (E : ExactSequencePackage) : Prop :=
  E.kernelImageEquality ∧ E.exactAtEach

theorem exact_sequence_closed_from_evidence (E : ExactSequencePackage) (Ev : ExactSequenceEvidence E) : ExactSequenceClosed E := by
  exact And.intro Ev.kernelImageEqualityClosed Ev.exactAtEachClosed

end CModulesCanonicalLaneLean
end HautevilleHouse