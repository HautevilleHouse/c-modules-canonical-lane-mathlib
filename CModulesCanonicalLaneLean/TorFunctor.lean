import CModulesCanonicalLaneLean.FreeResolution

namespace HautevilleHouse
namespace CModulesCanonicalLaneLean

structure Tor (R : Type u) [CommRing R] (n : ℕ) (A B : CModule R) where
  value : Type v
  isDefined : Prop

theorem tor_concentration (R : Type u) [CommRing R] (A B : CModule R) :
  Tor R 0 A B ≅ A ⊗[R] B := by
  sorry

theorem tor_vanishes_projective (R : Type u) [CommRing R] (A : CModule R) (B : CModule R) (hA : ProjectiveModule R A) (n : ℕ) (hn : n > 0) :
  Tor R n A B = 0 := by
  sorry

end CModulesCanonicalLaneLean
end HautevilleHouse