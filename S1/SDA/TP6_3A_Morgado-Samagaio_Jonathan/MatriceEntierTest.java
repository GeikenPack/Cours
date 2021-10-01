import junit.textui.TestRunner;
import junit.framework.TestSuite;
import junit.framework.TestCase;

public class MatriceEntierTest extends TestCase {
  static int totalAssertions = 0;
  static int bilanAssertions = 0;

  /*
   Types des opérations du type MatriceEntier
  */
  public void test_type_new_MatriceEntier() throws Exception {
    MatriceEntier m = new MatriceEntier(3,3) ;

    totalAssertions++ ;
    assertEquals("new MatriceEntier(3,3) retourne une MatriceEntier", "MatriceEntier", m.getClass().getName());
    bilanAssertions++ ;
  }

  public void test_type_get() throws Exception {
    MatriceEntier m = new MatriceEntier(3,4) ;

    totalAssertions++ ;
    assertTrue("getNbLignes() retourne un entier positif", ProgrammeMatriceEntier.getNbLignes(m) >= 0);
    bilanAssertions++ ;

    totalAssertions++ ;
    assertTrue("getNbColonnes() retourne un entier positif", ProgrammeMatriceEntier.getNbColonnes(m) >= 0);
    bilanAssertions++ ;

    totalAssertions++ ;
    assertTrue("getElement() retourne un entier positif", ProgrammeMatriceEntier.getElement(m,0,0) >= 0);
    bilanAssertions++ ;
  }

  public void test_type_som() throws Exception {
    MatriceEntier m = new MatriceEntier(3,4) ;

    for (int i=0; i<3; i++) {
      totalAssertions++ ;
      assertTrue("somLigne("+i+") >= 0", ProgrammeMatriceEntier.somLigne(m,i) >= 0);
      bilanAssertions++ ;
    }
    for (int j=0; j<4; j++) {
      totalAssertions++ ;
      assertTrue("somColonne("+j+") >= 0", ProgrammeMatriceEntier.somColonne(m,j) >= 0);
      bilanAssertions++ ;
    }
  }

  public void test_type_est() throws Exception {
    MatriceEntier m = new MatriceEntier(3,3) ;
    totalAssertions++ ;
    assertTrue("estCarree() retourne un booleen", (ProgrammeMatriceEntier.estCarree(m) == true) || (ProgrammeMatriceEntier.estCarree(m) == false));
    bilanAssertions++ ;

    totalAssertions++ ;
    assertTrue("estDiagonale() retourne un booleen", (ProgrammeMatriceEntier.estDiagonale(m) == true) || (ProgrammeMatriceEntier.estDiagonale(m) == false));
    bilanAssertions++ ;

    m = new MatriceEntier(3,4) ;
    totalAssertions++ ;
    assertTrue("estCarree() retourne un booleen", (ProgrammeMatriceEntier.estCarree(m) == true) || (ProgrammeMatriceEntier.estCarree(m) == false));
    bilanAssertions++ ;
  }

   /*
   Préconditions du type MatriceEntier
  */
  public void test_precondition1() {
    MatriceEntier m ;
    boolean exception = false ;
    try { m = new MatriceEntier(0,1) ; }
    catch (Exception e) { exception = true ; };

    totalAssertions++ ;
    assertTrue("new MatriceEntier(0,1) leve une exception", exception);
    bilanAssertions++ ;

    exception = false ;
    try { m = new MatriceEntier(1,0) ; }
    catch (Exception e) { exception = true ; };

    totalAssertions++ ;
    assertTrue("new MatriceEntier(1,0) leve une exception", exception);
    bilanAssertions++ ;

    exception = false ;
    try { m = new MatriceEntier(0,0) ; }
    catch (Exception e) { exception = true ; };

    totalAssertions++ ;
    assertTrue("new MatriceEntier(0,0) leve une exception", exception);
    bilanAssertions++ ;
  }

