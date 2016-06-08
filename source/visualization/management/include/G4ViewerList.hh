//
// ********************************************************************
// * DISCLAIMER                                                       *
// *                                                                  *
// * The following disclaimer summarizes all the specific disclaimers *
// * of contributors to this software. The specific disclaimers,which *
// * govern, are listed with their locations in:                      *
// *   http://cern.ch/geant4/license                                  *
// *                                                                  *
// * Neither the authors of this software system, nor their employing *
// * institutes,nor the agencies providing financial support for this *
// * work  make  any representation or  warranty, express or implied, *
// * regarding  this  software system or assume any liability for its *
// * use.                                                             *
// *                                                                  *
// * This  code  implementation is the  intellectual property  of the *
// * GEANT4 collaboration.                                            *
// * By copying,  distributing  or modifying the Program (or any work *
// * based  on  the Program)  you indicate  your  acceptance of  this *
// * statement, and all its terms.                                    *
// ********************************************************************
//
//
// $Id: G4ViewerList.hh,v 1.5.2.1 2001/06/28 19:16:07 gunter Exp $
// GEANT4 tag $Name:  $
//
// 
// John Allison  May 1996

#ifndef G4VIEWERLIST_HH
#define G4VIEWERLIST_HH

#include "g4std/vector"
#include "G4VViewer.hh"

class G4ViewerList: public G4std::vector<G4VViewer*> {
public:
  void remove(G4VViewer*);
};

typedef G4std::vector<G4VViewer*>::iterator G4ViewerListIterator;
typedef G4std::vector<G4VViewer*>::const_iterator G4ViewerListConstIterator;

#endif