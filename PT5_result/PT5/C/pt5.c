#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <stdbool.h>
#include <wchar.h>
#define NoInputMsg "Data are not input.\n"
#define NotAllInputMsg "Some required data are not input.\n"
#define TooManyInputMsg "An attempt to input superfluous data.\n"
#define WrongTypeInputMsg "Invalid type is used for an input data item.\n"
#define NoTaskCallMsg "ERROR: the Task function is not called at beginning of the program"

#define UTFTextMark "[[!UTF8MARK!]]"


int prec = 2;
int width = 0;
int width1 = -1;

struct TData
{
  char id;
  double r;
  char s[200];
} idata[801];

char InfoS[350], indat[20], outdat[20], errdat[20], showdat[20];

int psize = -1, prank = -1, useddata = 0, nidata = 0, idatacount = 0;

void error_(const char *msg, const char *id)
{
  FILE *f = fopen(errdat, "w");
  fputs(msg, f);
  fputs(id, f);
  fclose(f);
}

void init_()
{
  prank = 0;
  #ifdef __linux__
  sprintf(indat, ".pt/pt5in%d.dat", prank);
  sprintf(outdat, ".pt/pt5out%d.dat", prank);
  sprintf(errdat, ".pt/pt5err%d.dat", prank);
  sprintf(showdat, ".pt/pt5sh%d.dat", prank);
  #endif
  #ifdef _WIN32
  sprintf(indat, ".pt\\pt5in%d.dat", prank);
  sprintf(outdat, ".pt\\pt5out%d.dat", prank);
  sprintf(errdat, ".pt\\pt5err%d.dat", prank);
  sprintf(showdat, ".pt\\pt5sh%d.dat", prank);
  #endif
  remove(outdat);
  remove(errdat);
  remove(showdat);
  FILE *f = fopen(indat, "r");
  if (f != NULL)
  {
    char id[200];
    while (fgets(id, 10, f)) // reading all input data
                             // and determing data size
    {
      idata[nidata].id = id[0];
      fgets(id, 200, f);
      id[strlen(id) - 1] = '\0'; // remove '\n'
      switch (idata[nidata].id)
      {
      case 'b':
      case 'i':
        idata[nidata].r = atoi(id);
        break;
      case 'r':
        idata[nidata].r = atof(id);
        break;
      case 'c':
        idata[nidata].s[0] = id[0];
        break;
      case 's':
        strcpy(idata[nidata].s, id);
        break;
      }
      ++nidata;
    }
    fclose(f);
  }
  error_(NoInputMsg, "3");
  if (useddata == 0 || prank > 0) // for slave processes,
                                  // we do not take useddata into account;
                                  // all input data are required to input
    useddata = nidata;
  idatacount = 0;
}

bool addchar = false;

void show_(char *s)
{
  if (psize < 1)
  {
    puts(NoTaskCallMsg);
    exit(1);
  }

  FILE *f = fopen(showdat, "a");
  if (addchar)
    fprintf(f, " ");
  fprintf(f, "%s", s);//fprintf(f, s);
  fclose(f);
  addchar = true;
}

void ptruutf8_(const char *s1, char *s2)
{
  strcpy(s2, s1); // STUB; not implemented yet
                  // (need only for Russian texts)
}

void ptutf8_(const char *s1, char *s2)
{
  int f = 0;
  for (int i = 0; i < strlen(s1); i++)
    if (s1[i] < 0)
    {
    	f = 1;
    	break;
    }	
  if (f)
  {
    strcpy(s2, UTFTextMark);
    strcat(s2, s1); 
    strcat(s2, UTFTextMark);
  }
  else
    strcpy(s2, s1);
}

void ShowB(bool b)
{
  int w = width1 == -1 ? width : width1;
  if (b)
    sprintf(InfoS, "%*s", -w, "true ");
  else
    sprintf(InfoS, "%*s", -w, "false");
  show_(InfoS);
  width1 = -1;
}

void ShowC(char c)
{
  int w = width1 == -1 ? width : width1;
  int w0 = 3;
  char s[5] = {'\'', c, '\'', '\0', '\0'};
  if (c == '\0' || c == '\n')
  {
    w0 = 4;
    s[1] = '\\';
    s[2] = c == '\0' ? '0' : 'n';
    s[3] = '\'';
  }
  char *s2 = (char *)malloc(w <= w0 ? w0 + 1 : (w + 1));
  if (s2 != 0)
  {
    sprintf(s2, "%*s", -w, s);
    ptruutf8_(s2, InfoS);
    (*show_)(InfoS);
    free(s2);
  }
  width1 = -1;
}

