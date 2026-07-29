import HautevilleHouse.CModulesCanonicalLaneLean.HomomorphismPackage

/-!
# Short Exact Sequence Package for C Modules
-/

namespace HautevilleHouse
namespace CModulesCanonicalLaneLean

structure ShortExactSequencePackage (R : Type u) (A B C : ModulePackage R)
    (f : HomomorphismPackage R A B) (g : HomomorphismPackage R B C) where
  im_f_eq_ker_g : ∀ x : B.carrier, (∃ y : A.carrier, f.map y = x) ↔ (g.map x = C.zero)
  f_injective : ∀ x y : A.carrier, f.map x = f.map y → x = y
  g_surjective : ∀ z : C.carrier, ∃ x : B.carrier, g.map x = z

structure ShortExactSequenceEvidence (R : Type u) {A B C : ModulePackage R}
    {f : HomomorphismPackage R A B} {g : HomomorphismPackage R B C}
    (S : ShortExactSequencePackage R A B C f g) where
  im_f_eq_ker_g_closed : S.im_f_eq_ker_g
  f_injective_closed : S.f_injective
  g_surjective_closed : S.g_surjective

def ShortExactSequenceClosed (R : Type u) {A B C : ModulePackage R}
    {f : HomomorphismPackage R A B} {g : HomomorphismPackage R B C}
    (S : ShortExactSequencePackage R A B C f g) : Prop :=
  S.im_f_eq_ker_g ∧ S.f_injective ∧ S.g_surjective

theorem short_exact_sequence_closed_from_evidence (R : Type u) {A B C : ModulePackage R}
    {f : HomomorphismPackage R A B} {g : HomomorphismPackage R B C}
    (S : ShortExactSequencePackage R A B C f g) (E : ShortExactSequenceEvidence R S) :
    ShortExactSequenceClosed R S := by
  exact And.intro E.im_f_eq_ker_g_closed (And.intro E.f_injective_closed E.g_surjective_closed)

end CModulesCanonicalLaneLean
end HautevilleHouse