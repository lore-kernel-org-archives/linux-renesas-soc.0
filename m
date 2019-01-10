Return-Path: <SRS0=E4fS=PS=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 989D9C43387
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 10 Jan 2019 19:04:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6392220675
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 10 Jan 2019 19:04:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="xRDmh4fA"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729222AbfAJTEW (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 10 Jan 2019 14:04:22 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:34232 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728297AbfAJTEV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Jan 2019 14:04:21 -0500
Received: by mail-lf1-f67.google.com with SMTP id p6so9106941lfc.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Jan 2019 11:04:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:cc:references:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=EVoiI2Rzh0b2UJn7mUs/ie1462OcX7K+PDPyT4T//Ls=;
        b=xRDmh4fA7rezDA42WKhlrfpZYT3klWrO35MtLfFv4E9GuEBpFR3EJhQR67bmdmxjNr
         pGHY9ZKpV+c7bNBml0hRHMVdpRgOXRafW83ajTj9GRkJFeJYBjzgImd61iuLbvylqiNQ
         7Keauimphe2RYGVsePoiCEO1WoKe4S0sdw3WCyQmF9Y1q8o1VoRHgHPpX4wOzpARJzo3
         3UxNBLWgmhGGuPApcNiepqcNQip5NHkYcDmcWvxU4BXOSBXbAzcRfOlMCmwjfJ4VaI44
         EdTaHgtm5OfPQJ94Y4+rEqG2BBE1IOYNmC49476VHOnBH8ues1acZ3k5W2eDakJ9Z21Q
         zqLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=EVoiI2Rzh0b2UJn7mUs/ie1462OcX7K+PDPyT4T//Ls=;
        b=B3QJH17mHa0iDUkQcaPft61cLxF7+LdSbXHP5pBA+bzmpzOvQKPQ4AKMtsC7In3bsV
         yKerug1gelll558kMlXG9zml+iTn7T7YOnb+oFUSPex/Hib2WGkl/rGcYjKUZ0FHHg1C
         XobMlz2dXTvjLEs9gx0nSV5D+1aj+oibI1RirsDMQMRuQqAHuuBljZh+CqQnublMk99T
         qEVoCgqGP/YiP4YkPXyFeyzBVZMDy9nw3RG8S4xw1df3+OOaBiB2ZdnYqtY77LmHgGGE
         gCM1lOmXaZSI1XUQ2mFKSULkTqGfRxlfUjveoAxHeHlYh2BHnOgfIxWLNPrquaEWkghV
         Ilww==
X-Gm-Message-State: AJcUukd2Eh6Ibso9TrR/TP8idyj7wSq0G6iG4QG5RSWH0122L/PgpPIo
        Ibu178rBx1XVx9RLPLYemJXXm2oSl2o=
X-Google-Smtp-Source: ALg8bN7DnrtxN4PR4hw7TQTYOHfSnwhfghRlKfKrUPzGv35B3xG5TH2E6en4HLkwTdNcK4lzvQZYPg==
X-Received: by 2002:a19:7352:: with SMTP id o79mr6903282lfc.104.1547147059522;
        Thu, 10 Jan 2019 11:04:19 -0800 (PST)
Received: from wasted.cogentembedded.com ([31.173.83.92])
        by smtp.gmail.com with ESMTPSA id u21-v6sm15445318lju.46.2019.01.10.11.04.18
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 10 Jan 2019 11:04:18 -0800 (PST)
Subject: [PATCH RFC 2/2] spi-renesas-rpc: add R8A77970 support
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To:     linux-spi@vger.kernel.org, Mason Yang <masonccyang@mxic.com.tw>,
        Rob Herring <robh+dt@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org,
        Mark Rutland <mark.rutland@arm.com>
References: <c83b1e54-016f-ef28-6bc9-9be9410c0d9a@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <db789714-df8b-2b96-345d-9bf0220978b0@cogentembedded.com>
Date:   Thu, 10 Jan 2019 22:04:17 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <c83b1e54-016f-ef28-6bc9-9be9410c0d9a@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add the R-Car V3M (R8A77970) SoC support to the Renesas RPC-IF SPI driver.
This SoC has special RPC-IF register (DIVREG) that controls the RPC[D2]CK
clock divider instead of the CPG register (RPCCKCR) present in all other
R-Car gen3 SoC...

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 drivers/spi/spi-renesas-rpc.c |   31 +++++++++++++++++++++++++++----
 1 file changed, 27 insertions(+), 4 deletions(-)

Index: renesas/drivers/spi/spi-renesas-rpc.c
===================================================================
--- renesas.orig/drivers/spi/spi-renesas-rpc.c
+++ renesas/drivers/spi/spi-renesas-rpc.c
@@ -17,6 +17,7 @@
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/of.h>
+#include <linux/of_device.h>
 #include <linux/regmap.h>
 #include <linux/reset.h>
 #include <linux/spi/spi.h>
@@ -140,6 +141,9 @@
 #define RPC_PHYOFFSET2		0x0084	// R/W
 #define RPC_PHYOFFSET2_OCTTMG(v) (((v) & 0x7) << 8)
 
+#define RPC_DIVREG		0x00A8	// R8A77970 only
+#define RPC_DIVREG_RATIO(v)	(((v) & 0x3) << 0)
+
 #define RPC_WBUF		0x8000	// Write Buffer
 #define RPC_WBUF_SIZE		256	// Write Buffer size
 
@@ -158,8 +162,24 @@ struct rpc_spi {
 	u32 totalxferlen;
 	enum spi_mem_data_dir xfer_dir;
 	struct reset_control *rstc;
+	int (*set_freq)(struct rpc_spi *rpc, unsigned long freq);
 };
 
+static int rpc_spi_clk_set_freq(struct rpc_spi *rpc, unsigned long freq)
+{
+	return clk_set_rate(rpc->clk_rpc, freq);
+}
+
+static int rpc_spi_v3m_set_freq(struct rpc_spi *rpc, unsigned long freq)
+{
+	u32 ratio;
+
+	ratio = ilog2(DIV_ROUND_UP(clk_get_rate(rpc->clk_rpc), freq));
+	if (ratio > 2)
+		ratio = 2;
+	return regmap_write(rpc->regmap, RPC_DIVREG, RPC_DIVREG_RATIO(ratio));
+}
+
 static int rpc_spi_set_freq(struct rpc_spi *rpc, unsigned long freq)
 {
 	int ret;
@@ -167,7 +187,7 @@ static int rpc_spi_set_freq(struct rpc_s
 	if (rpc->cur_speed_hz == freq)
 		return 0;
 
-	ret = clk_set_rate(rpc->clk_rpc, freq);
+	ret = rpc->set_freq(rpc, freq);
 	if (ret)
 		return ret;
 
@@ -650,7 +670,7 @@ static const struct regmap_config rpc_sp
 	.val_bits = 32,
 	.reg_stride = 4,
 	.fast_io = true,
-	.max_register = RPC_PHYOFFSET2,
+	.max_register = RPC_DIVREG,
 	.volatile_table = &rpc_spi_volatile_table,
 };
 
@@ -708,6 +728,8 @@ static int rpc_spi_probe(struct platform
 	if (IS_ERR(rpc->rstc))
 		return PTR_ERR(rpc->rstc);
 
+	rpc->set_freq = of_device_get_match_data(&pdev->dev);
+
 	pm_runtime_enable(&pdev->dev);
 	master->auto_runtime_pm = true;
 
@@ -745,8 +767,9 @@ static int rpc_spi_remove(struct platfor
 }
 
 static const struct of_device_id rpc_spi_of_ids[] = {
-	{ .compatible = "renesas,r8a77980-rpc", },
-	{ .compatible = "renesas,r8a77995-rpc", },
+	{ .compatible = "renesas,r8a77970-rpc", .data = rpc_spi_v3m_set_freq, },
+	{ .compatible = "renesas,r8a77980-rpc", .data = rpc_spi_clk_set_freq, },
+	{ .compatible = "renesas,r8a77995-rpc", .data = rpc_spi_clk_set_freq, },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, rpc_spi_of_ids);
