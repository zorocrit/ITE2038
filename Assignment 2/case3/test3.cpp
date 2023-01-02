#include <bits/stdc++.h>
using namespace std;

class name_grade {
	public:
		string student_name;
		int korean;
		int math;
		int english;
		int science;
		int social;
		int history;

		void set_grade(string tuple)
		{
			stringstream tuplestr(tuple);
			string tempstr;

			getline(tuplestr, student_name, ',');

			getline(tuplestr, tempstr, ',');
			korean = stoi(tempstr);
			
			getline(tuplestr, tempstr, ',');
			math = stoi(tempstr);
			
			getline(tuplestr, tempstr, ',');
			english = stoi(tempstr);
			
			getline(tuplestr, tempstr, ',');
			science = stoi(tempstr);
			
			getline(tuplestr, tempstr, ',');
			social = stoi(tempstr);
			
			getline(tuplestr, tempstr);
			history = stoi(tempstr);
		}
};

class name_number{
	public :
		string student_name;
		string student_number;

		void set_number(string tuple)
		{
			stringstream tuplestr(tuple);
			string tempstr;


			getline(tuplestr, student_name, ',');
			getline(tuplestr, student_number, ',');
		}
};

string make_tuple(string name, string number)
{
	string ret = "";

	ret += name+ "," + number +"\n";

	return ret;
}

