Return-Path: <SRS0=zxXW=RW=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8774AC43381
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 19 Mar 2019 13:24:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4B93420854
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 19 Mar 2019 13:24:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bdUBWFrN"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726703AbfCSNYJ (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 19 Mar 2019 09:24:09 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:41235 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725951AbfCSNYJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 Mar 2019 09:24:09 -0400
Received: by mail-pf1-f195.google.com with SMTP id d25so13667402pfn.8
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Mar 2019 06:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:date:message-id:subject;
        bh=wgE6POHDApIyk0+fujEYsA2TuoICXUlRWT+QmvrMjO4=;
        b=bdUBWFrNsbDaGAKulzPKDowfgjDcjl14XJBDVGCKAcr4XyAYBJQG4xZ+7vAIroo4HB
         DpDzQCPFCF6Rh2Jg70HWuaSKTGPgIbUnF93RHC5kfx9AXy/91+9PLSRNqN/QhUqhqihL
         ZSjxqlFJU5KbUWnAoUN1UXEHKZX55HyXufQGqU5Gn3i2XItQOKJzgOh1XRmTYCY+YQw7
         uRbGloEae37R5H05Ux0YaVSHi0qwOPzxptagSesUltON8gUGL9tuSi/UYStsTvttgvAX
         PmiLj887y7FUiiN7617UHR16eZ7m7vGCWxXti6YT80NwMrLuqe7yZ0PzCgesH8GanTcM
         lh2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:date:message-id:subject;
        bh=wgE6POHDApIyk0+fujEYsA2TuoICXUlRWT+QmvrMjO4=;
        b=S1prbIyW4++hIsaezpCsIBQ9NM0SJkDZiHbFXsoNUahH6yzZ5FF11AAHzyTxlEknZg
         eKRzNYD113exiOJu4YLqVxjjHlm0NJAS4u/MZ3eK6Yiwd9tfeP+Pl1kyW+EjlmULLhxJ
         XuyWZXNXBZTCSzpy5M79ovwN0x9BJczcrs0kOive7YzAFh4oPejjKeXJYLrrVWGo7r2u
         O8Loz4qWSCbTJvmQw1wleMEX180XxmXOEcAng++ZYVnz9mkdCamS0sqa2ZvS1aDBeDro
         lLuX76m151Y7mqQhKOjPx02d0j1mGaXKzxr3gxoutoiJ72g7CQ/DT7+tBeVVbVEvIX/9
         otZw==
X-Gm-Message-State: APjAAAVOLVKDL3Puv2D5iEgxd9Jq7auUXuqHOJdC3ZIB6vKQSzdIJ5EH
        XnJjZeisK/Mql4rdpP5TbMzhNr6RsQE=
X-Google-Smtp-Source: APXvYqxML7UDaKxivocXrEVMyYhs8LqUprzf/6pno5wNhIJUPWDWNHTq1dXNDeixw2/HwUJLCJFSxQ==
X-Received: by 2002:a63:da43:: with SMTP id l3mr1858684pgj.164.1553001848635;
        Tue, 19 Mar 2019 06:24:08 -0700 (PDT)
Received: from [127.0.0.1] (s214090.ppp.asahi-net.or.jp. [220.157.214.90])
        by smtp.gmail.com with ESMTPSA id x1sm21128528pge.73.2019.03.19.06.24.06
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 19 Mar 2019 06:24:07 -0700 (PDT)
From:   Magnus Damm <magnus.damm@gmail.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Magnus Damm <magnus.damm@gmail.com>
Date:   Tue, 19 Mar 2019 22:25:08 +0900
Message-Id: <155300190865.2469.7364392263486575447.sendpatchset@octo>
Subject: [PATCH/RFC V2] iommu/ipmmu-vmsa: Disable IPMMU when address expansion is not needed
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Magnus Damm <damm+renesas@opensource.se>

Add a memory bank location check to the whitelist handling.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 Changes since V1:
 - None, simply broke out this patch from the rest of the series

 drivers/iommu/ipmmu-vmsa.c |    7 +++++++
 1 file changed, 7 insertions(+)

--- 0001/drivers/iommu/ipmmu-vmsa.c
+++ work/drivers/iommu/ipmmu-vmsa.c	2019-03-19 21:04:43.000000000 +0900
@@ -17,6 +17,7 @@
 #include <linux/io.h>
 #include <linux/io-pgtable.h>
 #include <linux/iommu.h>
+#include <linux/memblock.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/of_iommu.h>
@@ -797,6 +798,12 @@ static bool ipmmu_slave_whitelist(struct
 	if (!soc_device_match(soc_rcar_gen3_whitelist))
 		return false;
 
+	/* In case all system memory fits within 32 bits of physical space
+	 * then assume the IPMMU will not be needed for address expansion.
+	 */
+	if (memblock_end_of_DRAM() <= SZ_4G)
+		return false;
+	
 	/* Check whether this slave device can work with the IPMMU */
 	for (i = 0; i < ARRAY_SIZE(rcar_gen3_slave_whitelist); i++) {
 		if (!strcmp(dev_name(dev), rcar_gen3_slave_whitelist[i]))
