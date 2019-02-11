##parameter
data_code=2

### data 
data_summ=/net/mulan/home/yasheng/summAnnot/analysis/single_cell_data/data_summ.txt
data_label=`sed -n "${data_code}, 1p"  ${data_summ} `
cd /net/mulan/home/yasheng/summAnnot/analysis/result/GWAS_annot
mkdir ${data_label}
cd ./${data_label}

### cell type
CELLTYPE=/net/mulan/home/yasheng/summAnnot/analysis/result/single_cell_DE/${data_label}/cell_type
CELLNUM=`cat ${CELLTYPE} | wc -l`

### TORUS
TORUS=/net/mulan/home/yasheng/summAnnot/software/dap/torus_src/torus

### MAST
for ((PHENO=1;PHENO<44;PHENO++)); do
    OUTPUT=/net/mulan/home/yasheng/summAnnot/analysis/result/GWAS_annot/${data_label}
    cd ${OUTPUT}
    mkdir pheno_${PHENO}
    cd ./pheno_${PHENO}
    for ((CELL=1;CELL<(${CELLNUM}+1);CELL++)); do
        CELLT=`sed -n "${CELL}, 1p"  ${CELLTYPE} `
        ANNOT=/net/mulan/home/yasheng/summAnnot/analysis/result/single_cell_DE/${data_label}/${CELLT}/MAST_anno_rank_10.txt.gz
        SUMM=/net/mulan/home/yasheng/summAnnot/analysis/gwas_data/range_100Kb/summary_data/pheno_${PHENO}.summ.gz
        OUT=${CELL}_MAST_rank_10.txt
        ${TORUS} -d ${SUMM} --load_zval -est -annot ${ANNOT} > ${OUT}    
    done            
done

### zingeR
for ((PHENO=1;PHENO<44;PHENO++)); do
    OUTPUT=/net/mulan/home/yasheng/summAnnot/analysis/result/GWAS_annot/${data_label}
    cd ${OUTPUT}
    mkdir pheno_${PHENO}
    cd ./pheno_${PHENO}
    for ((CELL=1;CELL<(${CELLNUM}+1);CELL++)); do
        CELLT=`sed -n "${CELL}, 1p"  ${CELLTYPE} `
        ANNOT=/net/mulan/home/yasheng/summAnnot/analysis/result/single_cell_DE/${data_label}/${CELLT}/zingeR_anno_rank_10.txt.gz
        SUMM=/net/mulan/home/yasheng/summAnnot/analysis/gwas_data/range_100Kb/summary_data/pheno_${PHENO}.summ.gz
        OUT=${CELL}_zingeR_rank_10.txt
        ${TORUS} -d ${SUMM} --load_zval -est -annot ${ANNOT} > ${OUT}    
    done            
done

### edgeR
for ((PHENO=1;PHENO<44;PHENO++)); do
    OUTPUT=/net/mulan/home/yasheng/summAnnot/analysis/result/GWAS_annot/${data_label}
    cd ${OUTPUT}
    mkdir pheno_${PHENO}
    cd ./pheno_${PHENO}
    for ((CELL=1;CELL<(${CELLNUM}+1);CELL++)); do
        CELLT=`sed -n "${CELL}, 1p"  ${CELLTYPE} `
        ANNOT=/net/mulan/home/yasheng/summAnnot/analysis/result/single_cell_DE/${data_label}/${CELLT}/edgeR_anno_rank_10.txt.gz
        SUMM=/net/mulan/home/yasheng/summAnnot/analysis/gwas_data/range_100Kb/summary_data/pheno_${PHENO}.summ.gz
        OUT=${CELL}_edgeR_rank_10.txt
        ${TORUS} -d ${SUMM} --load_zval -est -annot ${ANNOT} > ${OUT}    
    done            
done

### t
for ((PHENO=1;PHENO<44;PHENO++)); do
    OUTPUT=/net/mulan/home/yasheng/summAnnot/analysis/result/GWAS_annot/${data_label}
    cd ${OUTPUT}
    mkdir pheno_${PHENO}
    cd ./pheno_${PHENO}
    for ((CELL=1;CELL<(${CELLNUM}+1);CELL++)); do
        CELLT=`sed -n "${CELL}, 1p"  ${CELLTYPE} `
        ANNOT=/net/mulan/home/yasheng/summAnnot/analysis/result/single_cell_DE/${data_label}/${CELLT}/t_anno_rank_10.txt.gz
        SUMM=/net/mulan/home/yasheng/summAnnot/analysis/gwas_data/range_100Kb/summary_data/pheno_${PHENO}.summ.gz
        OUT=${CELL}_t_rank_10.txt
        ${TORUS} -d ${SUMM} --load_zval -est -annot ${ANNOT} > ${OUT}    
    done            
done


### high
for ((PHENO=1;PHENO<44;PHENO++)); do
    OUTPUT=/net/mulan/home/yasheng/summAnnot/analysis/result/GWAS_annot/${data_label}
    cd ${OUTPUT}
    mkdir pheno_${PHENO}
    cd ./pheno_${PHENO}
    for ((CELL=1;CELL<(${CELLNUM}+1);CELL++)); do
        CELLT=`sed -n "${CELL}, 1p"  ${CELLTYPE} `
        ANNOT=/net/mulan/home/yasheng/summAnnot/analysis/result/single_cell_DE/${data_label}/${CELLT}/high_anno_rank_10.txt.gz
        SUMM=/net/mulan/home/yasheng/summAnnot/analysis/gwas_data/range_100Kb/summary_data/pheno_${PHENO}.summ.gz
        OUT=${CELL}_high_rank_10.txt
        ${TORUS} -d ${SUMM} --load_zval -est -annot ${ANNOT} > ${OUT}    
    done            
done
