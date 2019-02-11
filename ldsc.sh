for data_code in 4; do

ldsc=/net/mulan/home/yasheng/summAnnot/software/LDSC/ldsc/ldsc.py
baseline=/net/mulan/home/yasheng/summAnnot/software/LDSC/1000G_EUR_Phase3_baseline
weight_path=/net/mulan/home/yasheng/summAnnot/software/LDSC/weights_hm3_no_hla
pheno_path=/net/mulan/home/yasheng/summAnnot/analysis/gwas_data/ldsc_100Kb
data_summ=/net/mulan/home/yasheng/summAnnot/analysis/single_cell_data/data_summ.txt

###high
cd /net/mulan/home/yasheng/summAnnot/analysis/result/ldsc_annot_high
data_label=`sed -n "${data_code}, 1p"  ${data_summ} `
mkdir ${data_label}
cd ./${data_label}
source activate ldsc
for((pheno_code=1; pheno_code<44; pheno_code++));do

    ldcts_high=/net/mulan/home/yasheng/summAnnot/analysis/result/single_cell_DE/${data_label}/ldcts_high
    out_high=/net/mulan/home/yasheng/summAnnot/analysis/result/ldsc_annot_high/${data_label}/pheno_${pheno_code}
    ${ldsc} --h2-cts ${pheno_path}/pheno_${pheno_code}.sumstats.gz \
            --ref-ld-chr ${baseline}/baseline. \
            --out ${out_high} \
            --ref-ld-chr-cts ${ldcts_high} \
            --w-ld-chr ${weight_path}/weights.    
    rm *log
done

###t
cd /net/mulan/home/yasheng/summAnnot/analysis/result/ldsc_annot_t
data_label=`sed -n "${data_code}, 1p"  ${data_summ} `
mkdir ${data_label}
cd ./${data_label}
source activate ldsc
for((pheno_code=1; pheno_code<44; pheno_code++));do

    ldcts_t=/net/mulan/home/yasheng/summAnnot/analysis/result/single_cell_DE/${data_label}/ldcts_t
    out_t=/net/mulan/home/yasheng/summAnnot/analysis/result/ldsc_annot_t/${data_label}/pheno_${pheno_code}
    ${ldsc} --h2-cts ${pheno_path}/pheno_${pheno_code}.sumstats.gz \
            --ref-ld-chr ${baseline}/baseline. \
            --out ${out_t} \
            --ref-ld-chr-cts ${ldcts_t} \
            --w-ld-chr ${weight_path}/weights.    
    rm *log
done

###edgeR
cd /net/mulan/home/yasheng/summAnnot/analysis/result/ldsc_annot_edgeR
data_label=`sed -n "${data_code}, 1p"  ${data_summ} `
mkdir ${data_label}
cd ./${data_label}
source activate ldsc
for((pheno_code=1; pheno_code<44; pheno_code++));do

    ldcts_edgeR=/net/mulan/home/yasheng/summAnnot/analysis/result/single_cell_DE/${data_label}/ldcts_edgeR
    out_edgeR=/net/mulan/home/yasheng/summAnnot/analysis/result/ldsc_annot_edgeR/${data_label}/pheno_${pheno_code}
    ${ldsc} --h2-cts ${pheno_path}/pheno_${pheno_code}.sumstats.gz \
            --ref-ld-chr ${baseline}/baseline. \
            --out ${out_edgeR} \
            --ref-ld-chr-cts ${ldcts_edgeR} \
            --w-ld-chr ${weight_path}/weights.    
    rm *log
done

###zingeR
cd /net/mulan/home/yasheng/summAnnot/analysis/result/ldsc_annot_zingeR
data_label=`sed -n "${data_code}, 1p"  ${data_summ} `
mkdir ${data_label}
cd ./${data_label}
source activate ldsc
for((pheno_code=1; pheno_code<44; pheno_code++));do

    ldcts_zingeR=/net/mulan/home/yasheng/summAnnot/analysis/result/single_cell_DE/${data_label}/ldcts_zingeR
    out_zingeR=/net/mulan/home/yasheng/summAnnot/analysis/result/ldsc_annot_zingeR/${data_label}/pheno_${pheno_code}
    ${ldsc} --h2-cts ${pheno_path}/pheno_${pheno_code}.sumstats.gz \
            --ref-ld-chr ${baseline}/baseline. \
            --out ${out_zingeR} \
            --ref-ld-chr-cts ${ldcts_zingeR} \
            --w-ld-chr ${weight_path}/weights.    
    rm *log
done

####MAST
cd /net/mulan/home/yasheng/summAnnot/analysis/result/ldsc_annot_MAST
data_label=`sed -n "${data_code}, 1p"  ${data_summ} `
mkdir ${data_label}
cd ./${data_label}
for((pheno_code=1; pheno_code<44; pheno_code++));do

    ldcts_MAST=/net/mulan/home/yasheng/summAnnot/analysis/result/single_cell_DE/${data_label}/ldcts_MAST
    out_MAST=/net/mulan/home/yasheng/summAnnot/analysis/result/ldsc_annot_MAST/${data_label}/pheno_${pheno_code}
    ${ldsc} --h2-cts ${pheno_path}/pheno_${pheno_code}.sumstats.gz \
            --ref-ld-chr ${baseline}/baseline. \
            --out ${out_MAST} \
            --ref-ld-chr-cts ${ldcts_MAST} \
            --w-ld-chr ${weight_path}/weights.    
    rm *log
done
done