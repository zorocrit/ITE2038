if(block[0].eof()) {
			block[0].open("C:/Users/admin/Language/C_Lang/2022_DBMS_ASS2/ass2/case1/name_age/" + to_string(a) + ".csv");
			if(block[0].fail()) {
				cout << "block" << a << " file opening fail.\n";
			}
			cout << "first block " << a << " file opening success.\n";
			a++;
		}
		if(block[1].eof()) {
			block[1].open("C:/Users/admin/Language/C_Lang/2022_DBMS_ASS2/ass2/case1/name_salary/" + to_string(b) + ".csv");
			if(block[1].fail()) {
				cout << "block" << b << " file opening fail.\n";
			}
			cout << "second block " << b << " file opening success.\n";
			b++;
		}