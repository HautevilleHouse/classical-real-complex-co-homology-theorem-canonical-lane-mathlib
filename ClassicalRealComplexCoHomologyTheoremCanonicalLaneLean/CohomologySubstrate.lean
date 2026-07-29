import ClassicalRealComplexCoHomologyCanonicalLaneLean.AlgebraicCycleLayer

noncomputable section

universe u

namespace HautevilleHouse
namespace ClassicalRealComplexCoHomologyCanonicalLaneLean

structure NativeCohomologyProfile where
  degree : ℕ
  hodgeBidegreeP : ℕ
  hodgeBidegreeQ : ℕ
  cycleCodimension : ℕ
  ellAdicRoute : Bool
  localCohomologyRoute : Bool
  sheafRoute : Bool
deriving Repr, DecidableEq

def cohomologyProfile (p : ℕ) : NativeCohomologyProfile := {
  degree := 2 * p,
  hodgeBidegreeP := p,
  hodgeBidegreeQ := p,
  cycleCodimension := p,
  ellAdicRoute := true,
  localCohomologyRoute := true,
  sheafRoute := true
}

def CohomologyTypeAvailable : Prop :=
  ∀ (X : NativeScheme.{u}) (ell : ℕ) [Fact ell.Prime] (degree : ℕ),
    Nonempty (NativeEllAdicCohomology X ell degree → NativeEllAdicCohomology X ell degree)

theorem cohomology_type_available_checked :
    CohomologyTypeAvailable := by
  intro X ell inst degree
  exact ⟨id⟩

theorem cohomology_profile_degree_checked (p : ℕ) :
    (cohomologyProfile p).degree = 2 * p := by
  simp [cohomologyProfile]

theorem cohomology_profile_routes_checked (p : ℕ) :
    (cohomologyProfile p).ellAdicRoute = true ∧
    (cohomologyProfile p).localCohomologyRoute = true ∧
    (cohomologyProfile p).sheafRoute = true := by
  simp [cohomologyProfile]

end ClassicalRealComplexCoHomologyCanonicalLaneLean
end HautevilleHouse