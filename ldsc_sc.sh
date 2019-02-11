##parameter
data_code=
##
mk_annot=/net/mulan/home/yasheng/summAnnot/software/LDSC/ldsc/make_annot.py
ldsc=/net/mulan/home/yasheng/summAnnot/software/LDSC/ldsc/ldsc.py
gene_coord=/net/mulan/home/yasheng/summAnnot/analysis/single_cell_data/gene_coord.txt
data_summ=/net/mulan/home/yasheng/summAnnot/analysis/single_cell_data/data_summ.txt
data_num=`cat ${data_summ} | wc -l`
data=`sed -n "${data_code}, 1p"  ${data_summ} `
cd /net/mulan/home/yasheng/summAnnot/analysis/result/single_cell_DE/${data}
cell_num=`cat /net/mulan/home/yasheng/summAnnot/analysis/single_cell_data/${data}/cell_prop.csv |wc -l`

### LDSC
source activate ldsc
mkdir ldsc

### MAST
mkdir ldsc_MAST
for ((cell_code=1;cell_code<(cell_num-1);cell_code++)); do

    cell_type=`sed -n "${cell_code}, 1p"  cell_type `
    DE_ct=/net/mulan/home/yasheng/summAnnot/analysis/result/single_cell_DE/${data}/${cell_type}/MAST_sig_rank_10.txt
    for ((chr=1;chr<23;chr++)); do
        ref_bim=/net/fantasia/home/xzhousph/data/SummaryData/1000GP_Phase3/processed/EUR_chr${chr}.bim
        annot_file=/net/mulan/home/yasheng/summAnnot/analysis/result/single_cell_DE/${data}/ldsc/${cell_type}_chr${chr}.gz
        python ${mk_annot} --gene-set-file ${DE_ct} --gene-coord-file ${gene_coord} --windowsize 100000 \
                           --bimfile ${ref_bim}    --annot-file ${annot_file}
        ref=/net/fantasia/home/xzhousph/data/SummaryData/1000GP_Phase3/processed/EUR_chr${chr}
        snp=/net/mulan/home/yasheng/summAnnot/software/LDSC/hapmap3_snps/hm.${chr}.snp
        out_file=/net/mulan/home/yasheng/summAnnot/analysis/result/single_cell_DE/${data}/ldsc_MAST/${cell_type}_chr${chr}
        python ${ldsc} --l2 --bfile ${ref} --ld-wind-cm 1 --annot ${annot_file} --thin-annot \
                       --out ${out_file} --print-snps ${snp}
        rm ${out_file}.log
    done
done

### edgeR
mkdir ldsc_edgeR
for ((cell_code=1;cell_code<(cell_num-1);cell_code++)); do
    cell_type=`sed -n "${cell_code}, 1p"  cell_type `
    DE_ct=/net/mulan/home/yasheng/summAnnot/analysis/result/single_cell_DE/${data}/${cell_type}/edgeR_sig_rank_10.txt
    for ((chr=1;chr<23;chr++)); do
        ref_bim=/net/fantasia/home/xzhousph/data/SummaryData/1000GP_Phase3/processed/EUR_chr${chr}.bim
        annot_file=/net/mulan/home/yasheng/summAnnot/analysis/result/single_cell_DE/${data}/ldsc/${cell_type}_chr${chr}.gz
        python ${mk_annot} --gene-set-file ${DE_ct} --gene-coord-file ${gene_coord} --windowsize 100000 \
                           --bimfile ${ref_bim}  --annot-file ${annot_file}
        ref=/net/fantasia/home/xzhousph/data/SummaryData/1000GP_Phase3/processed/EUR_chr${chr}
        snp=/net/mulan/home/yasheng/summAnnot/software/LDSC/hapmap3_snps/hm.${chr}.snp
        out_file=/net/mulan/home/yasheng/summAnnot/analysis/result/single_cell_DE/${data}/ldsc_edgeR/${cell_type}_chr${chr}
        python ${ldsc} --l2 --bfile ${ref} --ld-wind-cm 1 --annot ${annot_file} --thin-annot \
                       --out ${out_file} --print-snps ${snp}
        rm ${out_file}.log
    done
done

