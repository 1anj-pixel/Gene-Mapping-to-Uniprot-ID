if (!requireNamespace("biomaRt", quietly = TRUE)) {
install.packages("biomaRt")
}
library(biomaRt)
res_2001$gene <- rownames(res_2001)
res_2002$gene <- rownames(res_2002)
res_2001_df <- as.data.frame(res_2001)
res_2002_df <- as.data.frame(res_2002)
combined_significant <- rbind(res_2001_df, res_2002_df)
write.csv(combined_significant, "combined.csv", row.names = FALSE)
write.csv(combined_significant, "combined.csv", row.names = FALSE)
gene_list_combined <- combined_significant$gene
protein_mapping_combined <- getBM(filters = "hgnc_symbol",
attributes = c("hgnc_symbol", "uniprot_swissprot"),
values = gene_list_combined,
mart = ensembl)
attributes <- listAttributes(ensembl)
head(attributes)
attributes <- listAttributes(ensembl)
protein_mapping_combined <- getBM(filters = "hgnc_symbol",
attributes = c("hgnc_symbol", "uniprotswissprot"),
values = gene_list_combined,
mart = ensembl)
head(protein_mapping_combined)
write.csv(protein_mapping_combined, "protein_mapping_combined.csv", row.names = FALSE)