  public void test_precondition2() throws Exception {
    MatriceEntier m = new MatriceEntier(2,3);
    boolean exception = false ;
    try { ProgrammeMatriceEntier.getElement(m,-1,1) ; }
    catch (Exception e) { exception = true ; };

    totalAssertions++ ;
    assertTrue("getElement(-1,1) leve une exception", exception);
    bilanAssertions++ ;

    exception = false ;
    try { ProgrammeMatriceEntier.getElement(m,2,2) ; }
    catch (Exception e) { exception = true ; };

    totalAssertions++ ;
    assertTrue("getElement(2,2) leve une exception", exception);
    bilanAssertions++ ;

    exception = false ;
    try { ProgrammeMatriceEntier.getElement(m,1,-1) ; }
    catch (Exception e) { exception = true ; };

    totalAssertions++ ;
    assertTrue("getElement(1,-1) leve une exception", exception);
    bilanAssertions++ ;

    exception = false ;
    try { ProgrammeMatriceEntier.getElement(m,1,3) ; }
    catch (Exception e) { exception = true ; };

    totalAssertions++ ;
    assertTrue("getElement(1,3) leve une exception", exception);
    bilanAssertions++ ;
  }

  public void test_precondition3() throws Exception {
    MatriceEntier m = new MatriceEntier(2,3);
    boolean exception = false ;
    try { ProgrammeMatriceEntier.setElement(m,-1,1,99) ; }
    catch (Exception e) { exception = true ; };

    totalAssertions++ ;
    assertTrue("setElement(m,-1,1,99) leve une exception", exception);
    bilanAssertions++ ;

    exception = false ;
    try { ProgrammeMatriceEntier.setElement(m,2,2,99) ; }
    catch (Exception e) { exception = true ; };

    totalAssertions++ ;
    assertTrue("setElement(m,2,2,99) leve une exception", exception);
    bilanAssertions++ ;

    exception = false ;
    try { ProgrammeMatriceEntier.setElement(m,1,-1,99) ; }
    catch (Exception e) { exception = true ; };

    totalAssertions++ ;
    assertTrue("setElement(m,1,-1,99) leve une exception", exception);
    bilanAssertions++ ;

    exception = false ;
    try { ProgrammeMatriceEntier.setElement(m,1,3,99) ; }
    catch (Exception e) { exception = true ; };

    totalAssertions++ ;
    assertTrue("setElement(m,1,3,99) leve une exception", exception);
    bilanAssertions++ ;
  }

  public void test_precondition4() throws Exception {
    MatriceEntier m = new MatriceEntier(2,3);
    boolean exception = false ;
    try { ProgrammeMatriceEntier.somLigne(m,-1) ; }
    catch (Exception e) { exception = true ; };

    totalAssertions++ ;
    assertTrue("somLigne(m,-1) leve une exception", exception);
    bilanAssertions++ ;

    exception = false ;
    try { ProgrammeMatriceEntier.somLigne(m,2) ; }
    catch (Exception e) { exception = true ; };

    totalAssertions++ ;
    assertTrue("somLigne(m,2) leve une exception", exception);
    bilanAssertions++ ;
  }

  public void test_precondition5() throws Exception {
    MatriceEntier m = new MatriceEntier(2,3);
    boolean exception = false ;
    try { ProgrammeMatriceEntier.somColonne(m,-1) ; }
    catch (Exception e) { exception = true ; };

    totalAssertions++ ;
    assertTrue("somColonne(m,-1) leve une exception", exception);
    bilanAssertions++ ;

    exception = false ;
    try { ProgrammeMatriceEntier.somColonne(m,3) ; }
    catch (Exception e) { exception = true ; };

    totalAssertions++ ;
    assertTrue("somColonne(m,3) leve une exception", exception);
    bilanAssertions++ ;
  }

  public void test_precondition6() throws Exception {
    MatriceEntier m = new MatriceEntier(2,3);
    boolean exception = false ;
    try { ProgrammeMatriceEntier.setPremiereDiagonale(m,99) ; }
    catch (Exception e) { exception = true ; };

    totalAssertions++ ;
    assertTrue("setPremiereDiagonale(m,99) leve une exception", exception);
    bilanAssertions++ ;
  }

