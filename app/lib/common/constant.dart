import 'package:flutter/material.dart';

const String USER_COLLECTION = 'user';
const String POST_COLLECTION = 'forumPosts';
const API_ID = '74ff5261';
const API_KEY = 'f5ed1b1c8edeb5f4b28a4e4c1802ea25';
const GOOGLE_API_KEY = 'AIzaSyANoPTW9_6_FU5BW_KhkHENGP1XMxLzx1c';

/// helpful text info from cool climate site: https://coolclimate.berkeley.edu/calculator
const HOUSE_HOLD_PEOPLE_INFO =
    'Enter the total number of adults and children in your household. If you only want to calculate your personal carbon footprint, then select 1 Person and enter your personal consumption in the calculator, such as just your share of energy bills or driving.';
const HOUSE_HOLD_INCOME_INFO =
    'Entering income helps the calculator provide appropriate default values and a comparison to similar households. This information is private even for users that share their profile publicly.';
const HOUSE_HOLD_QUESTION = 'How many people live in your household?';
const HOUSE_HOLD_INCOME = 'What is your gross annual household income?';

final bucketStorage = PageStorageBucket();
