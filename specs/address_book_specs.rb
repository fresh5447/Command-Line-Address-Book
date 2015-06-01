RSpec.describe AddressBook do

	let(:book) { AddressBook.new }

	context "attributes" do

		it "should respond to entries" do
			expect(book).to respond_to(:entries)
		end

		it "should initialize entries as an array" do
			expect(book.entries).to be_a(Array)
		end

		it "should initialize entries as empty" do
			expect(book.entries.size).eql? 0
		end

	end

	context ".add_entry" do

		it "adds only one entry to the address book" do
			book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')

			expect(book.entries.size).eql? 1
		end

		it "adds the correct information to entries" do
			book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
			new_entry = book.entries[0]

			expect(new_entry.name).eql? 'Ada Lovelace'
			expect(new_entry.phone_number).eql? '010.012.1815'
			expect(new_entry.email).eql? 'augusta.king@lovelace.com'
		end

	end


	describe ".import_from_csv" do

		it "imports the correct number of entries" do

			book.import_from_csv("entries.csv")
			book_size = book.entries.size

			expect(book_size).to eql 5
		end

		it "checks the details of the first entry" do
			
			book.import_from_csv("entries.csv")

			entry_one = book.entries[0]

			expect(entry_one.name).to eql "Bill"
			expect(entry_one.phone_number).to eql "555-555-5555"
			expect(entry_one.email).to eql "bill@blocmail.com"

		end

		it "checks the details of the second entry" do
			
			book.import_from_csv("entries.csv")

			entry_two = book.entries[1]

			expect(entry_two.name).to eql "Bob"
			expect(entry_two.phone_number).to eql "555-555-5555"
			expect(entry_two.email).to eql "bob@blocmail.com"

		end

		it "checks the details of the third entry" do
			
			book.import_from_csv("entries.csv")

			entry_three = book.entries[2]

			expect(entry_three.name).to eql "Joe"
			expect(entry_three.phone_number).to eql "555-555-5555"
			expect(entry_three.email).to eql "joe@blocmail.com"

		end

		it "checks the details of the first entry" do
			
			book.import_from_csv("entries.csv")

			entry_four = book.entries[3]

			expect(entry_four.name).to eql "Sally"
			expect(entry_four.phone_number).to eql "555-555-5555"
			expect(entry_four.email).to eql "sally@blocmail.com"

		end

		it "checks the details of the first entry" do
			
			book.import_from_csv("entries.csv")

			entry_five = book.entries[4]

			expect(entry_five.name).to eql "Sussie"
			expect(entry_five.phone_number).to eql "555-555-5555"
			expect(entry_five.email).to eql "sussie@blocmail.com"

		end

	end

	describe ".binary_search" do
		
		it "searches AddressBook for a non-existent entry" do
			book.import_from_csv("entries.csv")
			entry = book.binary_search("Dan")
			expect(entry).to be_nil
		end

		it "searches AddressBook for Bill" do
			book.import_from_csv("entries.csv")
			entry = book.binary_search("Bill")

			expect entry.instance_of?(Entry)
			expect(entry.name).to eql "Bill"
			expect(entry.phone_number).to eql "555-555-5555"
			expect(entry.email).to eql "bill@blocmail.com"
		end

		it "searches AddressBook for Bob" do
			book.import_from_csv("entries.csv")
			entry = book.binary_search("Bob")
			
			expect entry.instance_of?(Entry)
			expect(entry.name).to eql "Bob"
			expect(entry.phone_number).to eql "555-555-5555"
			expect(entry.email).to eql "bob@blocmail.com"
		end

		it "searches AddressBook for Joe" do
			book.import_from_csv("entries.csv")
			entry = book.binary_search("Joe")
			
			expect entry.instance_of?(Entry)
			expect(entry.name).to eql "Joe"
			expect(entry.phone_number).to eql "555-555-5555"
			expect(entry.email).to eql "joe@blocmail.com"
		end

		it "searches AddressBook for Sally" do
			book.import_from_csv("entries.csv")
			entry = book.binary_search("Sally")
			
			expect entry.instance_of?(Entry)
			expect(entry.name).to eql "Sally"
			expect(entry.phone_number).to eql "555-555-5555"
			expect(entry.email).to eql "sally@blocmail.com"
		end

		it "searches AddressBook for Sussie" do
			book.import_from_csv("entries.csv")
			entry = book.binary_search("Sussie")
			
			expect entry.instance_of?(Entry)
			expect(entry.name).to eql "Sussie"
			expect(entry.phone_number).to eql "555-555-5555"
			expect(entry.email).to eql "sussie@blocmail.com"
		end

		it "searches AddressBook for Billy" do
			book.import_from_csv("entries.csv")
			entry = book.binary_search("Billy")
			expect(entry).to be_nil
		end

	end

end