  public void test_precondition7() throws Exception {
    MatriceEntier m = new MatriceEntier(2,3);
    boolean exception = false ;
    try { ProgrammeMatriceEntier.setSecondeDiagonale(m,99) ; }
    catch (Exception e) { exception = true ; };

    totalAssertions++ ;
    assertTrue("setSecondeDiagonale(m,99) leve une exception", exception);
    bilanAssertions++ ;
  }

  public void test_precondition8() throws Exception {
    MatriceEntier m = new MatriceEntier(2,3);
    boolean exception = false ;
    try { ProgrammeMatriceEntier.estDiagonale(m) ; }
    catch (Exception e) { exception = true ; };

    totalAssertions++ ;
    assertTrue("estDiagonale(m) leve une exception", exception);
    bilanAssertions++ ;
  }

  /*
   Axiomes du type MatriceEntier
  */
  public void test_get() throws Exception {
    MatriceEntier m = new MatriceEntier(3,4) ;

    totalAssertions++ ;
    assertEquals("getNbLignes(m) == 3", 3, ProgrammeMatriceEntier.getNbLignes(m));
    bilanAssertions++ ;

    totalAssertions++ ;
    assertEquals("getNbColonnes(m) == 4", 4, ProgrammeMatriceEntier.getNbColonnes(m));
    bilanAssertions++ ;

    for (int i=0; i<ProgrammeMatriceEntier.getNbLignes(m); i++) {
     for (int j=0; j<ProgrammeMatriceEntier.getNbColonnes(m); j++) {
      totalAssertions++ ;
      assertEquals("getElement(m,"+i+","+j+") == 0", 0, ProgrammeMatriceEntier.getElement(m,i,j));
      bilanAssertions++ ;
     }
    }

    m = new MatriceEntier(3,3) ;
    totalAssertions++ ;
    int nb =  ProgrammeMatriceEntier.getNbLignes(m);
    ProgrammeMatriceEntier.setPremiereDiagonale(m,99) ;

    assertEquals("ProgrammeMatriceEntier.getNbLignes(ProgrammeMatriceEntier.setPremiereDiagonale(m,99)) == getNbLignes()", ProgrammeMatriceEntier.getNbLignes(m), nb);
    bilanAssertions++ ;

    totalAssertions++ ;
    nb =  ProgrammeMatriceEntier.getNbLignes(m);
    ProgrammeMatriceEntier.setSecondeDiagonale(m,99) ;
    assertEquals("ProgrammeMatriceEntier.getNbLignes(ProgrammeMatriceEntier.setSecondeDiagonale(m,99)), == getNbLignes()", ProgrammeMatriceEntier.getNbLignes(m), nb);
    bilanAssertions++ ;

    m = new MatriceEntier(3,3) ;
    ProgrammeMatriceEntier.setPremiereDiagonale(m,99) ;
    for (int i=0; i<ProgrammeMatriceEntier.getNbLignes(m); i++) {
     for (int j=0; j<ProgrammeMatriceEntier.getNbColonnes(m); j++) {
      totalAssertions++ ;
      if ( i == j ) {
        assertEquals("getElement(m,"+i+","+i+") == 99", 99, ProgrammeMatriceEntier.getElement(m,i,i));
      } else {
        assertEquals("getElement(m,"+i+","+j+") == 0", 0, ProgrammeMatriceEntier.getElement(m,i,j));
      }
      bilanAssertions++ ;
     }
    }

  } // fin test_get

