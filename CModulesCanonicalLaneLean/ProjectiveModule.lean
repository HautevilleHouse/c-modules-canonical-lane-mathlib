import CModulesCanonicalLaneLean.CModules

namespace HautevilleHouse
namespace CModulesCanonicalLaneLean

structure ProjectiveModule (R : Type u) [CommRing R] (M : CModule R) where
  liftingProperty : ∀ (N : CModule R) (f : M → N) (g : FreeModule R → N),
    if Function.Surjective g then (∃ h : M → FreeModule R, f = g ∘ h)
  isProjective : liftingProperty

theorem projective_iff_free (R : Type u) [CommRing R] (M : CModule R) :
  ProjectiveModule R M ↔ FreeModule R := by
  constructor
  · intro h
    have : IsFree M :=
    sorry
    exact this
  · intro h
    have : ProjectiveModule R M :=
    sorry
    exact this

end CModulesCanonicalLaneLean
end HautevilleHouse