# uvastudent-demographics-nonparam
Non-parametric test analysis on University of Virginia student demographics (specifically admission offers, first-year enrollment, and student grade point averages)

## Introduction
UVA has consistently done well in national college rankings and are currently ranked #25 in National Universities
and #3 in Best Public Institutions according to the U.S. News and World Report. As students of UVA, we
were curious as to how different sectors of students (by year, gender, school program, etc.) performed
academically and if the GPA trends aligned with our initial assumptions and stereotypes made by students
regarding the different schools within UVA. We felt that this topic was relevant to us, especially since we
contributed to the data, and we were also curious as to how UVA students' “work-hard” mindset plays into
statistics. Through this project, we hope to gain greater insight into UVA admissions and academic
performance that define our great university’s reputation.
We collected our data from UVA’s Institutional Research and Analytics website, which holds
information on historical admissions, degrees awarded, enrollment, GPA, employment, and tuition and
fees data. This data is available to the general public and provides corresponding Tableau visualizations
for the data. For this project, we focused on offers, enrollment, and GPA based on gender, academic
school, and academic level through a series of questions we hope to answer in the analysis section.
It is fitting to run non-parametric tests because the data provided to us gives us a small sample
size and is not normally distributed. The data is either a total or a mean for each year. It was presented to
us in the form of a line graph or a bar graph. Since we want to focus on data from 2016 to 2022, our
sample sizes are n = 5 or 6. As a result, we cannot assume that the distribution is normal; otherwise, parametric tests would be appropriate. Parametric tests would be useful if the site provided us with the anonymized raw data of all GPAs of students for that year, academic level, or academic school.

## Conclusion
After running our analyses on the data, we have found that we are 95% confident that UVA’s
admission offers will be between 9,336 and 9,935 and that the number of students among those given an
offer that accept and are enrolled at UVA will be between 3,683 and 4,030. We were able to get these
intervals through bootstrapping. If our collected sample data was sufficiently large or normally
distributed, we could have used parametric methods instead, utilizing the Central Limit Theorem rather
than the bootstrapping method. However, our collected data was very small and the histograms of the
sample showed that the data is not normal.
Through Wilcoxon testing, we have also found that female students at UVA tend to have higher
GPAs than male students. After seeing the histograms for the GPAs for female students and male students
from 2016 to 2022, it is very clear that both the samples are not very large and very skewed. If the data
were randomly and independently sampled and normal, it would have been more efficient to use
parametric methods instead (specifically a z-test if the standard deviation is known and a t-test if not).
Finally, we moved on to testing multiple samples. After running a Kruskal-Wallis test for the
samples of the different schools at UVA, we concluded that there is a GPA difference between the
programs. We continued to run another Kruskal-Wallis test for the samples of the different academic
levels at UVA and concluded that there is no significant GPA difference among first, second, third, and
fourth year students at UVA. For both of these tests, after printing the histograms for each of the samples,
we found that the distributions were all heavy-tailed and skewed to the right. Due to these conditions, we
could not run a traditional ANOVA F test or permutation F test. If the data for each of the k populations
were normally distributed, parametric methods would have been more appropriate, specifically the
ANOVA F test.
In general, because all of the data we collected had small sample sizes, not normally distributed,
and skewed, we found non-parametric testing methods the most efficient and appropriate ways to go
about analyzing the data. This displayed how useful non-parametric methods are when dealing with
realistic, non-extensive, and “non-perfect” data. Because assumptions are more relaxed compared to
parametric methods, non-parametric testing, though less powerful, can be applied to special cases when
dealing with small-sized or non-traditional/non-curated data.
