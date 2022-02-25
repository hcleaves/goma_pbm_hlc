/************************************************************************ *
* Goma - Multiphysics finite element software                             *
* Sandia National Laboratories                                            *
*                                                                         *
* Copyright (c) 2022 Goma Developers, National Technology & Engineering   *
*               Solutions of Sandia, LLC (NTESS)                          *
*                                                                         *
* Under the terms of Contract DE-NA0003525, the U.S. Government retains   *
* certain rights in this software.                                        *
*                                                                         *
* This software is distributed under the GNU General Public License.      *
* See LICENSE file.                                                       *
\************************************************************************/

/* emuck.h -- function prototype declarations for emuck.c
 *
 * $Header: /projects/seataf/CVS/ACCESS/analysis/goma/brkfix/emuck.h,v 1.1 1999-08-30 16:17:50
 * pasacki Exp $
 */

#ifndef GOMA_EMUCK_H
#define GOMA_EMUCK_H

extern void assign_elem_ownership(const Exo_DB *, /* monolith FE db w/ connectivity       (in) */
                                  const int,      /* how many pieces                      (in) */
                                  const int *,    /* pointers into list                   (in) */
                                  const int *,    /* procsets "owning" nodes              (in) */
                                  int **,         /* which proc owns this elem           (out) */
                                  int **,         /* num elems owned by each proc        (out) */
                                  int **);        /* boolean, !boundary=internal         (out) */

extern void build_elem_elem_xtra /* emuck.c                                  */
    (Exo_DB *);                  /* exo - monolith FE db w/ connectivity (in) */

extern void build_elem_elem_dpi /* emuck.c                                   */
    (Exo_DB *,                  /* monolith                                  */
     int *,                     /* elem_owner_list                           */
     Exo_DB *,                  /* piece                                     */
     Dpi *);                    /* dpi                                       */

#endif