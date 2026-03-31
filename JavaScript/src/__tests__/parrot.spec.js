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
        const parrot = new Parrot(PARROT_TYPES.NORWEGIAN_BLUE, 0, 0, true);

        expect(parrot.getSpeed()).toBe(0);
    });

    test("get speed norwegian blue parrot nailed with voltage", function () {
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

    test("get cry of european parrot", function () {
        const parrot = new Parrot(PARROT_TYPES.EUROPEAN, 0, 0, false);

        expect(parrot.getCry()).toBe("Sqoork!");
    });

    test("get cry of african parrot", function () {
        const parrot = new Parrot(PARROT_TYPES.AFRICAN, 2, 0, false);

        expect(parrot.getCry()).toBe("Sqaark!");
    });

    test("get cry norwegian blue parrot high voltage", function () {
        const parrot = new Parrot(PARROT_TYPES.NORWEGIAN_BLUE, 0, 4, false);

        expect(parrot.getCry()).toBe("Bzzzzzz");
    });

    test("get cry norwegian blue parrot no voltage", function () {
        const parrot = new Parrot(PARROT_TYPES.NORWEGIAN_BLUE, 0, 0, false);

        expect(parrot.getCry()).toBe("...");
    });
});