int main(){
	//Hash Join //Think more
	string buffer[2];
	name_grade temp0;
	name_grade temp1;
	name_number temp2;
	fstream block[12];
	ofstream output;

	output.open("./output3.csv");

	if(output.fail())
	{
		cout << "output file opening fail.\n";
	}

	/*********************************************************************/
	int total = 0;
	int openNum = 1;
	output.close();
	//there is 1000 csv files
	for(int i = 0; i < 1000; i++) {
		block[0].open("C:/Users/admin/Language/C_Lang/2022_DBMS_ASS2/ass2/case3/name_grade1/" + to_string(i) + ".csv");
		openNum++;
		if(block[0].fail())
		{
			cout << "file opening fail.\n";
		}
		for(int j = 0; j < 10; j++) {
			getline(block[0], buffer[0]);
			temp0.set_grade(buffer[0]);
			buffer[1] = temp0.student_name.substr(0, 1);
			output.open("C:/Users/admin/Language/C_Lang/2022_DBMS_ASS2/ass2/buckets/" + buffer[1] + ".csv", ios::app);
			openNum++;
			output << buffer[0] << "\n";
			output.close();
		}
		
		block[0].close();
	}
	//cout << "first file is done.\n";
	for(int i = 0; i < 1000; i++) {
		block[0].open("C:/Users/admin/Language/C_Lang/2022_DBMS_ASS2/ass2/case3/name_grade2/" + to_string(i) + ".csv");
		openNum++;
		if(block[0].fail())
		{
			cout << "file opening fail.\n";
		}
		for(int j = 0; j < 10; j++) {
			getline(block[0], buffer[0]);
			temp0.set_grade(buffer[0]);
			buffer[1] = temp0.student_name.substr(0, 1);
			output.open("C:/Users/admin/Language/C_Lang/2022_DBMS_ASS2/ass2/buckets/" + buffer[1] + buffer[1] + ".csv", ios::app);
			openNum++;
			output << buffer[0] << "\n";
			output.close();
		}
		block[0].close();
	}
	//cout << "second file is done.\n";
	output.open("C:/Users/admin/Language/C_Lang/2022_DBMS_ASS2/ass2/buckets/temp.csv");
	openNum++;
	//a.csv
	block[0].open("C:/Users/admin/Language/C_Lang/2022_DBMS_ASS2/ass2/buckets/a.csv");
	openNum++;
	if(block[0].fail())
	{
		cout << "first block file opening fail.\n";
	}
	for(int i = 0; i < 1000; i++) {
		getline(block[0], buffer[0]);
		temp0.set_grade(buffer[0]);
		block[1].open("C:/Users/admin/Language/C_Lang/2022_DBMS_ASS2/ass2/buckets/aa.csv");
		openNum++;
		if(block[1].fail())
		{
			cout << "second block file opening fail.\n";
		}
		while(true) {
			getline(block[1], buffer[1]);
			temp1.set_grade(buffer[1]);
			if(temp0.student_name == temp1.student_name) {
				int check = 0;
				if(temp0.korean > temp1.korean) check++;
				if(temp0.math > temp1.math) check++;
				if(temp0.english > temp1.english) check++;
				if(temp0.science > temp1.science) check++;
				if(temp0.social > temp1.social) check++;
				if(temp0.history > temp1.history) check++;
				if(check >= 2) {
					output << buffer[0] << "\n";
					total++;
					//cout << buffer[0] << "\n";
				}
				block[1].close();
				break;
			}
		}
	}
	block[0].close();

	//b.csv
	block[0].open("C:/Users/admin/Language/C_Lang/2022_DBMS_ASS2/ass2/buckets/b.csv");
	openNum++;
	if(block[0].fail())
	{
		cout << "first block file opening fail.\n";
	}
	for(int i = 0; i < 1000; i++) {
		getline(block[0], buffer[0]);
		temp0.set_grade(buffer[0]);
		block[1].open("C:/Users/admin/Language/C_Lang/2022_DBMS_ASS2/ass2/buckets/bb.csv");
		openNum++;
		if(block[1].fail())
		{
			cout << "second block file opening fail.\n";
		}
		while(true) {
			getline(block[1], buffer[1]);
			temp1.set_grade(buffer[1]);
			if(temp0.student_name == temp1.student_name) {
				int check = 0;
				if(temp0.korean > temp1.korean) check++;
				if(temp0.math > temp1.math) check++;
				if(temp0.english > temp1.english) check++;
				if(temp0.science > temp1.science) check++;
				if(temp0.social > temp1.social) check++;
				if(temp0.history > temp1.history) check++;
				if(check >= 2) {
					total++;
					output << buffer[0] << "\n";
					//cout << buffer[0] << "\n";
				}
				block[1].close();
				break;
			}
		}
	}
	block[0].close();

	//c.csv
	block[0].open("C:/Users/admin/Language/C_Lang/2022_DBMS_ASS2/ass2/buckets/c.csv");
	openNum++;
	if(block[0].fail())
	{
		cout << "first block file opening fail.\n";
	}
	for(int i = 0; i < 1000; i++) {
		getline(block[0], buffer[0]);
		temp0.set_grade(buffer[0]);
		block[1].open("C:/Users/admin/Language/C_Lang/2022_DBMS_ASS2/ass2/buckets/cc.csv");
		openNum++;
		if(block[1].fail())
		{
			cout << "second block file opening fail.\n";
		}
		while(true) {
			getline(block[1], buffer[1]);
			temp1.set_grade(buffer[1]);
			if(temp0.student_name == temp1.student_name) {
				int check = 0;
				if(temp0.korean > temp1.korean) check++;
				if(temp0.math > temp1.math) check++;
				if(temp0.english > temp1.english) check++;
				if(temp0.science > temp1.science) check++;
				if(temp0.social > temp1.social) check++;
				if(temp0.history > temp1.history) check++;
				if(check >= 2) {
					total++;
					output << buffer[0] << "\n";
					//cout << buffer[0] << "\n";
				}
				block[1].close();
				break;
			}
		}
	}
	block[0].close();

	//d.csv
	block[0].open("C:/Users/admin/Language/C_Lang/2022_DBMS_ASS2/ass2/buckets/d.csv");
	openNum++;
	if(block[0].fail())
	{
		cout << "first block file opening fail.\n";
	}
	for(int i = 0; i < 1000; i++) {
		getline(block[0], buffer[0]);
		temp0.set_grade(buffer[0]);
		block[1].open("C:/Users/admin/Language/C_Lang/2022_DBMS_ASS2/ass2/buckets/dd.csv");
		openNum++;
		if(block[1].fail())
		{
			cout << "second block file opening fail.\n";
		}
		while(true) {
			getline(block[1], buffer[1]);
			temp1.set_grade(buffer[1]);
			if(temp0.student_name == temp1.student_name) {
				int check = 0;
				if(temp0.korean > temp1.korean) check++;
				if(temp0.math > temp1.math) check++;
				if(temp0.english > temp1.english) check++;
				if(temp0.science > temp1.science) check++;
				if(temp0.social > temp1.social) check++;
				if(temp0.history > temp1.history) check++;
				if(check >= 2) {
					total++;
					output << buffer[0] << "\n";
					//cout << buffer[0] << "\n";
				}
				block[1].close();
				break;
			}
		}
	}
	block[0].close();

	//e.csv
	block[0].open("C:/Users/admin/Language/C_Lang/2022_DBMS_ASS2/ass2/buckets/e.csv");
	openNum++;
	if(block[0].fail())
	{
		cout << "first block file opening fail.\n";
	}
	for(int i = 0; i < 1000; i++) {
		getline(block[0], buffer[0]);
		temp0.set_grade(buffer[0]);
		block[1].open("C:/Users/admin/Language/C_Lang/2022_DBMS_ASS2/ass2/buckets/ee.csv");
		openNum++;
		if(block[1].fail())
		{
			cout << "second block file opening fail.\n";
		}
		while(true) {
			getline(block[1], buffer[1]);
			temp1.set_grade(buffer[1]);
			if(temp0.student_name == temp1.student_name) {
				int check = 0;
				if(temp0.korean > temp1.korean) check++;
				if(temp0.math > temp1.math) check++;
				if(temp0.english > temp1.english) check++;
				if(temp0.science > temp1.science) check++;
				if(temp0.social > temp1.social) check++;
				if(temp0.history > temp1.history) check++;
				if(check >= 2) {
					total++;
					output << buffer[0] << "\n";
					//cout << buffer[0] << "\n";
				}
				block[1].close();
				break;
			}
		}
	}
	block[0].close();

	//f.csv
	block[0].open("C:/Users/admin/Language/C_Lang/2022_DBMS_ASS2/ass2/buckets/f.csv");
	openNum++;
	if(block[0].fail())
	{
		cout << "first block file opening fail.\n";
	}
	for(int i = 0; i < 1000; i++) {
		getline(block[0], buffer[0]);
		temp0.set_grade(buffer[0]);
		block[1].open("C:/Users/admin/Language/C_Lang/2022_DBMS_ASS2/ass2/buckets/ff.csv");
		openNum++;
		if(block[1].fail())
		{
			cout << "second block file opening fail.\n";
		}
		while(true) {
			getline(block[1], buffer[1]);
			temp1.set_grade(buffer[1]);
			if(temp0.student_name == temp1.student_name) {
				int check = 0;
				if(temp0.korean > temp1.korean) check++;
				if(temp0.math > temp1.math) check++;
				if(temp0.english > temp1.english) check++;
				if(temp0.science > temp1.science) check++;
				if(temp0.social > temp1.social) check++;
				if(temp0.history > temp1.history) check++;
				if(check >= 2) {
					total++;
					output << buffer[0] << "\n";
					//cout << buffer[0] << "\n";
				}
				block[1].close();
				break;
			}
		}
	}
	block[0].close();

	//g.csv
	block[0].open("C:/Users/admin/Language/C_Lang/2022_DBMS_ASS2/ass2/buckets/g.csv");
	openNum++;
	if(block[0].fail())
	{
		cout << "first block file opening fail.\n";
	}
	for(int i = 0; i < 1000; i++) {
		getline(block[0], buffer[0]);
		temp0.set_grade(buffer[0]);
		block[1].open("C:/Users/admin/Language/C_Lang/2022_DBMS_ASS2/ass2/buckets/gg.csv");
		openNum++;
		if(block[1].fail())
		{
			cout << "second block file opening fail.\n";
		}
		while(true) {
			getline(block[1], buffer[1]);
			temp1.set_grade(buffer[1]);
			if(temp0.student_name == temp1.student_name) {
				int check = 0;
				if(temp0.korean > temp1.korean) check++;
				if(temp0.math > temp1.math) check++;
				if(temp0.english > temp1.english) check++;
				if(temp0.science > temp1.science) check++;
				if(temp0.social > temp1.social) check++;
				if(temp0.history > temp1.history) check++;
				if(check >= 2) {
					total++;
					output << buffer[0] << "\n";
					//cout << buffer[0] << "\n";
				}
				block[1].close();
				break;
			}
		}
	}
	block[0].close();

	//h.csv
	block[0].open("C:/Users/admin/Language/C_Lang/2022_DBMS_ASS2/ass2/buckets/h.csv");
	openNum++;
	if(block[0].fail())
	{
		cout << "first block file opening fail.\n";
	}
	for(int i = 0; i < 1000; i++) {
		getline(block[0], buffer[0]);
		temp0.set_grade(buffer[0]);
		block[1].open("C:/Users/admin/Language/C_Lang/2022_DBMS_ASS2/ass2/buckets/hh.csv");
		openNum++;
		if(block[1].fail())
		{
			cout << "second block file opening fail.\n";
		}
		while(true) {
			getline(block[1], buffer[1]);
			temp1.set_grade(buffer[1]);
			if(temp0.student_name == temp1.student_name) {
				int check = 0;
				if(temp0.korean > temp1.korean) check++;
				if(temp0.math > temp1.math) check++;
				if(temp0.english > temp1.english) check++;
				if(temp0.science > temp1.science) check++;
				if(temp0.social > temp1.social) check++;
				if(temp0.history > temp1.history) check++;
				if(check >= 2) {
					total++;
					output << buffer[0] << "\n";
					//cout << buffer[0] << "\n";
				}
				block[1].close();
				break;
			}
		}
	}
	block[0].close();

	//i.csv
	block[0].open("C:/Users/admin/Language/C_Lang/2022_DBMS_ASS2/ass2/buckets/i.csv");
	openNum++;
	if(block[0].fail())
	{
		cout << "first block file opening fail.\n";
	}
	for(int i = 0; i < 1000; i++) {
		getline(block[0], buffer[0]);
		temp0.set_grade(buffer[0]);
		block[1].open("C:/Users/admin/Language/C_Lang/2022_DBMS_ASS2/ass2/buckets/ii.csv");
		openNum++;
		if(block[1].fail())
		{
			cout << "second block file opening fail.\n";
		}
		while(true) {
			getline(block[1], buffer[1]);
			temp1.set_grade(buffer[1]);
			if(temp0.student_name == temp1.student_name) {
				int check = 0;
				if(temp0.korean > temp1.korean) check++;
				if(temp0.math > temp1.math) check++;
				if(temp0.english > temp1.english) check++;
				if(temp0.science > temp1.science) check++;
				if(temp0.social > temp1.social) check++;
				if(temp0.history > temp1.history) check++;
				if(check >= 2) {
					total++;
					output << buffer[0] << "\n";
					//cout << buffer[0] << "\n";
				}
				block[1].close();
				break;
			}
		}
	}
	block[0].close();

	//j.csv
	block[0].open("C:/Users/admin/Language/C_Lang/2022_DBMS_ASS2/ass2/buckets/j.csv");
	openNum++;
	if(block[0].fail())
	{
		cout << "first block file opening fail.\n";
	}
	for(int i = 0; i < 1000; i++) {
		getline(block[0], buffer[0]);
		temp0.set_grade(buffer[0]);
		block[1].open("C:/Users/admin/Language/C_Lang/2022_DBMS_ASS2/ass2/buckets/jj.csv");
		openNum++;
		if(block[1].fail())
		{
			cout << "second block file opening fail.\n";
		}
		while(true) {
			getline(block[1], buffer[1]);
			temp1.set_grade(buffer[1]);
			if(temp0.student_name == temp1.student_name) {
				int check = 0;
				if(temp0.korean > temp1.korean) check++;
				if(temp0.math > temp1.math) check++;
				if(temp0.english > temp1.english) check++;
				if(temp0.science > temp1.science) check++;
				if(temp0.social > temp1.social) check++;
				if(temp0.history > temp1.history) check++;
				if(check >= 2) {
					total++;
					output << buffer[0] << "\n";
					//cout << buffer[0] << "\n";
				}
				block[1].close();
				break;
			}
		}
	}
	//cout << "total : " << total << "\n";
	block[0].close();

	// write codes here.

	output.close();

	//output.open("C:/Users/admin/Language/C_Lang/2022_DBMS_ASS2/ass2/case3/output3.csv");
	/*if(output.fail())
	{
		cout << "output file opening fail.\n";
	}*/
	for(int i = 0; i < 1000; i++) {
		block[0].open("C:/Users/admin/Language/C_Lang/2022_DBMS_ASS2/ass2/case3/name_number/" + to_string(i) + ".csv");
		openNum++;
		if(block[0].fail())
		{
			cout << "file opening fail.\n";
		}
		for(int j = 0; j < 10; j++) {
			getline(block[0], buffer[0]);
			temp2.set_number(buffer[0]);
			buffer[1] = temp2.student_name.substr(0, 1);
			if(buffer[1] == "a") {
				output.open("C:/Users/admin/Language/C_Lang/2022_DBMS_ASS2/ass2/buckets/1.csv", ios::app);
				openNum++;
				output << temp2.student_name << ',' << temp2.student_number << '\n';
				output.close();
			}
			else if(buffer[1] == "b") {
				output.open("C:/Users/admin/Language/C_Lang/2022_DBMS_ASS2/ass2/buckets/2.csv", ios::app);
				openNum++;
				output << temp2.student_name << ',' << temp2.student_number << '\n';
				output.close();
			}
			else if(buffer[1] == "c") {
				output.open("C:/Users/admin/Language/C_Lang/2022_DBMS_ASS2/ass2/buckets/3.csv", ios::app);
				openNum++;
				output << temp2.student_name << ',' << temp2.student_number << '\n';
				output.close();
			}
			else if(buffer[1] == "d") {
				output.open("C:/Users/admin/Language/C_Lang/2022_DBMS_ASS2/ass2/buckets/4.csv", ios::app);
				openNum++;
				output << temp2.student_name << ',' << temp2.student_number << '\n';
				output.close();
			}
			else if(buffer[1] == "e") {
				output.open("C:/Users/admin/Language/C_Lang/2022_DBMS_ASS2/ass2/buckets/5.csv", ios::app);
				openNum++;
				output << temp2.student_name << ',' << temp2.student_number << '\n';
				output.close();
			}
			else if(buffer[1] == "f") {
				output.open("C:/Users/admin/Language/C_Lang/2022_DBMS_ASS2/ass2/buckets/6.csv", ios::app);
				openNum++;
				output << temp2.student_name << ',' << temp2.student_number << '\n';
				output.close();
			}
			else if(buffer[1] == "g") {
				output.open("C:/Users/admin/Language/C_Lang/2022_DBMS_ASS2/ass2/buckets/7.csv", ios::app);
				openNum++;
				output << temp2.student_name << ',' << temp2.student_number << '\n';
				output.close();
			}
			else if(buffer[1] == "h") {
				output.open("C:/Users/admin/Language/C_Lang/2022_DBMS_ASS2/ass2/buckets/8.csv", ios::app);
				openNum++;
				output << temp2.student_name << ',' << temp2.student_number << '\n';
				output.close();
			}
			else if(buffer[1] == "i") {
				output.open("C:/Users/admin/Language/C_Lang/2022_DBMS_ASS2/ass2/buckets/9.csv", ios::app);
				openNum++;
				output << temp2.student_name << ',' << temp2.student_number << '\n';
				output.close();
			}
			else if(buffer[1] == "j") {
				output.open("C:/Users/admin/Language/C_Lang/2022_DBMS_ASS2/ass2/buckets/10.csv", ios::app);
				openNum++;
				output << temp2.student_name << ',' << temp2.student_number << '\n';
				output.close();
			}
		}
		//cout << "first file " << i << " is done.\n";
		block[0].close();
	}

	output.open("C:/Users/admin/Language/C_Lang/2022_DBMS_ASS2/ass2/case3/output3.csv");
	openNum++;
	if(output.fail())
	{
		cout << "output file opening fail.\n";
	}
	//join temp.csv and name_number.csv

	for(int i = 1; i <= 10; i++) {
		block[0].open("C:/Users/admin/Language/C_Lang/2022_DBMS_ASS2/ass2/buckets/" + to_string(i) + ".csv");
		openNum++;
		if(block[0].fail())
		{
			cout << "first file opening fail.\n";
		}
		for(int j = 0; j < 1000; j++) {
			getline(block[0], buffer[0]);
			temp2.set_number(buffer[0]);
			block[1].open("C:/Users/admin/Language/C_Lang/2022_DBMS_ASS2/ass2/buckets/temp.csv");
			openNum++;
			if(block[1].fail())
			{
				cout << "second file opening fail.\n";
			}
			for(int k = 0; k < total; k++) {
				getline(block[1], buffer[1]);
				temp0.set_grade(buffer[1]);
				//buffer[1] = student_name
				if(temp0.student_name == temp2.student_name) {
					output << temp2.student_name << ',' << temp2.student_number << '\n';
					//cout << temp2.student_name << ',' << temp2.student_number << '\n';
					break;
				}
			}
			block[1].close();
		}
	
	block[0].close();
	}
	/*
//new
	block[1].open("C:/Users/admin/Language/C_Lang/2022_DBMS_ASS2/ass2/buckets/temp.csv");
	openNum++;
	if(block[1].fail())
	{
		cout << "first file opening fail.\n";
	}

	for(int i = 0; i < total; i++) {
		getline(block[1], buffer[1]);
		temp0.set_grade(buffer[1]);
		buffer[0] = temp0.student_name.substr(0, 1);
		if(buffer[0] == "a") {
			block[0].close();
			block[0].open("C:/Users/admin/Language/C_Lang/2022_DBMS_ASS2/ass2/buckets/1.csv", ios::app);
			openNum++;
			if(block[0].fail())
		{
			cout << "second file opening fail.\n";
		}
			for(int k = 0; k < 1000; k++) {
				getline(block[0], buffer[0]);
				temp2.set_number(buffer[0]);
				if(temp0.student_name == temp2.student_name) {
					output << temp2.student_name << ',' << temp2.student_number << '\n';
					cout << temp2.student_name << ',' << temp2.student_number << '\n';
					
					break;
				}
			}
		}
	}*/

	//cout << "Open: " << openNum << endl;







	/*********************************************************************/


	output.close();

	
}
