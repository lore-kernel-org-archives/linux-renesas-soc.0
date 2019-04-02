Return-Path: <SRS0=Wh2G=SE=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45870C10F0B
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  2 Apr 2019 14:40:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 080392133D
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  2 Apr 2019 14:40:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730895AbfDBOk2 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 2 Apr 2019 10:40:28 -0400
Received: from michel.telenet-ops.be ([195.130.137.88]:54564 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730673AbfDBOk2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 2 Apr 2019 10:40:28 -0400
Received: from ramsan ([84.194.111.163])
        by michel.telenet-ops.be with bizsmtp
        id vSgQ1z00P3XaVaC06SgQwc; Tue, 02 Apr 2019 16:40:24 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hBKaO-0002lX-LK; Tue, 02 Apr 2019 16:40:24 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hBKaO-00079R-KK; Tue, 02 Apr 2019 16:40:24 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Mark Brown <broonie@kernel.org>
Cc:     Simon Horman <horms+renesas@verge.net.au>,
        Wolfram Sang <wsa@the-dreams.de>, linux-spi@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 1/3] spi: sh-msiof: Use BIT() and GENMASK()
Date:   Tue,  2 Apr 2019 16:40:21 +0200
Message-Id: <20190402144023.27422-2-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190402144023.27422-1-geert+renesas@glider.be>
References: <20190402144023.27422-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Improve maintainability by converting the register bit, bitmask, and
bitfield definitions from hexadecimal constants to constructs using
BIT(), GENMASK(), or "val << shift".

Suggested-by: Simon Horman <horms+renesas@verge.net.au>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
All definitions keep their original value (checked by comparing
assembler output).

v2:
  - New.
---
 drivers/spi/spi-sh-msiof.c | 174 ++++++++++++++++++-------------------
 1 file changed, 87 insertions(+), 87 deletions(-)

