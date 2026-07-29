import HautevilleHouse.CModulesCanonicalLaneLean.ModulePackage

/-!
# Homomorphism Package for C Modules
-/

namespace HautevilleHouse
namespace CModulesCanonicalLaneLean

structure HomomorphismPackage (R : Type u) (M N : ModulePackage R) where
  map : M.carrier → N.carrier
  addHom : ∀ x y : M.carrier, map (M.add x y) = N.add (map x) (map y)
  smulHom : ∀ (r : R) (x : M.carrier), map (M.smul r x) = N.smul r (map x)

structure HomomorphismEvidence (R : Type u) {M N : ModulePackage R} (h : HomomorphismPackage R M N) where
  addHomClosed : h.addHom
  smulHomClosed : h.smulHom

def HomomorphismClosed (R : Type u) {M N : ModulePackage R} (h : HomomorphismPackage R M N) : Prop :=
  h.addHom ∧ h.smulHom

theorem homomorphism_closed_from_evidence (R : Type u) {M N : ModulePackage R} (h : HomomorphismPackage R M N)
    (E : HomomorphismEvidence R h) : HomomorphismClosed R h := by
  exact And.intro E.addHomClosed E.smulHomClosed

end CModulesCanonicalLaneLean
end HautevilleHouse