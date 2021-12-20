import {Parrot, ParrotTypes} from '../src/parrot'

describe('Parrot', () => {

    it('gets speed of European Parrot', () => {
        const parrot = new Parrot(ParrotTypes.EUROPEAN, 0, 0, false);
        expect(parrot.getSpeed()).toBe(12);
    });

    it('gets speed of African Parrot with one coconut', () => {
        const parrot = new Parrot(ParrotTypes.AFRICAN, 1, 0, false);
        expect(parrot.getSpeed()).toBe(3);
    });

    it('gets speed of African Parrot with two coconuts', () => {
        const parrot = new Parrot(ParrotTypes.AFRICAN, 2, 0, false);
        expect(parrot.getSpeed()).toBe(0);
    });

    it('gets speed of African Parrot with no coconuts', () => {
        const parrot = new Parrot(ParrotTypes.AFRICAN, 0, 0, false);
        expect(parrot.getSpeed()).toBe(12);
    });

    it('gets speed of Norwegian Blue Parrot nailed', () => {
        const parrot = new Parrot(ParrotTypes.NORWEGIAN_BLUE, 0, 1.5, true);
        expect(parrot.getSpeed()).toBe(0);
    });

    it('gets speed of Norwegian Blue Parrot not nailed', () => {
        const parrot = new Parrot(ParrotTypes.NORWEGIAN_BLUE, 0, 1.5, false);
        expect(parrot.getSpeed()).toBe(18);
    });

    it('gets speed of Norwegian Blue Parrot not nailed high voltage', () => {
        const parrot = new Parrot(ParrotTypes.NORWEGIAN_BLUE, 0, 4, false);
        expect(parrot.getSpeed()).toBe(24);
    });

});
