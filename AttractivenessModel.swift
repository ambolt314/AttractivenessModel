import Foundation

class Person {
    var name: String
    var job: String?
    var personalityTraits = [String]()
    var attractiveness: Attractiveness
    
    init(name: String, job: String?, attractiveness: Attractiveness) {
        self.name = name
        self.job = job
        self.attractiveness = attractiveness
    }
}

///This notion eschews the conventional 'out-of-ten' system, given that people perceive beauty differently.
///Moreover, the OOT system only takes into account physical beauty, with a shared assumption of a standard convention.
///Meanwhile, this model is based on simple yes/no questions.
///They are either true or false, and are wholly subjective to the person being asked to rate.
///It also breaks down the various facets of what is considered attractive, thus allowing attractiveness to be represented as a net score.
///The model also deliberately obfuscates which of the three questions have been answered affirmatively for the purposes of modesty
class Attractiveness: CustomStringConvertible {
    
    var description: String {
        return "Provides a subjective rating of attractiveness"
    }
    
    ///is the person beautiful? That is, does their physical appearance appeal to those being asked
    var beautiful: Bool
    
    ///does the person's intelligence appeal to those asked, in a way where the asker does not materially gain?
    var intelligent: Bool
    
    ///does the person's level of empathy, ethics and attitudes towards others appeal to those asked?
    var nice: Bool
    
    init(beautiful: Bool, intelligent: Bool, nice: Bool) {
        self.beautiful = beautiful
        self.intelligent = intelligent
        self.nice = nice
    }
    
    ///Rating from zero to three
    ///0 or 1 - not attractive
    ///2 or 3 - attractive
    func getNetScore() -> Int {
        return (beautiful ? 1 : 0) + (intelligent ? 1 : 0) + (nice ? 1 : 0)
    }
    
    func isAttractive() -> Bool {
        switch self.getNetScore() {
        case 0, 1: return false
        case 2, 3: return true
        default: return false
        }
    }
    
}
