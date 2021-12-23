import 'package:flutter/material.dart';

/// helpful text info from cool climate site: https://coolclimate.berkeley.edu/calculator
const HOUSE_HOLD_PEOPLE_INFO =
    'Enter the total number of adults and children in your household. If you only want to calculate your personal carbon footprint, then select 1 Person and enter your personal consumption in the calculator, such as just your share of energy bills or driving.';
const HOUSE_HOLD_INCOME_INFO =
    'Entering income helps the calculator provide appropriate default values and a comparison to similar households. This information is private even for users that share their profile publicly.';
const HOUSE_HOLD_QUESTION = 'How many people live in your household?';
const HOUSE_HOLD_INCOME = 'What is your gross annual household income?';
const ELECTRICITY_INFO_TEXT =
    'To calculate your total electricity usage or costs, review your monthly electricity bills. Each bill will tell you how many kilowatt hours you have used in the month at what cost.';
const HEATING_INFO_TEXT =
    'To calculate your total annual usage or cost of heating oil or other fuels to heat your home, review your monthly bills for heating oil or other home heating fuels. Each bill will tell you how many litres of oil were delivered to you each month at what cost.';
const NATURAL_INFO_TEXT =
    'To calculate your total annual natural gas usage or costs, review your monthly utility bills. Each bill will tell you how many cubic metres you have used in the month at what cost.';
const LIVING_SPACE_INFO_TEXT =
    'For a house, measure the length of a house and multiply it by the width of the house. If you have two stories, multiply by two. For an apartment or condo, first determine the area of each room by multiplying the length and width of each room. Add up the total area measurements for each room. This will give you the total area of your living space, all rooms combined.';
const WATER_USAGE_INFO_TEXT = '''
Average household water consumption: 242 liters/ day
1-person household: 148 liters/day
2-person household: 242 liters/day
3-person household: 261 liters/day
4-person household: 299 literes/day
5-person household: 337 liters/day
''';

const PUBLIC_TRANSIT_HELP_TEXT =
    '''Enter How much Kilo meter or Mile You think You have travelled OR click on advance and enter type of transit you have taken per year or per month
    ''';

const AIR_TRANSIT_HELP_TEXT =
    '''Enter How much Kilo meter or Mile you You have travelled on plane OR click on advance and enter number of flights you have taken per year or per month

     ''';
const FOOD_HELP_TEXT = '''
Enter the daily diet of the average person in your household. For example, if three people eat a total of six servings per day, enter 2 servings per person (6 ÷ 3 = 2)

Find more help calculating your servings
''';

const GOODS_HELP_TEXT =
    """simply adjust total monthly spending based on your best guess estimate Or Click on Advance tab and enter how much you spent on each of the following item 
    Enter '0' for the ones you didn't spend money on it""";
const FOOD_INFO_URL =
    'https://www.heart.org/en/healthy-living/healthy-eating/eat-smart/nutrition-basics/suggested-servings-from-each-food-group#.WlvTPZM-dE4';

final bucketStorage = PageStorageBucket();