void ShowN(int n)
{
  int w = width1 == -1 ? width : width1;
  sprintf(InfoS, "%*d", w, n);
  show_(InfoS);
  width1 = -1;
}

void ShowD(double d)
{
  int w = width1 == -1 ? width : width1;
  if (prec > 0)
    sprintf(InfoS, "%*.*f", w, prec, d);
  else
    sprintf(InfoS, "%*.*e", w, prec == 0 ? 6 : -prec, d);
  show_(InfoS);
  width1 = -1;
}

void ShowS(const char *s)
{
  int w = width1 == -1 ? width : width1;
  int n = 0, neol = 0;
  for (int i = 0; s[i] != '\0'; ++i)
  {
    ++n;
    if (s[i] == '\n')
      ++neol;
  }
  n += neol + 2;
  char *s3 = (char *)malloc(n + 1);
  if (s3 != 0)
  {
    s3[n] = '\0';
    s3[n - 1] = '"';
    for (int i = n - neol - 3; i >= 0; --i)
      if (s[i] != '\n')
        s3[i + neol + 1] = s[i];
      else
      {
        s3[i + neol + 1] = 'n';
        s3[i + neol] = '\\';
        --neol;
      }
    s3[0] = '"';
    if (n < w)
      n = w;
    char *s2 = (char *)malloc(n + 1);
    if (s2 != 0)
    {
      sprintf(s2, "%*s", -w, s3);
      char *s1 = (char *)malloc(3 * n + 1);
      if (s1 != 0)
      {
        ptruutf8_(s2, s1);
        show_(s1);
        free(s1);
      }
      free(s2);
    }
    free(s3);
  }
  width1 = -1;
}

void Show(const char *cmt)
{
  int n = strlen(cmt);
  char *s2 = (char *)malloc(n + 1);
  if (s2 == 0)
    return;
  strcpy(s2, cmt);
  for (int i = n - 1; i >= 0; --i)
    if (s2[i] == ' ')
      n = i;
    else
      break;
  s2[n] = '\0';
  if (n > 0) // empty comments are not printed
  {
    char *s1 = (char *)malloc(3 * n + 1 + 50); //!!!!!!!!!!  +50
    if (s1 != 0)
    {
      ptutf8_(s2, s1);
      show_(s1);
      free(s1);
    }
  }
  free(s2);
}

void ShowW(const wchar_t *cmt)
{
  int n = wcslen(cmt);
  wchar_t *s2 = (wchar_t *)malloc((n + 1) * 2);
  if (s2 == 0)
    return;
  wcscpy(s2, cmt);
  for (int i = n - 1; i >= 0; --i)
    if (s2[i] == L' ')
      n = i;
    else
      break;
  s2[n] = L'\0';
  if (n > 0) // empty comments are not printed
  {
    char *s1 = (char *)malloc(4 * n + 1 + 50);  //
    if (s1 != 0)
    {
      ptutf8_((char *)s2, s1);
      show_(s1);
      free(s1);
    }
  }
  free(s2);
}


void showline_(void)
{
  addchar = false;
  show_("\n");
  addchar = false;
}

void ShowLineB(bool b)
{
  ShowB(b);
  showline_();
}

void ShowLineN(int n)
{
  ShowN(n);
  showline_();
}

void ShowLineD(double d)
{
  ShowD(d);
  showline_();
}

void ShowLineC(char c)
{
  ShowC(c);
  showline_();
}

void ShowLineS(const char *s)
{
  ShowS(s);
  showline_();
}

void ShowLine(const char *cmt)
{
  Show(cmt);
  showline_();
}

void ShowLineW(const wchar_t *cmt)
{
  ShowW(cmt);
  showline_();
}

void put_(char id, double n, char c, const char *s)
{
  if (psize < 1)
  {
    puts(NoTaskCallMsg);
    exit(1);
  }
  FILE *f = fopen(outdat, "a");
  fprintf(f, "%c\n", id);
  switch (id)
  {
  case 'b':
    fprintf(f, "%d\n", (int)n);
    break;
  case 'i':
    fprintf(f, "%d\n", (int)n);
    break;
  case 'r':
    fprintf(f, "%0.14e\n", n);
    break;
  case 'c':
    fprintf(f, "%c\n", c);
    break;
  case 's':
    fprintf(f, "%s\n", s);
    break;
  }
  fclose(f);
}

void PutB(bool a)
{
  put_('b', (int)a, ' ', 0);
}

