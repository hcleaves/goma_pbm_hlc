Changes in version 7.0

- Partial Segregated solver support
    - Some developer notes are located `docs/segregated_notes.org`
    - Small tutorial is available on website
    - Mostly tested the following equations
        - Momentum + Continuity
        - Level Set
        - Energy
        - Species
        - Viscoelastic flow
        - Moments
        - Mesh
    - If you have need for segregated solver support on other problems or find a bug
      open an issue
- Automatic rotations for normal conditions in 3D
    - Requires that no ROT conditions are specified and only NORMAL rotated BCs are used
    - Works for Momentum and Mesh
    - Does not work for TANGENT or EDGE BCs
- Quadratic tetrahedrons (TET10 in Cubit)
- Partial PETSc support for matrix solvers
    - Can be used with a `petscrc` or `-petsc "petsc options"` on the command line
    - See manual `Solution Algorithm` for more information
- Various new equations, including:
    - Population balance equations using Moments (see Ortiz et al. 2022 AIChE)
    - Time-Harmonic Maxwell Equations with Lagrange Finite Elements and a penalty stabilization
- Adaptive meshing using `Omega_h` library for first order simplices
    - Requires first order Tet or Tri
    - Currently mostly used for level set problems see `Level Set Adapt` cards
    - ALE adaptivity of uniform ("iso") mesh size, see `ALE Adapt` cards
    - Currently limited to single materials
    - Nodesets and Sidesets must contain the same geometry and have the same number
- Various bug fixes and feature updates, see merged Pull Requests


Changes in version 6.2

- Many bug fixes
- Stratimikos support
- Log conformation tensor stress model
- Hysing and Denner surface tension models for level set
- Suspension balance updates
- Updated SUPG for species
- Quadratic triangles
- And more...

Changes in version 6.1

- Automatic creation of brk files (see `docs/parallel_integration.md`)
- Bug fixes (mostly MPI related bugs)
- Epetra is now a supported matrix format (see `docs/epetra_matrix_format.md`)
- MUMPS is now supported through Amesos
- An experimental build script to build library dependencies is available under `scripts/`