###zingeR
mkdir ldsc_zingeR
for ((cell_code=1;cell_code<(cell_num-1);cell_code++)); do
    cell_type=`sed -n "${cell_code}, 1p"  cell_type `
    DE_ct=/net/mulan/home/yasheng/summAnnot/analysis/result/single_cell_DE/${data}/${cell_type}/zingeR_sig_rank_10.txt
    for ((chr=1;chr<23;chr++)); do
        ref_bim=/net/fantasia/home/xzhousph/data/SummaryData/1000GP_Phase3/processed/EUR_chr${chr}.bim
        annot_file=/net/mulan/home/yasheng/summAnnot/analysis/result/single_cell_DE/${data}/ldsc/${cell_type}_chr${chr}.gz
        python ${mk_annot} --gene-set-file ${DE_ct} --gene-coord-file ${gene_coord} --windowsize 100000 \
                           --bimfile ${ref_bim} --annot-file ${annot_file}
        ref=/net/fantasia/home/xzhousph/data/SummaryData/1000GP_Phase3/processed/EUR_chr${chr}
        snp=/net/mulan/home/yasheng/summAnnot/software/LDSC/hapmap3_snps/hm.${chr}.snp
        out_file=/net/mulan/home/yasheng/summAnnot/analysis/result/single_cell_DE/${data}/ldsc_zingeR/${cell_type}_chr${chr}
        python ${ldsc} --l2 --bfile ${ref} --ld-wind-cm 1 --annot ${annot_file} --thin-annot \
                       --out ${out_file} --print-snps ${snp}
        rm ${out_file}.log
    done
done

###t
mkdir ldsc_t
for ((cell_code=1;cell_code<(cell_num-1);cell_code++)); do

    cell_type=`sed -n "${cell_code}, 1p"  cell_type `
    DE_ct=/net/mulan/home/yasheng/summAnnot/analysis/result/single_cell_DE/${data}/${cell_type}/t_sig_rank_10.txt
    for ((chr=1;chr<23;chr++)); do
        ref_bim=/net/fantasia/home/xzhousph/data/SummaryData/1000GP_Phase3/processed/EUR_chr${chr}.bim
        annot_file=/net/mulan/home/yasheng/summAnnot/analysis/result/single_cell_DE/${data}/ldsc/${cell_type}_chr${chr}.gz
        python ${mk_annot} --gene-set-file ${DE_ct} --gene-coord-file ${gene_coord} --windowsize 100000 \
                           --bimfile ${ref_bim} --annot-file ${annot_file}
        ref=/net/fantasia/home/xzhousph/data/SummaryData/1000GP_Phase3/processed/EUR_chr${chr}
        snp=/net/mulan/home/yasheng/summAnnot/software/LDSC/hapmap3_snps/hm.${chr}.snp
        out_file=/net/mulan/home/yasheng/summAnnot/analysis/result/single_cell_DE/${data}/ldsc_t/${cell_type}_chr${chr}
        python ${ldsc} --l2 --bfile ${ref} --ld-wind-cm 1 --annot ${annot_file} --thin-annot \
                       --out ${out_file} --print-snps ${snp}
        rm ${out_file}.log
    done
#done

###high
mkdir ldsc_high
for ((cell_code=1;cell_code<(cell_num-1);cell_code++)); do

    cell_type=`sed -n "${cell_code}, 1p"  cell_type `
    DE_ct=/net/mulan/home/yasheng/summAnnot/analysis/result/single_cell_DE/${data}/${cell_type}/high_sig_rank_10.txt
    for ((chr=1;chr<23;chr++)); do
        ref_bim=/net/fantasia/home/xzhousph/data/SummaryData/1000GP_Phase3/processed/EUR_chr${chr}.bim
        annot_file=/net/mulan/home/yasheng/summAnnot/analysis/result/single_cell_DE/${data}/ldsc/${cell_type}_chr${chr}.gz
        python ${mk_annot} --gene-set-file ${DE_ct} --gene-coord-file ${gene_coord} --windowsize 100000 \
                           --bimfile ${ref_bim} --annot-file ${annot_file}
        ref=/net/fantasia/home/xzhousph/data/SummaryData/1000GP_Phase3/processed/EUR_chr${chr}
        snp=/net/mulan/home/yasheng/summAnnot/software/LDSC/hapmap3_snps/hm.${chr}.snp
        out_file=/net/mulan/home/yasheng/summAnnot/analysis/result/single_cell_DE/${data}/ldsc_high/${cell_type}_chr${chr}
        python ${ldsc} --l2 --bfile ${ref} --ld-wind-cm 1 --annot ${annot_file} --thin-annot \
                       --out ${out_file} --print-snps ${snp}
        rm ${out_file}.log
    done
#done

rm -r ldsc