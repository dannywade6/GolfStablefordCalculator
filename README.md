# GolfStablefordCalculator

This is a personal project to solidify my understanding of the Swift programming language and to build a SwiftUI application with plans of publishing this to the App Store.

**What is the Stableford scoring system?**

Stableford is a scoring system in golf which, rather than counting the total number of strokes taken, involves scoring points based on the number of strokes taken at each hole. 

**Points in Stableford are awarded as follows:**

• 6 points – Four strokes under 
• 5 points – Three strokes under 
• 4 points – Two strokes under 
• 3 points – One stroke under 
• 2 points – Level par
• 1 point – One stroke over 
• 0 points – Two strokes or more over

**How are Stableford points scored?**

The number of points awarded on each hole is determined by the number of strokes taken to par before being adjusted in relation to the player's handicap.

To do this, it involves taking a look at the stroke index on the scorecard.

For example, a player with a handicap of eight will be afforded an extra shot on the holes that have a stroke index of one to eight. A 24-handicapper, meanwhile, would get two extra strokes on holes with a stroke index of one to six and one extra shot on those with a stroke index of seven to 18.

So, if a hole is a par-5 with a stroke index of eight, our eight-handicapper would get one extra stroke (par-6) and our 24-handicapper would get two (par-7). 
