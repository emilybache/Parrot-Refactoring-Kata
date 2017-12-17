/* global require, describe, it */
'use strict';

var expect = require('chai').expect;
var Parrot = require('../src/parrot');

describe("Parrot", function () {
    it("get speed of european parrot", function () {
        var parrot = new Parrot(Parrot.TYPES.EUROPEAN, 0, 0, false);

        expect(parrot.getSpeed()).eql(12);
    });

    it("get speed of african parrot with one coconut", function () {
        var parrot = new Parrot(Parrot.TYPES.AFRICAN, 1, 0, false);

        expect(parrot.getSpeed()).eql(3);
    });

    it("get speed of african parrot with two coconuts", function () {
        var parrot = new Parrot(Parrot.TYPES.AFRICAN, 2, 0, false);

        expect(parrot.getSpeed()).eql(0);
    });

    it("get speed of african parrot with no coconuts", function () {
        var parrot = new Parrot(Parrot.TYPES.AFRICAN, 0, 0, false);

        expect(parrot.getSpeed()).eql(12);
    });

    it("get speed norwegian blue parrot nailed", function () {
        var parrot = new Parrot(Parrot.TYPES.NORWEGIAN_BLUE, 0, 1.5, true);

        expect(parrot.getSpeed()).eql(0);
    });

    it("get speed norwegian blue parrot not nailed", function () {
        var parrot = new Parrot(Parrot.TYPES.NORWEGIAN_BLUE, 0, 1.5, false);

        expect(parrot.getSpeed()).eql(18);
    });

    it("get speed norwegian blue parrot not nailed high voltage", function () {
        var parrot = new Parrot(Parrot.TYPES.NORWEGIAN_BLUE, 0, 4, false);

        expect(parrot.getSpeed()).eql(24);
    });
});
