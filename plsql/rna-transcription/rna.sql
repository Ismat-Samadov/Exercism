CREATE OR REPLACE FUNCTION dna_to_rna(dna_seq IN VARCHAR2) RETURN VARCHAR2 IS
    rna_seq VARCHAR2(1000); -- Variable to store the RNA complement
    
    -- Function to determine the RNA complement of a DNA nucleotide
    FUNCTION complement_nucleotide(dna_nucleotide IN CHAR) RETURN CHAR IS
    BEGIN
        CASE dna_nucleotide
            WHEN 'G' THEN RETURN 'C';
            WHEN 'C' THEN RETURN 'G';
            WHEN 'T' THEN RETURN 'A';
            WHEN 'A' THEN RETURN 'U';
            ELSE RETURN NULL;
        END CASE;
    END complement_nucleotide;
BEGIN
    rna_seq := ''; -- Initialize the RNA sequence
    
    -- Iterate over each nucleotide in the DNA sequence
    FOR i IN 1..LENGTH(dna_seq) LOOP
        DECLARE
            dna_char CHAR(1); -- Variable to store each DNA nucleotide during iteration
        BEGIN
            dna_char := SUBSTR(dna_seq, i, 1); -- Get the current DNA nucleotide
        
            -- Append the complement of the current DNA nucleotide to the RNA sequence
            rna_seq := rna_seq || complement_nucleotide(dna_char);
        END;
    END LOOP;
    
    RETURN rna_seq; -- Return the RNA complement sequence
END dna_to_rna;
/
set SERVEROUTPUT on
-- Test the function with different DNA sequences
SELECT dna_to_rna('GCTA') AS rna_sequence_1,
       dna_to_rna('ACGTGCTA') AS rna_sequence_2
FROM dual;
