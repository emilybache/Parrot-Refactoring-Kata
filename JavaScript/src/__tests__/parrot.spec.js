import { Parrot, PARROT_TYPES } from '../parrot';

describe("Parrot", function () {
    test("get speed of european parrot", function () {
        const parrot = new Parrot(PARROT_TYPES.EUROPEAN, 0, 0, false);

        expect(parrot.getSpeed()).toBe(12);
    });

    test("get speed of african parrot with one coconut", function () {
        const parrot = new Parrot(PARROT_TYPES.AFRICAN, 1, 0, false);

        expect(parrot.getSpeed()).toBe(3);
    });

    test("get speed of african parrot with two coconuts", function () {
        const parrot = new Parrot(PARROT_TYPES.AFRICAN, 2, 0, false);

        expect(parrot.getSpeed()).toBe(0);
    });

    test("get speed of african parrot with no coconuts", function () {
        const parrot = new Parrot(PARROT_TYPES.AFRICAN, 0, 0, false);

        expect(parrot.getSpeed()).toBe(12);
    });

    test("get speed norwegian blue parrot nailed", function () {
        const parrot = new Parrot(PARROT_TYPES.NORWEGIAN_BLUE, 0, 1.5, true);

        expect(parrot.getSpeed()).toBe(0);
    });

    test("get speed norwegian blue parrot not nailed", function () {
        const parrot = new Parrot(PARROT_TYPES.NORWEGIAN_BLUE, 0, 1.5, false);

        expect(parrot.getSpeed()).toBe(18);
    });

    test("get speed norwegian blue parrot not nailed high voltage", function () {
        const parrot = new Parrot(PARROT_TYPES.NORWEGIAN_BLUE, 0, 4, false);

        expect(parrot.getSpeed()).toBe(24);
    });
});
