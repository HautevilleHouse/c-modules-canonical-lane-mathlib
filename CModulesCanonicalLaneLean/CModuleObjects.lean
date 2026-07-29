import CModulesCanonicalLaneLean.TheoremStatement
import CanonicalLaneMathlibCore
import Mathlib.Algebra.Module.Defs

namespace HautevilleHouse
namespace CModulesCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure CModuleSpace where
  carrier : Type
  ring : Type
  module : Module ring carrier

structure CModuleAdmittedObject where
  space : CModuleSpace
  finiteLength : Prop
  auslanderReitenQuiver : Prop
  conclusion : auslanderReitenQuiver

structure CModuleEndgameState where
  object : CModuleAdmittedObject

def CModuleWitnessClosed (O : CModuleAdmittedObject) : Prop :=
  O.auslanderReitenQuiver

end CModulesCanonicalLaneLean
end HautevilleHouse