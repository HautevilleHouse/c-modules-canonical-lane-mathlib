import CModulesCanonicalLaneLean.CModules

namespace HautevilleHouse
namespace CModulesCanonicalLaneLean

structure FreeResolution (R : Type u) [CommRing R] (M : CModule R) where
  chainComplex : ℕ → Type v
  differential : ∀ n : ℕ, chainComplex (n+1) → chainComplex n
  exactness : ∀ n : ℕ, Function.Exact (differential (n+1)) (differential n)
  freeModules : ∀ n : ℕ, IsFree (chainComplex n)

theorem free_resolution_exactness (R : Type u) [CommRing R] (M : CModule R) (F : FreeResolution R M) :
  ∀ n : ℕ, Function.Exact (F.differential (n+1)) (F.differential n) :=
  F.exactness

end CModulesCanonicalLaneLean
end HautevilleHouse