diff --git a/drivers/spi/spi-sh-msiof.c b/drivers/spi/spi-sh-msiof.c
index e2eb466db10a4d74..6edc76636e81a801 100644
--- a/drivers/spi/spi-sh-msiof.c
+++ b/drivers/spi/spi-sh-msiof.c
@@ -82,111 +82,111 @@ struct sh_msiof_spi_priv {
 #define RFDR	0x60	/* Receive FIFO Data Register */
 
 /* TMDR1 and RMDR1 */
-#define MDR1_TRMD	 0x80000000 /* Transfer Mode (1 = Master mode) */
-#define MDR1_SYNCMD_MASK 0x30000000 /* SYNC Mode */
-#define MDR1_SYNCMD_SPI	 0x20000000 /*   Level mode/SPI */
-#define MDR1_SYNCMD_LR	 0x30000000 /*   L/R mode */
-#define MDR1_SYNCAC_SHIFT	 25 /* Sync Polarity (1 = Active-low) */
-#define MDR1_BITLSB_SHIFT	 24 /* MSB/LSB First (1 = LSB first) */
-#define MDR1_DTDL_SHIFT		 20 /* Data Pin Bit Delay for MSIOF_SYNC */
-#define MDR1_SYNCDL_SHIFT	 16 /* Frame Sync Signal Timing Delay */
-#define MDR1_FLD_MASK	 0x0000000c /* Frame Sync Signal Interval (0-3) */
-#define MDR1_FLD_SHIFT		  2
-#define MDR1_XXSTP	 0x00000001 /* Transmission/Reception Stop on FIFO */
+#define MDR1_TRMD	   BIT(31)  /* Transfer Mode (1 = Master mode) */
+#define MDR1_SYNCMD_MASK   GENMASK(29, 28) /* SYNC Mode */
+#define MDR1_SYNCMD_SPI	   (2 << 28)/*   Level mode/SPI */
+#define MDR1_SYNCMD_LR	   (3 << 28)/*   L/R mode */
+#define MDR1_SYNCAC_SHIFT  25       /* Sync Polarity (1 = Active-low) */
+#define MDR1_BITLSB_SHIFT  24       /* MSB/LSB First (1 = LSB first) */
+#define MDR1_DTDL_SHIFT	   20       /* Data Pin Bit Delay for MSIOF_SYNC */
+#define MDR1_SYNCDL_SHIFT  16       /* Frame Sync Signal Timing Delay */
+#define MDR1_FLD_MASK	   GENMASK(3, 2) /* Frame Sync Signal Interval (0-3) */
+#define MDR1_FLD_SHIFT	   2
+#define MDR1_XXSTP	   BIT(0)   /* Transmission/Reception Stop on FIFO */
 /* TMDR1 */
-#define TMDR1_PCON	 0x40000000 /* Transfer Signal Connection */
-#define TMDR1_SYNCCH_MASK 0xc000000 /* Synchronization Signal Channel Select */
-#define TMDR1_SYNCCH_SHIFT	 26 /* 0=MSIOF_SYNC, 1=MSIOF_SS1, 2=MSIOF_SS2 */
+#define TMDR1_PCON	   BIT(30)  /* Transfer Signal Connection */
+#define TMDR1_SYNCCH_MASK  GENMASK(27, 26) /* Sync Signal Channel Select */
+#define TMDR1_SYNCCH_SHIFT 26       /* 0=MSIOF_SYNC, 1=MSIOF_SS1, 2=MSIOF_SS2 */
 
 /* TMDR2 and RMDR2 */
 #define MDR2_BITLEN1(i)	(((i) - 1) << 24) /* Data Size (8-32 bits) */
 #define MDR2_WDLEN1(i)	(((i) - 1) << 16) /* Word Count (1-64/256 (SH, A1))) */
-#define MDR2_GRPMASK1	0x00000001 /* Group Output Mask 1 (SH, A1) */
+#define MDR2_GRPMASK1	BIT(0)      /* Group Output Mask 1 (SH, A1) */
 
 /* TSCR and RSCR */
-#define SCR_BRPS_MASK	    0x1f00 /* Prescaler Setting (1-32) */
+#define SCR_BRPS_MASK	GENMASK(12, 8) /* Prescaler Setting (1-32) */
 #define SCR_BRPS(i)	(((i) - 1) << 8)
-#define SCR_BRDV_MASK	    0x0007 /* Baud Rate Generator's Division Ratio */
-#define SCR_BRDV_DIV_2	    0x0000
-#define SCR_BRDV_DIV_4	    0x0001
-#define SCR_BRDV_DIV_8	    0x0002
-#define SCR_BRDV_DIV_16	    0x0003
-#define SCR_BRDV_DIV_32	    0x0004
-#define SCR_BRDV_DIV_1	    0x0007
+#define SCR_BRDV_MASK	GENMASK(2, 0) /* Baud Rate Generator's Division Ratio */
+#define SCR_BRDV_DIV_2	0
+#define SCR_BRDV_DIV_4	1
+#define SCR_BRDV_DIV_8	2
+#define SCR_BRDV_DIV_16	3
+#define SCR_BRDV_DIV_32	4
+#define SCR_BRDV_DIV_1	7
 
 /* CTR */
-#define CTR_TSCKIZ_MASK	0xc0000000 /* Transmit Clock I/O Polarity Select */
-#define CTR_TSCKIZ_SCK	0x80000000 /*   Disable SCK when TX disabled */
-#define CTR_TSCKIZ_POL_SHIFT	30 /*   Transmit Clock Polarity */
-#define CTR_RSCKIZ_MASK	0x30000000 /* Receive Clock Polarity Select */
-#define CTR_RSCKIZ_SCK	0x20000000 /*   Must match CTR_TSCKIZ_SCK */
-#define CTR_RSCKIZ_POL_SHIFT	28 /*   Receive Clock Polarity */
-#define CTR_TEDG_SHIFT		27 /* Transmit Timing (1 = falling edge) */
-#define CTR_REDG_SHIFT		26 /* Receive Timing (1 = falling edge) */
-#define CTR_TXDIZ_MASK	0x00c00000 /* Pin Output When TX is Disabled */
-#define CTR_TXDIZ_LOW	0x00000000 /*   0 */
-#define CTR_TXDIZ_HIGH	0x00400000 /*   1 */
-#define CTR_TXDIZ_HIZ	0x00800000 /*   High-impedance */
-#define CTR_TSCKE	0x00008000 /* Transmit Serial Clock Output Enable */
-#define CTR_TFSE	0x00004000 /* Transmit Frame Sync Signal Output Enable */
-#define CTR_TXE		0x00000200 /* Transmit Enable */
-#define CTR_RXE		0x00000100 /* Receive Enable */
+#define CTR_TSCKIZ_MASK	GENMASK(31, 30) /* Transmit Clock I/O Polarity Select */
+#define CTR_TSCKIZ_SCK	BIT(31)   /*   Disable SCK when TX disabled */
+#define CTR_TSCKIZ_POL_SHIFT 30   /*   Transmit Clock Polarity */
+#define CTR_RSCKIZ_MASK	GENMASK(29, 28) /* Receive Clock Polarity Select */
+#define CTR_RSCKIZ_SCK	BIT(29)   /*   Must match CTR_TSCKIZ_SCK */
+#define CTR_RSCKIZ_POL_SHIFT 28   /*   Receive Clock Polarity */
+#define CTR_TEDG_SHIFT	     27   /* Transmit Timing (1 = falling edge) */
+#define CTR_REDG_SHIFT	     26   /* Receive Timing (1 = falling edge) */
+#define CTR_TXDIZ_MASK	GENMASK(23, 22) /* Pin Output When TX is Disabled */
+#define CTR_TXDIZ_LOW	(0 << 22) /*   0 */
+#define CTR_TXDIZ_HIGH	(1 << 22) /*   1 */
+#define CTR_TXDIZ_HIZ	(2 << 22) /*   High-impedance */
+#define CTR_TSCKE	BIT(15)   /* Transmit Serial Clock Output Enable */
+#define CTR_TFSE	BIT(14)   /* Transmit Frame Sync Signal Output Enable */
+#define CTR_TXE		BIT(9)    /* Transmit Enable */
+#define CTR_RXE		BIT(8)    /* Receive Enable */
 
 /* FCTR */
-#define FCTR_TFWM_MASK	0xe0000000 /* Transmit FIFO Watermark */
-#define FCTR_TFWM_64	0x00000000 /*  Transfer Request when 64 empty stages */
-#define FCTR_TFWM_32	0x20000000 /*  Transfer Request when 32 empty stages */
-#define FCTR_TFWM_24	0x40000000 /*  Transfer Request when 24 empty stages */
-#define FCTR_TFWM_16	0x60000000 /*  Transfer Request when 16 empty stages */
-#define FCTR_TFWM_12	0x80000000 /*  Transfer Request when 12 empty stages */
-#define FCTR_TFWM_8	0xa0000000 /*  Transfer Request when 8 empty stages */
-#define FCTR_TFWM_4	0xc0000000 /*  Transfer Request when 4 empty stages */
-#define FCTR_TFWM_1	0xe0000000 /*  Transfer Request when 1 empty stage */
-#define FCTR_TFUA_MASK	0x07f00000 /* Transmit FIFO Usable Area */
-#define FCTR_TFUA_SHIFT		20
+#define FCTR_TFWM_MASK	GENMASK(31, 29) /* Transmit FIFO Watermark */
+#define FCTR_TFWM_64	(0 << 29) /*  Transfer Request when 64 empty stages */
+#define FCTR_TFWM_32	(1 << 29) /*  Transfer Request when 32 empty stages */
+#define FCTR_TFWM_24	(2 << 29) /*  Transfer Request when 24 empty stages */
+#define FCTR_TFWM_16	(3 << 29) /*  Transfer Request when 16 empty stages */
+#define FCTR_TFWM_12	(4 << 29) /*  Transfer Request when 12 empty stages */
+#define FCTR_TFWM_8	(5 << 29) /*  Transfer Request when 8 empty stages */
+#define FCTR_TFWM_4	(6 << 29) /*  Transfer Request when 4 empty stages */
+#define FCTR_TFWM_1	(7 << 29) /*  Transfer Request when 1 empty stage */
+#define FCTR_TFUA_MASK	GENMASK(26, 20) /* Transmit FIFO Usable Area */
+#define FCTR_TFUA_SHIFT	20
 #define FCTR_TFUA(i)	((i) << FCTR_TFUA_SHIFT)
-#define FCTR_RFWM_MASK	0x0000e000 /* Receive FIFO Watermark */
-#define FCTR_RFWM_1	0x00000000 /*  Transfer Request when 1 valid stages */
-#define FCTR_RFWM_4	0x00002000 /*  Transfer Request when 4 valid stages */
-#define FCTR_RFWM_8	0x00004000 /*  Transfer Request when 8 valid stages */
-#define FCTR_RFWM_16	0x00006000 /*  Transfer Request when 16 valid stages */
-#define FCTR_RFWM_32	0x00008000 /*  Transfer Request when 32 valid stages */
-#define FCTR_RFWM_64	0x0000a000 /*  Transfer Request when 64 valid stages */
-#define FCTR_RFWM_128	0x0000c000 /*  Transfer Request when 128 valid stages */
-#define FCTR_RFWM_256	0x0000e000 /*  Transfer Request when 256 valid stages */
-#define FCTR_RFUA_MASK	0x00001ff0 /* Receive FIFO Usable Area (0x40 = full) */
-#define FCTR_RFUA_SHIFT		 4
+#define FCTR_RFWM_MASK	GENMASK(15, 13) /* Receive FIFO Watermark */
+#define FCTR_RFWM_1	(0 << 13) /*  Transfer Request when 1 valid stages */
+#define FCTR_RFWM_4	(1 << 13) /*  Transfer Request when 4 valid stages */
+#define FCTR_RFWM_8	(2 << 13) /*  Transfer Request when 8 valid stages */
+#define FCTR_RFWM_16	(3 << 13) /*  Transfer Request when 16 valid stages */
+#define FCTR_RFWM_32	(4 << 13) /*  Transfer Request when 32 valid stages */
+#define FCTR_RFWM_64	(5 << 13) /*  Transfer Request when 64 valid stages */
+#define FCTR_RFWM_128	(6 << 13) /*  Transfer Request when 128 valid stages */
+#define FCTR_RFWM_256	(7 << 13) /*  Transfer Request when 256 valid stages */
+#define FCTR_RFUA_MASK	GENMASK(12, 4) /* Receive FIFO Usable Area (0x40 = full) */
+#define FCTR_RFUA_SHIFT	4
 #define FCTR_RFUA(i)	((i) << FCTR_RFUA_SHIFT)
 
 /* STR */
-#define STR_TFEMP	0x20000000 /* Transmit FIFO Empty */
-#define STR_TDREQ	0x10000000 /* Transmit Data Transfer Request */
-#define STR_TEOF	0x00800000 /* Frame Transmission End */
-#define STR_TFSERR	0x00200000 /* Transmit Frame Synchronization Error */
-#define STR_TFOVF	0x00100000 /* Transmit FIFO Overflow */
-#define STR_TFUDF	0x00080000 /* Transmit FIFO Underflow */
-#define STR_RFFUL	0x00002000 /* Receive FIFO Full */
-#define STR_RDREQ	0x00001000 /* Receive Data Transfer Request */
-#define STR_REOF	0x00000080 /* Frame Reception End */
-#define STR_RFSERR	0x00000020 /* Receive Frame Synchronization Error */
-#define STR_RFUDF	0x00000010 /* Receive FIFO Underflow */
-#define STR_RFOVF	0x00000008 /* Receive FIFO Overflow */
+#define STR_TFEMP	BIT(29) /* Transmit FIFO Empty */
+#define STR_TDREQ	BIT(28) /* Transmit Data Transfer Request */
+#define STR_TEOF	BIT(23) /* Frame Transmission End */
+#define STR_TFSERR	BIT(21) /* Transmit Frame Synchronization Error */
+#define STR_TFOVF	BIT(20) /* Transmit FIFO Overflow */
+#define STR_TFUDF	BIT(19) /* Transmit FIFO Underflow */
+#define STR_RFFUL	BIT(13) /* Receive FIFO Full */
+#define STR_RDREQ	BIT(12) /* Receive Data Transfer Request */
+#define STR_REOF	BIT(7)  /* Frame Reception End */
+#define STR_RFSERR	BIT(5)  /* Receive Frame Synchronization Error */
+#define STR_RFUDF	BIT(4)  /* Receive FIFO Underflow */
+#define STR_RFOVF	BIT(3)  /* Receive FIFO Overflow */
 
 /* IER */
-#define IER_TDMAE	0x80000000 /* Transmit Data DMA Transfer Req. Enable */
-#define IER_TFEMPE	0x20000000 /* Transmit FIFO Empty Enable */
-#define IER_TDREQE	0x10000000 /* Transmit Data Transfer Request Enable */
-#define IER_TEOFE	0x00800000 /* Frame Transmission End Enable */
-#define IER_TFSERRE	0x00200000 /* Transmit Frame Sync Error Enable */
-#define IER_TFOVFE	0x00100000 /* Transmit FIFO Overflow Enable */
-#define IER_TFUDFE	0x00080000 /* Transmit FIFO Underflow Enable */
-#define IER_RDMAE	0x00008000 /* Receive Data DMA Transfer Req. Enable */
-#define IER_RFFULE	0x00002000 /* Receive FIFO Full Enable */
-#define IER_RDREQE	0x00001000 /* Receive Data Transfer Request Enable */
-#define IER_REOFE	0x00000080 /* Frame Reception End Enable */
-#define IER_RFSERRE	0x00000020 /* Receive Frame Sync Error Enable */
-#define IER_RFUDFE	0x00000010 /* Receive FIFO Underflow Enable */
-#define IER_RFOVFE	0x00000008 /* Receive FIFO Overflow Enable */
+#define IER_TDMAE	BIT(31) /* Transmit Data DMA Transfer Req. Enable */
+#define IER_TFEMPE	BIT(29) /* Transmit FIFO Empty Enable */
+#define IER_TDREQE	BIT(28) /* Transmit Data Transfer Request Enable */
+#define IER_TEOFE	BIT(23) /* Frame Transmission End Enable */
+#define IER_TFSERRE	BIT(21) /* Transmit Frame Sync Error Enable */
+#define IER_TFOVFE	BIT(20) /* Transmit FIFO Overflow Enable */
+#define IER_TFUDFE	BIT(19) /* Transmit FIFO Underflow Enable */
+#define IER_RDMAE	BIT(15) /* Receive Data DMA Transfer Req. Enable */
+#define IER_RFFULE	BIT(13) /* Receive FIFO Full Enable */
+#define IER_RDREQE	BIT(12) /* Receive Data Transfer Request Enable */
+#define IER_REOFE	BIT(7)  /* Frame Reception End Enable */
+#define IER_RFSERRE	BIT(5)  /* Receive Frame Sync Error Enable */
+#define IER_RFUDFE	BIT(4)  /* Receive FIFO Underflow Enable */
+#define IER_RFOVFE	BIT(3)  /* Receive FIFO Overflow Enable */
 
 
 static u32 sh_msiof_read(struct sh_msiof_spi_priv *p, int reg_offs)
-- 
2.17.1