void PutN(int a)
{
  put_('i', a, ' ', 0);
}

void PutD(double a)
{
  put_('r', a, ' ', 0);
}

void PutC(char a)
{
  put_('c', 0, a, 0);
}

void PutS(const char *a)
{
  put_('s', 0, ' ', a);
}

void get_(char id, double *n, char *c, char *s)
{
  if (psize < 1)
  {
    puts(NoTaskCallMsg);
    exit(1);
  }
  if (idatacount == nidata)
  {
    error_(TooManyInputMsg, "4");
    exit(1);
    return;
  }
  if (id != idata[idatacount].id)
  {
    error_(WrongTypeInputMsg, "5");
    exit(1);
    return;
  }
  switch (id)
  {
  case 'b':
    *n = (int)idata[idatacount].r;
    break;
  case 'i':
    *n = (int)idata[idatacount].r;
    break;
  case 'r':
    *n = idata[idatacount].r;
    break;
  case 'c':
    *c = idata[idatacount].s[0];
    break;
  case 's':
    strcpy(s, idata[idatacount].s);
    break;
  }
  ++idatacount;
  if (idatacount < useddata)
    error_(NotAllInputMsg, "3");
  else if (idatacount >= useddata)
    remove(errdat);
}

void GetB(bool *a)
{
  double r = 0;
  char c = '\0';
  char s[201] = {'\0'};
  get_('b', &r, &c, s);
  *a = ((int)r == 1);
}

void GetN(int *a)
{
  double r = 0;
  char c = '\0';
  char s[201] = {'\0'};
  get_('i', &r, &c, s);
  *a = (int)r;
}

void GetD(double *a)
{
  double r = 0;
  char c = '\0';
  char s[201] = {'\0'};
  get_('r', &r, &c, s);
  *a = r;
}

void GetC(char *a)
{
  double r = 0;
  char c = '\0';
  char s[201] = {'\0'};
  get_('c', &r, &c, s);
  *a = c;
}

void GetS(char *a)
{
  double r = 0;
  char c = '\0';
  char s[201] = {'\0'};
  get_('s', &r, &c, s);
  strcpy(a, s);
}

void SetPrecision(int n)
{
  if (abs(n) <= 16)
    prec = n;
}

void SetWidth(int n)
{
  if (n >= 0 && n <= 100)
    width = n;
}

void SetW(int n)
{
  if (n >= 0 && n <= 100)
    width1 = n;
}

void runloader_(const char *name)
{
  char s[200], ptpath[200];
   #ifdef __linux__
  FILE *f = fopen(".pt/ptpath.dat", "r");
  #endif
  #ifdef _WIN32
  FILE *f = fopen(".pt\\ptpath.dat", "r");
  #endif
  
  if (f == 0)
  {
    puts("LOADER ERROR: file .pt\\ptpath.dat not found");
    exit(3);
  }
  ptpath[0] = '\0';
  fgets(ptpath, 200, f);
  fclose(f);
  int len = strlen(ptpath);
  for (int i = len - 1; i >= 0; i--)
    if (ptpath[i] == '\n' || ptpath[i] == ' ')
      ptpath[i] = '\0';
  if (strlen(ptpath) == 0)
  {
    puts("LOADER ERROR: path to pt5run.exe not found");
    exit(3);
  }
  strcpy(s, ptpath);
  strcat(s, " ");
  strcat(s, name);
  #ifdef _WIN32
  strcat(s, " c -Eptprj.exe");
  #endif
   #ifdef __linux__
   strcat(s, " c -Eptprj");
   #endif
  system(s);
  exit(0);
}

void Task(const char *name)
{

  if (psize != -1)
    return;
    #ifdef __linux__
  FILE *f = fopen(".pt/pt5inf0.dat", "r");
  #endif
  #ifdef _WIN32
  FILE *f = fopen(".pt\\pt5inf0.dat", "r");
  #endif
  
  if (f == NULL)
  {
    runloader_(name);
  }
  else
  {
    int ver;
    fscanf(f, "%d", &ver);
    if (ver == 20)
    {
      fscanf(f, "%d", &psize);
      fscanf(f, "%d", &useddata);
      fclose(f);
      init_();
    }
    else
    {
      fclose(f);
      puts("ERROR: wrong version of Programming Taskbook");
    }
    
    #ifdef __linux__
  remove(".pt/pt5inf0.dat");
  #endif
  #ifdef _WIN32
  remove(".pt\\pt5inf0.dat");
  #endif
    
    
    
    
  }
}
