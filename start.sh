date >> time.txt
echo 'tophat' >>time.txt
tophat2 -p 5 --no-coverage-search -G /data/iGenome/Homo_sapiens/UCSC/hg19/Annotation/Genes/genes.gtf /data/iGenome/Homo_sapiens/UCSC/hg19/Sequence/Bowtie2Index/genome /NFSShare/neil/Pathogen/Sample_Hep3b/Hep3b_GCCAAT_6_R1.fastq /NFSShare/neil/Pathogen/Sample_Hep3b/Hep3b_GCCAAT_6_R2.fastq
date >> time.txt
echo 'bam2sam2fastq' >> time.txt
samtools view tophat_out/unmapped.bam > tophat_out/unmapped.sam
cat tophat_out/unmapped.sam | grep -v ^@ | awk '{print "@"$1"\n"$10"\n+\n"$11}' > tophat_out/unmapped.fastq
date >> time.txt
echo 'trinity' >>time.txt
/data/NGSTools/trinityrnaseq_r20131110/Trinity.pl --JM 200G --seqType fq --single tophat_out/unmapped.fastq --CPU 5
date >> time.txt
echo 'blast' >>time.txt
cd ../blast_db/nr
blastn -query /NFSShare/neil/Pathogen/Workstage/Hep3B_data/trinity_out_dir/Trinity.fasta -out ../../Hep3B_data/trinity_out_dir/nr_result.out -db nt -max_target_seqs 1 -num_threads 5
date >>../time.txt
