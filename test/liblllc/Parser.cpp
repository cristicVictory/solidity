/*
    This file is part of cpp-ethereum.

    cpp-ethereum is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    cpp-ethereum is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with cpp-ethereum.  If not, see <http://www.gnu.org/licenses/>.
*/
/**
 * @author Alex Beregszaszi
 * @date 2016
 * Unit tests for the LLL parser.
 */

#include <string>
#include <memory>
#include <liblll/Compiler.h>

using namespace std;

namespace dev
{
namespace lll
{
namespace test
{

namespace
{

bool successParse(std::string const& _source)
{
	std::string ret = eth::parseLLL(_source);
	return ret.size() != 0;
}

std::string parse(std::string const& _source)
{
	return eth::parseLLL(_source);
}

}

BOOST_AUTO_TEST_SUITE(LLLParser)

BOOST_AUTO_TEST_CASE(smoke_test)
{
	char const* text = "1";
	BOOST_CHECK(successParse(text));
}

BOOST_AUTO_TEST_CASE(def)
{
	char const* text = "(def 'i 0x80)";
	BOOST_CHECK(successParse(text));
	BOOST_EQUAL(parse(text), R("( def "i" 128 )"));
}

BOOST_AUTO_TEST_SUITE_END()

}
}
} // end namespaces
