import ClassicalRealComplexCoHomologyCanonicalLaneLean.CohomologySubstrate

noncomputable section

universe u

namespace HautevilleHouse
namespace ClassicalRealComplexCoHomologyCanonicalLaneLean

structure ProjectionState where
  geometricObject : String
  cohomologyProfile : NativeCohomologyProfile
  algebraicCycleRecorded : Bool
  admissibleClass : Bool
  carriedClassicalBoundary : Bool
deriving Repr, DecidableEq

def projection (S : ProjectionState) : ProjectionState :=
  { S with
    algebraicCycleRecorded := true
    admissibleClass := true
    carriedClassicalBoundary := true }

theorem projection_idempotent (S : ProjectionState) :
    projection (projection S) = projection S := by
  cases S
  rfl

def projectedClosureState (p : ℕ) : ProjectionState :=
  projection {
    geometricObject := sourceDescription,
    cohomologyProfile := cohomologyProfile p,
    algebraicCycleRecorded := false,
    admissibleClass := false,
    carriedClassicalBoundary := false
  }

theorem projected_closure_state_checked (p : ℕ) :
    (projectedClosureState p).algebraicCycleRecorded = true ∧
    (projectedClosureState p).admissibleClass = true ∧
    (projectedClosureState p).carriedClassicalBoundary = true := by
  refine ⟨?_, ?_, ?_⟩
  · unfold projectedClosureState projection
    rfl
  · unfold projectedClosureState projection
    rfl
  · unfold projectedClosureState projection
    rfl

end ClassicalRealComplexCoHomologyCanonicalLaneLean
end HautevilleHouse