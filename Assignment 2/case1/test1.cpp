#include <bits/stdc++.h>
using namespace std;

class name_age {
	public:
		string name;
		string age;
		
		void set_name_age(string tuple)
		{
			stringstream tuplestr(tuple);
			string agestr;

			getline(tuplestr, name, ',');
			getline(tuplestr, age);
		}
};

class name_salary {
	public:
		string name;
		string salary;
		
		void set_name_salary(string tuple)
		{
			stringstream tuplestr(tuple);
			string salarystr;

			getline(tuplestr, name, ',');
			getline(tuplestr, salary);
		}
};

string make_tuple(string name, string age, string salary)
{
	return name+ ',' + age + ',' + salary + '\n';
}

int main(){
	//Merge Join
	string buffer[2];
	name_age temp0;
	name_salary temp1;
	int current_block[2] = {}; //Don't Use //Hint //Merge Join 할 때 Pointer의 파일 공간
	fstream block[12]; //입력값을 받을 파일들
	ofstream output;

	output.open("C:/Users/admin/Language/C_Lang/2022_DBMS_ASS2/ass2/case1/output1.csv");

	if(output.fail())
	{
		cout << "output file opening fail.\n";
	}

	/*********************************************************************************/
	int openNum = 1;
	//read csv files and do merge join
	while(true) {
		//there is 1000 csv files
		
		block[0].open("C:/Users/admin/Language/C_Lang/2022_DBMS_ASS2/ass2/case1/name_age/" + to_string(current_block[0]) + ".csv");
		block[1].open("C:/Users/admin/Language/C_Lang/2022_DBMS_ASS2/ass2/case1/name_salary/" + to_string(current_block[1]) + ".csv");
		openNum += 2;
		if(block[0].fail() || block[1].fail())
		{
			cout << "block file opening fail.\n";
		}
		
		//cout << "current_block[0] : " << current_block[0] << endl;
		//cout << "current_block[1] : " << current_block[1] << endl;
		current_block[0]++;
		current_block[1]++;


		for(int i = 0; i < 2; i++) {
			getline(block[i], buffer[i]);
		}

		//cout << "check1" << endl;

		while(!block[0].eof() && !block[1].eof()) {
			temp0.set_name_age(buffer[0]);
			temp1.set_name_salary(buffer[1]);
			//cout << "check2" << endl;
			if(temp0.name == temp1.name) {
				output << make_tuple(temp0.name, temp0.age, temp1.salary);
				//cout << temp0.name << " " << temp0.age << " " << temp1.salary << endl;
				getline(block[1], buffer[1]);
				//cout << "a : " << a << endl;
				//a++;
			}
			else if(temp0.name < temp1.name) {
				getline(block[0], buffer[0]);
				//cout << "check3" << endl;
			}
			else {
				getline(block[1], buffer[1]);
				//cout << "check4" << endl;
			}
		}
		//cout << "check5" << endl;
		block[0].close();
		block[1].close();
		//cout << "check6" << endl;

		if(current_block[0] >= 1000 && current_block[1] >= 1000) {
			break;
		}
	}
	//cout << "Open: " << openNum << endl;
	/*********************************************************************************/

	output.close();
}
