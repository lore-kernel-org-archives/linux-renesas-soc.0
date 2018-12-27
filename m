Return-Path: <SRS0=84+3=PE=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6086C43387
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 27 Dec 2018 20:21:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 873F721741
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 27 Dec 2018 20:21:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="rCLkWyAZ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729368AbeL0UVU (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 27 Dec 2018 15:21:20 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:38862 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729700AbeL0UVU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 27 Dec 2018 15:21:20 -0500
Received: by mail-lf1-f66.google.com with SMTP id p86so13347149lfg.5
        for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Dec 2018 12:21:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=from:subject:to:organization:cc:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=AenUC8Pnowalg86ojxVvWdZS3jHBPfPKO+kjZKOK3ik=;
        b=rCLkWyAZRopMRVNRTfvr1jNIk76XKb1z/RxpKnGJbeFBeluu/6zdxDu5fSaaYTZj9g
         mmyZbFP8NbIdIhrDekqVHcOI5vUJGBoUneftf/M6mx78EEUcxMQyyaPP/SifXF87xi2o
         IvPqxnnabIgPKEC/CSzeBm26gERd2a3f8fM5GpTjyDR1dFVD7hwhOhrD6lJJfqSTNs/b
         MeNfGJAVzUuieya+tKa+1Ug+QH/AmwnPVE2UuJvsFphXb3zudP4JkbltkzddvVTBvbDo
         l4uxWGS9fbroWABqsJps7qUAmNmXPqvzLBwixANBOOTnFXkNZ3dyz87EYjPjMtFb/tEh
         g0pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:organization:cc:message-id:date
         :user-agent:mime-version:content-language:content-transfer-encoding;
        bh=AenUC8Pnowalg86ojxVvWdZS3jHBPfPKO+kjZKOK3ik=;
        b=aUcTpfj749SIl5OX/elgj6iKqHb/H7VXg8BMQh0BccyQS0w8Af5rBCHkHKCMbJmD69
         2jjJO7112I0HEtYUYBz2wMCmbtM3IEupJB+C4cBGxA1R3EIFvJ9UMytcHLLnZ9kk+LR6
         qligL2ULa5OxJWW8vcputpmpJEo5BvysRgVjLpcY067KX7cxMWe1aAfG1jiubWW9txWv
         0zEghvYEHfKY19UR8/vzPZ+7HkCcINyDkLc6Ye9lTcsZbfXRBbQdLSxOeeQ7EZwgumW1
         u6JtuzYhnQW4h+SaHJbV95gC3ctSCRGEMWL/03glJMCIin9tSXKhNIARRw8PI0aYRcc+
         INyw==
X-Gm-Message-State: AA+aEWZBdiIVlEVpjtM+FbIXBJFLg9mDVR3LcmM9bsxwzDjrLQIZT5X7
        0vjwIFbPLYrgjMNmKdNe3dgyM1Iehw4=
X-Google-Smtp-Source: AFSGD/VcBiWZyMls/j5xraTurWRYDuhQXwDS4dfjZiOPqpIJCtbwo6x6y9NkOJ5jg0eXwv/ZKLJA3w==
X-Received: by 2002:a19:1f54:: with SMTP id f81mr12152090lff.153.1545942077440;
        Thu, 27 Dec 2018 12:21:17 -0800 (PST)
Received: from wasted.cogentembedded.com ([31.173.86.93])
        by smtp.gmail.com with ESMTPSA id s20sm7583484lfb.51.2018.12.27.12.21.15
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 27 Dec 2018 12:21:16 -0800 (PST)
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH RFT] spi-renesas-rpc: manual read issue workaround
To:     Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org,
        Mason Yang <masonccyang@mxic.com.tw>
Organization: Cogent Embedded
Cc:     linux-renesas-soc@vger.kernel.org
Message-ID: <76eb5af5-756e-4d54-0be2-55573649d2d1@cogentembedded.com>
Date:   Thu, 27 Dec 2018 23:21:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Even with the trickery introduced in the latest version of the RPC-IF SPI
driver, RPC-IF corrupts the data byte 4 for the RDID command, so the flash
chip is still not detected. It started to work correctly after I tried to
implement the workaround to this issue using the U-Boot RPC-IF driver's
approach, i.e. using the external address space read mode.

