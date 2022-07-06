type C  client object {
    function x() returns client object {
         function y() returns string;
    } | client object {
         function y() returns string;
    };
 };

public function main() {
   C c;
  string s = c.x().y(); 
}