  public void test_som() throws Exception {
    MatriceEntier m = new MatriceEntier(3,4) ;

    for (int i=0; i<ProgrammeMatriceEntier.getNbLignes(m); i++) {
      totalAssertions++ ;
      assertEquals("somLigne(m,"+i+") == 0", 0, ProgrammeMatriceEntier.somLigne(m,i));
      bilanAssertions++ ;
    }
    for (int j=0; j<ProgrammeMatriceEntier.getNbColonnes(m); j++) {
      totalAssertions++ ;
      assertEquals("somColonne(m,"+j+") == 0", 0, ProgrammeMatriceEntier.somColonne(m,j));
      bilanAssertions++ ;
    }

    m = new MatriceEntier(3,3) ;
    ProgrammeMatriceEntier.setPremiereDiagonale(m,99) ;
    for (int ij=0; ij<ProgrammeMatriceEntier.getNbLignes(m); ij++) {
      totalAssertions = totalAssertions + 2 ; ;
      assertEquals("setPremiereDiagonale(m,99).somLigne("+ij+") == 99", 99, ProgrammeMatriceEntier.somLigne(m,ij));
      bilanAssertions++ ;
      assertEquals("setPremiereDiagonale(m,99).somColonne("+ij+") == 99", 99, ProgrammeMatriceEntier.somColonne(m,ij));
      bilanAssertions++ ;
    }

    m = new MatriceEntier(3,3) ;
    ProgrammeMatriceEntier.setSecondeDiagonale(m,99) ;
    for (int ij=0; ij<ProgrammeMatriceEntier.getNbLignes(m); ij++) {
      totalAssertions = totalAssertions + 2 ; ;
      assertEquals("setSecondeDiagonale(m,99).somLigne("+ij+") == 99", 99, ProgrammeMatriceEntier.somLigne(m,ij));
      bilanAssertions++ ;
      assertEquals("setSecondeDiagonale(m,99).somColonne("+ij+") == 99", 99, ProgrammeMatriceEntier.somColonne(m,ij));
      bilanAssertions++ ;
    }

  } // fin test_som

  public void test_est() throws Exception {
    MatriceEntier m = new MatriceEntier(3,3) ;
    totalAssertions++ ;
    assertTrue("estCarree(m) == true", ProgrammeMatriceEntier.estCarree(m));
    bilanAssertions++ ;

    m = new MatriceEntier(2,3) ;
    totalAssertions++ ;
    assertFalse("estCarree(m) == false", ProgrammeMatriceEntier.estCarree(m));
    bilanAssertions++ ;

    m = new MatriceEntier(3,3) ;
    totalAssertions++ ;
    assertTrue("estDiagonale(m) == true", ProgrammeMatriceEntier.estDiagonale(m));
    bilanAssertions++ ;

    ProgrammeMatriceEntier.setPremiereDiagonale(m,99);
    totalAssertions++ ;
    assertTrue("setPremiereDiagonale(m,99).estDiagonale() == true", ProgrammeMatriceEntier.estDiagonale(m));
    bilanAssertions++ ;

    ProgrammeMatriceEntier.setSecondeDiagonale(m,99);
    totalAssertions++ ;
    assertFalse("setSecondeDiagonale(m,99).estDiagonale() == false", ProgrammeMatriceEntier.estDiagonale(m));
    bilanAssertions++ ;

  } // fin test_est