While at it, I'm removing the aforementioned trickery... 

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
The patch is against the 'devel' branch of Simon Horman's 'renesas,git' repo
plus the RPC-IF SPI driver patch [1] and its prerequisites...
 
[1] https://patchwork.kernel.org/patch/10742037/

 drivers/spi/spi-renesas-rpc.c |   66 ++++++++++++++++++++++++++----------------
 1 file changed, 42 insertions(+), 24 deletions(-)

Index: renesas/drivers/spi/spi-renesas-rpc.c
===================================================================
--- renesas.orig/drivers/spi/spi-renesas-rpc.c
+++ renesas/drivers/spi/spi-renesas-rpc.c
@@ -270,34 +270,52 @@ static int rpc_spi_io_xfer(struct rpc_sp
 	} else if (rx_buf) {
 		smenr = rpc->smenr;
 
-		while (pos < rpc->xferlen) {
+		/*
+		 * RPC-IF spoils the data for the commands without an address
+		 * phase (like RDID) in the manual mode, so we'll have to work
+		 * around this issue by using the external address space read
+		 * mode instead; we seem to be able to read 8 bytes at most in
+		 * this mode though...
+		 */
+		if (!(smenr & RPC_SMENR_ADE(0xf))) {
 			u32 nbytes = rpc->xferlen - pos;
+			u64 tmp;
 
-			if (nbytes > 4)
-				nbytes = 4;
+			if (nbytes > 8)
+				nbytes = 8;
 
-			smcr = rpc->smcr | RPC_SMCR_SPIE;
+			regmap_write(rpc->regmap, RPC_CMNCR, RPC_CMNCR_SFDE |
+				     RPC_CMNCR_MOIIO_HIZ | RPC_CMNCR_IOFV_HIZ |
+				     RPC_CMNCR_BSZ(0));
+			regmap_write(rpc->regmap, RPC_DRCR, 0);
+			regmap_write(rpc->regmap, RPC_DREAR, RPC_DREAR_EAC(1));
+			regmap_write(rpc->regmap, RPC_DRCMR, rpc->cmd);
+			regmap_write(rpc->regmap, RPC_DRDMCR, rpc->dummy);
+			regmap_write(rpc->regmap, RPC_DROPR, 0);
+			regmap_write(rpc->regmap, RPC_DRENR, rpc->smenr &
+				     ~RPC_SMENR_SPIDE(0xf));
+
+			tmp = readq(rpc->dirmap);
+			memcpy(rx_buf, &tmp, nbytes);
+		} else {
+			while (pos < rpc->xferlen) {
+				u32 nbytes = rpc->xferlen - pos;
+
+				if (nbytes > 4)
+					nbytes = 4;
+
+				smcr = rpc->smcr | RPC_SMCR_SPIE;
+
+				regmap_write(rpc->regmap, RPC_SMENR, smenr);
+				regmap_write(rpc->regmap, RPC_SMCR, smcr);
+				ret = wait_msg_xfer_end(rpc);
+				if (ret)
+					goto out;
+
+				regmap_read(rpc->regmap, RPC_SMRDR0, &data);
+				memcpy(rx_buf + pos, &data, nbytes);
+				pos += nbytes;
 
-			if (rpc->xferlen > 4 && rpc->xferlen < 8 && pos == 0)
-				smcr |= RPC_SMCR_SSLKP;
-
-			regmap_write(rpc->regmap, RPC_SMENR, smenr);
-			regmap_write(rpc->regmap, RPC_SMCR, smcr);
-			ret = wait_msg_xfer_end(rpc);
-			if (ret)
-				goto out;
-
-			regmap_read(rpc->regmap, RPC_SMRDR0, &data);
-			memcpy(rx_buf + pos, &data, nbytes);
-			pos += nbytes;
-
-			if (rpc->xferlen > 4 && rpc->xferlen < 8 && pos == 4) {
-				smenr = rpc->smenr & ~RPC_SMENR_CDE &
-					~RPC_SMENR_ADE(0xf);
-			} else {
-				regmap_write(rpc->regmap, RPC_SMCMR, rpc->cmd);
-				regmap_write(rpc->regmap, RPC_SMDMCR,
-					     rpc->dummy);
 				regmap_write(rpc->regmap, RPC_SMADR,
 					     rpc->addr + pos);
 			}
