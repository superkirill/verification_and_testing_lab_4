Feature: Testing class Generator

  Scenario Outline: Generate chord
    Given Generator
     When the chord <chord> is requested
     Then Generator returns <notes>

    Examples: Chords
    | chord      | notes      |
    | A          | A, C#, E   |
    | A#         | A#, D, F   |
    | B          | B, D#, F#  |
    | C          | C, E, G    |
    | C#         | C#, F, G#  |
    | D          | D, F#, A   |
    | D#         | D#, G, A#  |
    | E          | E, G#, B   |
    | F          | F, A, C    |
    | F#         | F#, A#, C# |
    | G          | G, B, D    |
    | G#         | G#, C, D#  |
    | A, minor   | A, C, E    |
    | A#, minor  | A#, C#, F  |
    | B, minor   | B, D, F#   |
    | C, minor   | C, D#, G   |
    | C#, minor  | C#, E, G#  |
    | D, minor   | D, F, A    |
    | D#, minor  | D#, F#, A# |
    | E, minor   | E, G, B    |
    | F, minor   | F, G#, C   |
    | F#, minor  | F#, A, C#  |
    | G, minor   | G, A#, D   |
    | G#, minor  | G#, B, D#  |


  Scenario Outline: Generate bad chord
    Given Generator
    When the wrong chord <bad_chord> is requested
    Then Generator throws a ValueError

    Examples: Bad Chords
    | bad_chord      |
    | G#, superchord |
    | XYZ            |
    | 214`e23f       |
    | SOSISKI ALTAYA |

  Scenario Outline: Testing how the generator can play notes
    Given Generator
    When it is asked to play a note <note>
    Then it plays it and signals that everything is okay

    Examples: note
    | note  |
    | A     |
    | G#    |
    | F     |

  Scenario Outline: Testing how the generator reacts to incorrect
    notes it is asked to play
    Given Generator
    When it is asked to play a horrible incorrect note <bad_note>
    Then it shows that something went wrong

    Examples: bad_notes
    | bad_note  |
    | KUSAL_DUB |
    | 90        |
    | LOSI      |

  Scenario Outline: Testing how the generator can play chords
    Given Generator
    When it is asked to play a chord <chord>
    Then it plays it and signals that everything is okay

    Examples: chords
    | chord   |
    | C, E, G |
    | F, A, G |

  Scenario Outline: Testing how the generator can select instrument
    Given Generator
    When it is required to play a note <note> with a specific <instrument>
    Then it plays it and signals that everything is okay

    Examples: notes and instruments
    | note   | instrument |
    | C      | 1          |
    | F      | 2          |

  Scenario Outline: Testing how the generator can change duration of playing
    Given Generator
    When it is needed to play a note <note> with specific <duration>
    Then it plays it and signals that everything is okay

    Examples: notes and durations
    | note   | duration |
    | C      | 1        |
    | C#      | 2        |


  Scenario Outline: Testing how the generator can play notes in a specific octave
    Given Generator
    When it should play a note <note> in a specific <octave>
    Then it plays it and signals that everything is okay

    Examples: notes and octaves
    | note   | octave   |
    | C      | 4        |
    | F      | 5        |

  Scenario Outline: Testing how the generator handles incorrect chords
    Given Generator
    When it tries to play an incorrect chord <chord>
    Then it shows that something went wrong

    Examples: bad chords
    | chord    |
    | GGG      |
    | 1+2      |
    | G, X, Y  |