  public void test_mul() throws Exception {
    MatriceEntier m = new MatriceEntier(3,3) ;
    ProgrammeMatriceEntier.setPremiereDiagonale(m,1);
    ProgrammeMatriceEntier.mulMatNombre(m ,99) ;
    for (int ij=0; ij<ProgrammeMatriceEntier.getNbLignes(m); ij++) {
      totalAssertions = totalAssertions + 2 ; ;
      assertEquals("ProgrammeMatriceEntier.somLigne(m,"+ij+") == 99", 99, ProgrammeMatriceEntier.somLigne(m,ij));
      bilanAssertions++ ;
      assertEquals("ProgrammeMatriceEntier.somColonne("+ij+") == 99", 99, ProgrammeMatriceEntier.somColonne(m,ij));
      bilanAssertions++ ;
    }

    m = new MatriceEntier(3,3) ;
    ProgrammeMatriceEntier.setSecondeDiagonale(m,1);
    ProgrammeMatriceEntier.mulMatNombre(m ,99) ;
    for (int ij=0; ij<ProgrammeMatriceEntier.getNbLignes(m); ij++) {
      totalAssertions = totalAssertions + 2 ; ;
      assertEquals("ProgrammeMatriceEntier.somLigne(m,"+ij+") == 99", 99, ProgrammeMatriceEntier.somLigne(m,ij));
      bilanAssertions++ ;
      assertEquals("ProgrammeMatriceEntier.somColonne(m,"+ij+") == 99", 99, ProgrammeMatriceEntier.somColonne(m,ij));
      bilanAssertions++ ;
    }

    MatriceEntier m_init = new MatriceEntier(3,3) ;
    m = new MatriceEntier(3,3) ;
    // Initialise m_init et m à {{0,1,2}{3,4,5}{6,7,8}}
    int k = 0 ;
    for (int i=0; i<ProgrammeMatriceEntier.getNbLignes(m); i++) {
     for (int j=0; j<ProgrammeMatriceEntier.getNbColonnes(m); j++) {
        ProgrammeMatriceEntier.setElement(m_init,i,j,k) ;
        ProgrammeMatriceEntier.setElement(m,i,j,k) ;
        k = k + 1 ;
     }
    }
    ProgrammeMatriceEntier.mulMatNombre(m,3) ;
    for (int i=0; i<ProgrammeMatriceEntier.getNbLignes(m); i++) {
     for (int j=0; j<ProgrammeMatriceEntier.getNbColonnes(m); j++) {
      totalAssertions++ ;
      assertEquals("mulMatNombre(m,3).getElement("+i+","+j+") == getElement(m,"+i+","+j+") * 3", ProgrammeMatriceEntier.getElement(m_init,i,j) * 3, ProgrammeMatriceEntier.getElement(m,i,j));
      bilanAssertions++ ;
     }
    }

  } // fin test_mul

  /*
   Opérations supplémentaires du type MatriceEntier
  */
  public void test_toString() throws Exception {
    MatriceEntier m = new MatriceEntier(3,3) ;
    ProgrammeMatriceEntier.setPremiereDiagonale(m,1);
    ProgrammeMatriceEntier.setSecondeDiagonale(m ,2) ;

    String ln = System.getProperty("line.separator") ;
    String attendu = "1 0 2 " + ln + "0 2 0 " + ln + "2 0 1 " + ln ;
    totalAssertions++ ;
    assertEquals("toString(m) == ", attendu, ProgrammeMatriceEntier.toString(m));
    bilanAssertions++ ;
  }

  public void test_toHTML() throws Exception {
    MatriceEntier m = new MatriceEntier(3,3) ;
    ProgrammeMatriceEntier.setPremiereDiagonale(m,1);
    ProgrammeMatriceEntier.setSecondeDiagonale(m ,2) ;

    String ln = System.getProperty("line.separator") ;
    String attendu = "<table border=\"1\">" + ln ;
    attendu += "<tr><td>1</td><td>0</td><td>2</td></tr>" + ln + "<tr><td>0</td><td>2</td><td>0</td></tr>" + ln + "<tr><td>2</td><td>0</td><td>1</td></tr>" + ln ;
    attendu += "</table>" + ln ;
    totalAssertions++ ;
    assertEquals("toHTML(m) == ", attendu, ProgrammeMatriceEntier.toHTML(m));
    bilanAssertions++ ;
  }
  
  /*
   main() de la classe de Test
  */
  public static void main(String[] args) {
    junit.textui.TestRunner.run(new TestSuite(MatriceEntierTest.class));
    if (bilanAssertions == totalAssertions) { System.out.print("Bravo !"); }
    else  { System.out.print("OUPS !"); }
    System.out.println(" "+bilanAssertions+"/"+totalAssertions+" assertions verifiees");
  } // fin main

} // fin ProgrammeMatriceEntierTest