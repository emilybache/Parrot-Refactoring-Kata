static BASE_SPEED: f32 = 12.0;
static LOAD_FACTOR:f32 = 9.0;

struct ParrotBase{
        number_of_coconuts: usize,
        voltage: f32,
        nailed: bool,
}

trait Parrot {
    fn speed(&self) -> f32;
}

struct EuropeanParrot{
    parrot: ParrotBase,
}

impl Parrot for EuropeanParrot{
    fn speed(&self) -> f32 {
       return BASE_SPEED;
    }
}

struct AfricanParrot{
    parrot: ParrotBase,
}

impl Parrot for AfricanParrot{
    fn speed(&self) -> f32 {
        let african_speed = BASE_SPEED - LOAD_FACTOR * self.parrot.number_of_coconuts as f32;
        if african_speed > 0.0 { return african_speed } else { return 0.0}
    }
}

struct NorwegianBlueParrot{
    parrot: ParrotBase,
}

impl Parrot for NorwegianBlueParrot{
    fn speed(&self) -> f32 {
        if self.parrot.nailed == true {
            return 0.0
        }
        else {
            let fixed_base_speed = 24.0;
            let base_speed_for_voltage = self.parrot.voltage * BASE_SPEED;
            if base_speed_for_voltage < fixed_base_speed {
               return base_speed_for_voltage
            }
            else {
                return fixed_base_speed
            }
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn european_parrot_speed() {
        let test = EuropeanParrot { parrot: ParrotBase{ number_of_coconuts: 0, voltage: 0.0, nailed: false }};
        assert_eq!(test.speed(), 12.0); 
    }

    #[test]
    fn african_parrot_speed(){
        struct Test {
            input: AfricanParrot,
            output: f32,
        }

        let tests = vec![
            Test {
                input: AfricanParrot { parrot: ParrotBase{ number_of_coconuts: 1, voltage: 0.0, nailed: false}},
                output: 3.0
            },
            Test {
                input: AfricanParrot { parrot: ParrotBase{ number_of_coconuts: 2, voltage: 0.0, nailed: false }},
                output: 0.0
            },
            Test {
                input: AfricanParrot { parrot: ParrotBase{ number_of_coconuts: 0, voltage: 0.0, nailed: false}},
                output: 12.0
            },
        ];

        for test in tests {
             let result = test.input;
             assert_eq!(result.speed(), test.output);
        }
    
    }

    #[test]
    fn norwegian_blue_parrot_speed(){
        struct Test {
            input: NorwegianBlueParrot,
            output: f32,
        }

        let tests = vec![
            Test {
                input:  NorwegianBlueParrot { parrot: ParrotBase{ number_of_coconuts: 2, voltage: 0.0, nailed: true }},
                output: 0.0
            },
            Test {
                input: NorwegianBlueParrot { parrot: ParrotBase{ number_of_coconuts: 0, voltage: 1.5, nailed: false }},
                output: 18.0
            },
            Test {
                input: NorwegianBlueParrot { parrot: ParrotBase{ number_of_coconuts: 0, voltage: 4.0, nailed: false }},
                output: 24.0
            },
        ];

        for test in tests {
             let result = test.input;
             assert_eq!(result.speed(), test.output);
        }
    
    }

 
}
