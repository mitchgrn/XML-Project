<?xml version="1.0" ?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output indent="yes" 
				method="html"
				encoding="UTF-8" 
				doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
				doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"/>
		<xsl:template match="/sales">
			<html>
				<head>
					<title>Sales and Stuff</title>
					<link rel="stylesheet" type="text/css" href="styles.css"></link>
				</head>
				<body>
					<table summary="Movie Table">
						<caption>Sales by Amount</caption>
						<thead>
							<th>Date</th>
							<th>Amount</th>
							<th>Paid</th>
							<th>Description</th>
							<th>SalesPerson</th>
						</thead>
						<tfoot>
							<tr>
								<th colspan="100%">Number of sales: <xsl:value-of select='count(//amount)' /></th>
							</tr>
							<tr>
								<th colspan="100%">Total sales: $<xsl:value-of select='format-number(sum(//amount), "###,##0.00")' /></th>
							</tr>
							<tr>
								<th colspan="100%">Average sale: $<xsl:value-of select='format-number(sum(//amount) div count(//amount), "###,##0.00")' /></th>
							</tr>
						</tfoot>
						<xsl:for-each select="sale">
							<xsl:sort select="amount" data-type="number" order="descending"/>
							<tr>
								<td>
									<xsl:value-of select="@date" />
								</td>
								<td class="money">
									$<xsl:value-of select="amount" />
								</td>
								<td class="money">
									$<xsl:value-of select="paid" />
								</td>
								<td>
									<xsl:value-of select="description" />
								</td>
								<td>
									<xsl:value-of select="salesperson" />
								</td>
							</tr>
						</xsl:for-each>
					</table>
				</body>
			</html>
		</xsl:template>
</xsl:stylesheet>