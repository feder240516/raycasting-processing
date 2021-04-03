class Pair<T1,T2>{
  T1 first;
  T2 second;
  Pair(T1 first, T2 second){
    this.first = first;
    this.second = second;
  }
}

class Tuple<T1,T2,T3>{
  T1 first;
  T2 second;
  T3 third;
  Tuple(T1 first, T2 second, T3 third){
    this.first = first;
    this.second = second;
    this.third = third;
  }
}

class Color {
  int r,g,b;
  Color(int r, int g, int b){
    this.r = r;
    this.g = g;
    this.b = b;
  }
}

/*

class DoubleOrInf{
  public boolean isInf;
  public float value;
  
  DoubleOrInf(){
    this.value = 0;
    this.isInf = true;
  }
  
  DoubleOrInf(float value){
    this.value = value;
    this.isInf = false;
    
    
  }
  
  boolean equalTo(DoubleOrInf o){
    if (this.isInf ^ o.isInf) return false;
    if (this.isInf && o.isInf) return true;
    if (abs(this.value - o.value) <= 1e-12) return true;
    return false;
  }
}

*/
