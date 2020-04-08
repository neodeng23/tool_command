#腺嘌呤（A）、胸腺嘧啶（T）、鸟嘌呤（G）、胞嘧啶（C）、尿嘧啶（U）

#fastq的压缩与解压缩
gunzip  xxxxxxx.fastq.gz
gzip xxxxxxx.fastq

#bcl2fastq
#测序数据bcl转换成fastq

fastqc
#脱氨效果质控
fastqc [-o output dir] [--(no)extract] [-f fastq|bam|sam] [-c contaminant file] seqfile1 .. seqfileN
fastqc xxxxxxx.fastq
# 主要是包括前面的各种选项和最后面的可以加入N个文件
# -o --outdir FastQC生成的报告文件的储存路径，生成的报告的文件名是根据输入来定的
# --extract 生成的报告默认会打包成1个压缩文件，使用这个参数是让程序不打包
# -t --threads 选择程序运行的线程数，每个线程会占用250MB内存，越多越快咯
# -c --contaminants 污染物选项，输入的是一个文件，格式是Name [Tab] Sequence，里面是可能的污染序列，如果有这个选项，FastQC会在计算时候评估污染的情况，并在统计的时候进行分析，一般用不到
# -a --adapters 也是输入一个文件，文件的格式Name [Tab] Sequence，储存的是测序的adpater序列信息，如果不输入，目前版本的FastQC就按照通用引物来评估序列时候有adapter的残留
# -q --quiet 安静运行模式，一般不选这个选项的时候，程序会实时报告运行的状况。

Trimmomatic
#数据预处理（去除低质量的reads)
java -jar /opt/biosoft/Trimmomatic-0.30/trimmomatic-0.30.jar PE \
#-threads 20 -phred33 reads1.fastq reads2.fastq \
#reads1.clean.fastq reads1.unpaired.fastq reads2.clean.fastq reads2.unpaired.fastq \
#  ILLUMINACLIP:/opt/biosoft/Trimmomatic-0.30/adapters/TruSeq3-PE.fa:2:30:10 \
#LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:50
#java -jar /database/software/Trimmomatic-0.36/trimmomatic-0.36.jar PE -phred33 \
#SEQ17568_1.fastq SEQ17568_2.fastq SEQ17568_1_clean.fastq SEQ17568_1_unpaird.fastq SEQ17568_2_clean.fastq SEQ17568_2_unpaired.fastq \
#-threads 1 -phred33  \
#LEADING:5 TRAILING:5 SLIDINGWINDOW:5:15 MINLEN:30
##PE/SE    设定对Paired-End或Single-End的reads进行处理，其输入和输出参数稍有不一样。
##-threads    设置多线程运行数
##-phred33    设置碱基的质量格式，可选pred64
##ILLUMINACLIP:TruSeq3-PE.fa:2:30:10    切除adapter序列。参数后面分别接adapter序列的fasta文件：允许的最大mismatch数：palindrome模式下匹配碱基数阈值：simple模式下的匹配碱基数阈值。
##LEADING:3    切除首端碱基质量小于3的碱基
##TRAILING:3    切除尾端碱基质量小于3的碱基
##SLIDINGWINDOW:4:15    从5'端开始进行滑动，当滑动位点周围一段序列(window)的平均碱基低于阈值，则从该处进行切除。Windows的size是4个碱基，其平均碱基质量小于15，则切除。
##MINLEN:50    最小的reads长度
##CROP:<length>    保留reads到指定的长度
##HEADCROP:<length>    在reads的首端切除指定的长度
##TOPHRED33    将碱基质量转换为pred33格式
#TOPHRED64    将碱基质量转换为pred64格式

bismark
#bismark中的bismark
#测序比对
bismark [options] --genome <genome_folder> {-1 <mates1> -2 <mates2> | <singles>}
index路径:/data_bak/genome/hg19/bismark_bowtie2index
#example:
/database/software/Bismark-master/bismark --bowtie2 -q --score_min L,0,-0.2 -p 2 --dovetail --maxins 500 -1 --genome_folder /data_bak/genome/hg19/bismark_bowtie2index/ -1 SEQ17568_1_clean.fastq -2 SEQ17568_2_clean.fastq

deduplicate_bismark
#bismark中的deduplicate_bismark功能
#对比结果进行排序去重

bismark_mathylation_extractor
#在bismark中
#胞嘧啶(c)位点的reads计数统计

