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
	//Hash Join
	string buffer[2];
	name_age temp0;
	name_salary temp1;
	fstream block[12];
	ofstream output;

	output.open("C:/Users/admin/Language/C_Lang/2022_DBMS_ASS2/ass2/case2/output2.csv");

	if(output.fail())
	{
		cout << "output file opening fail.\n";
	}


	/******************************************************************/
	//read csv files and do hash join
	output.close(); //hash join을 위해 output file을 닫는다.
	//there is 1000 csv files
	int openNum = 1;
	for(int i = 0; i < 1000; i++) {
		block[0].open("C:/Users/admin/Language/C_Lang/2022_DBMS_ASS2/ass2/case2/name_age/" + to_string(i) + ".csv");
		openNum++;
		if(block[0].fail())
		{
			cout << "file opening fail.\n";
		}
		for(int j = 0; j < 10; j++) {
			getline(block[0], buffer[0]);
			temp0.set_name_age(buffer[0]);
			buffer[1] = temp0.name.substr(0, 1);
			output.open("C:/Users/admin/Language/C_Lang/2022_DBMS_ASS2/ass2/buckets/" + buffer[1] + ".csv", ios::app);
			openNum++;
			output << temp0.name << ',' << temp0.age << '\n';
			output.close();
		}
		//cout << "first file " << i << " is done.\n";
		block[0].close();
	}
	for(int i = 0; i < 1000; i++) {
		block[0].open("C:/Users/admin/Language/C_Lang/2022_DBMS_ASS2/ass2/case2/name_salary/" + to_string(i) + ".csv");
		openNum++;
		if(block[0].fail())
		{
			cout << "file opening fail.\n";
		}
		for(int j = 0; j < 10; j++) {
			getline(block[0], buffer[0]);
			temp1.set_name_salary(buffer[0]);
			buffer[1] = temp1.name.substr(0, 1);
			output.open("C:/Users/admin/Language/C_Lang/2022_DBMS_ASS2/ass2/buckets/" + buffer[1] + buffer[1] + ".csv", ios::app);
			openNum++;
			output << temp1.name << ',' << temp1.salary << '\n';
			output.close();
		}
		//cout << "second file " << i << " is done.\n";
		block[0].close();
	}

	//hash join complete

	//sort buckets and do merge join on sorted buckets
	output.open("C:/Users/admin/Language/C_Lang/2022_DBMS_ASS2/ass2/case2/output2.csv");
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
		temp0.set_name_age(buffer[0]);
		block[1].open("C:/Users/admin/Language/C_Lang/2022_DBMS_ASS2/ass2/buckets/aa.csv");
		openNum++;
		if(block[1].fail())
		{
			cout << "second block file opening fail.\n";
		}
		while(true) {
			getline(block[1], buffer[1]);
			temp1.set_name_salary(buffer[1]);
			if(temp0.name == temp1.name) {
				output << make_tuple(temp0.name, temp0.age, temp1.salary);
				//cout << make_tuple(temp0.name, temp0.age, temp1.salary);
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
		temp0.set_name_age(buffer[0]);
		block[1].open("C:/Users/admin/Language/C_Lang/2022_DBMS_ASS2/ass2/buckets/bb.csv");
		openNum++;
		if(block[1].fail())
		{
			cout << "second block file opening fail.\n";
		}
		while(true) {
			getline(block[1], buffer[1]);
			temp1.set_name_salary(buffer[1]);
			if(temp0.name == temp1.name) {
				output << make_tuple(temp0.name, temp0.age, temp1.salary);
				//cout << make_tuple(temp0.name, temp0.age, temp1.salary);
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
		temp0.set_name_age(buffer[0]);
		block[1].open("C:/Users/admin/Language/C_Lang/2022_DBMS_ASS2/ass2/buckets/cc.csv");
		openNum++;
		if(block[1].fail())
		{
			cout << "second block file opening fail.\n";
		}
		while(true) {
			getline(block[1], buffer[1]);
			temp1.set_name_salary(buffer[1]);
			if(temp0.name == temp1.name) {
				output << make_tuple(temp0.name, temp0.age, temp1.salary);
				//cout << make_tuple(temp0.name, temp0.age, temp1.salary);
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
		temp0.set_name_age(buffer[0]);
		block[1].open("C:/Users/admin/Language/C_Lang/2022_DBMS_ASS2/ass2/buckets/dd.csv");
		openNum++;
		if(block[1].fail())
		{
			cout << "second block file opening fail.\n";
		}
		while(true) {
			getline(block[1], buffer[1]);
			temp1.set_name_salary(buffer[1]);
			if(temp0.name == temp1.name) {
				output << make_tuple(temp0.name, temp0.age, temp1.salary);
				//cout << make_tuple(temp0.name, temp0.age, temp1.salary);
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
		temp0.set_name_age(buffer[0]);
		block[1].open("C:/Users/admin/Language/C_Lang/2022_DBMS_ASS2/ass2/buckets/ee.csv");
		openNum++;
		if(block[1].fail())
		{
			cout << "second block file opening fail.\n";
		}
		while(true) {
			getline(block[1], buffer[1]);
			temp1.set_name_salary(buffer[1]);
			if(temp0.name == temp1.name) {
				output << make_tuple(temp0.name, temp0.age, temp1.salary);
				//cout << make_tuple(temp0.name, temp0.age, temp1.salary);
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
		temp0.set_name_age(buffer[0]);
		block[1].open("C:/Users/admin/Language/C_Lang/2022_DBMS_ASS2/ass2/buckets/ff.csv");
		openNum++;
		if(block[1].fail())
		{
			cout << "second block file opening fail.\n";
		}
		while(true) {
			getline(block[1], buffer[1]);
			temp1.set_name_salary(buffer[1]);
			if(temp0.name == temp1.name) {
				output << make_tuple(temp0.name, temp0.age, temp1.salary);
				//cout << make_tuple(temp0.name, temp0.age, temp1.salary);
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
		temp0.set_name_age(buffer[0]);
		block[1].open("C:/Users/admin/Language/C_Lang/2022_DBMS_ASS2/ass2/buckets/gg.csv");
		openNum++;
		if(block[1].fail())
		{
			cout << "second block file opening fail.\n";
		}
		while(true) {
			getline(block[1], buffer[1]);
			temp1.set_name_salary(buffer[1]);
			if(temp0.name == temp1.name) {
				output << make_tuple(temp0.name, temp0.age, temp1.salary);
				//cout << make_tuple(temp0.name, temp0.age, temp1.salary);
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
		temp0.set_name_age(buffer[0]);
		block[1].open("C:/Users/admin/Language/C_Lang/2022_DBMS_ASS2/ass2/buckets/hh.csv");
		openNum++;
		if(block[1].fail())
		{
			cout << "second block file opening fail.\n";
		}
		while(true) {
			getline(block[1], buffer[1]);
			temp1.set_name_salary(buffer[1]);
			if(temp0.name == temp1.name) {
				output << make_tuple(temp0.name, temp0.age, temp1.salary);
				//cout << make_tuple(temp0.name, temp0.age, temp1.salary);
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
		temp0.set_name_age(buffer[0]);
		block[1].open("C:/Users/admin/Language/C_Lang/2022_DBMS_ASS2/ass2/buckets/ii.csv");
		openNum++;
		if(block[1].fail())
		{
			cout << "second block file opening fail.\n";
		}
		while(true) {
			getline(block[1], buffer[1]);
			temp1.set_name_salary(buffer[1]);
			if(temp0.name == temp1.name) {
				output << make_tuple(temp0.name, temp0.age, temp1.salary);
				//cout << make_tuple(temp0.name, temp0.age, temp1.salary);
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
		temp0.set_name_age(buffer[0]);
		block[1].open("C:/Users/admin/Language/C_Lang/2022_DBMS_ASS2/ass2/buckets/jj.csv");
		openNum++;
		if(block[1].fail())
		{
			cout << "second block file opening fail.\n";
		}
		while(true) {
			getline(block[1], buffer[1]);
			temp1.set_name_salary(buffer[1]);
			if(temp0.name == temp1.name) {
				output << make_tuple(temp0.name, temp0.age, temp1.salary);
				//cout << make_tuple(temp0.name, temp0.age, temp1.salary);
				block[1].close();
				break;
			}
		}
	}
	block[0].close();
	//cout << "Open: " << openNum << endl;
	/******************************************************************/

	output.close();

	
}
