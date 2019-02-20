Return-Path: <SRS0=Daww=Q3=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 802ACC4360F
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 20 Feb 2019 14:55:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 497FA2183F
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 20 Feb 2019 14:55:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eSTqHwTJ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726441AbfBTOzp (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 20 Feb 2019 09:55:45 -0500
Received: from mail-pg1-f172.google.com ([209.85.215.172]:42994 "EHLO
        mail-pg1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726194AbfBTOzo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 20 Feb 2019 09:55:44 -0500
Received: by mail-pg1-f172.google.com with SMTP id b2so6254472pgl.9
        for <linux-renesas-soc@vger.kernel.org>; Wed, 20 Feb 2019 06:55:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:date:message-id:in-reply-to:references:subject;
        bh=iH9voQoR8vb/IJyVydWqV+YvMByqlCRz38pF2pI0PGo=;
        b=eSTqHwTJu1e9weHR+wpxdSKBIoqwAJs4sux7sJPulvVQbHO83y2O3jjBADA9fz/7KM
         cg6yiJpusbkRb0UgfFFeNV15pbIKvaSphPQlF7yxq180xojsHPUJGZbCb3DxqlRAXOHe
         4dfOl1Z+CxsYf4fOKhM0SYjyLINBpO9IVpYYAdrxdr1hzamoB/zK8dxtTmXcsuklY9Qt
         ZNp0SmFCiotdxgyLX04hq81GwWv1i56j8Y2cCahXVVAI88GKBMMOde8DDvrq0P8LsDbj
         14eNhslHWejFQ1vKX6yGNXT/T73i/4qS5spYGcUyfUoG+sdvU4dR9buXH58C5u7cYxn0
         a+2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:date:message-id:in-reply-to
         :references:subject;
        bh=iH9voQoR8vb/IJyVydWqV+YvMByqlCRz38pF2pI0PGo=;
        b=kOY8i0EN6wD4ud21wnVn9z9rJKgZWqTMe7rL/IxaZ63zBKxSknAlRezRYvNStjfM/Q
         JMhdhlmppqkGPfJXzIXODjWlS41fXh+++b7j8VXGTz1Ufhk3sugnuBufx3VYpCFLJaQ1
         L/oACgCN6AenU46+oEZEioQZDQxTTtHOuUoQ5ldNwC/cRsg6DwuDOaSyVjJM/dd4+kY4
         8j2G+zp5/qxk8InMgpgKi0Keitb0JaRjeYuewKkRZ2boa+oFYuWT7P1yZB+jkQMbxfLe
         wLMjKcT9zyOykPDNrguv3JV65muwSNASxFbmhvYg/TkSWmPiWIRkZfCsfBVDAVzRdRJV
         G1/g==
X-Gm-Message-State: AHQUAuZBS4tYyb7fCSvPr/YxEEk3kqw1DVU3msxyS6eedfMQGLKc6KhR
        CQYpUO/K9CwtY2UfQKbYSRS0W8iY
X-Google-Smtp-Source: AHgI3IZd20HVKWyjzfmEbU9aI0RcNDslTx2xXk2D/j4xtPl0VBbXbbMz4+BFNFAqQ1zJcQKGvxBLjA==
X-Received: by 2002:a62:e716:: with SMTP id s22mr34803075pfh.35.1550674543861;
        Wed, 20 Feb 2019 06:55:43 -0800 (PST)
Received: from [127.0.0.1] (s214090.ppp.asahi-net.or.jp. [220.157.214.90])
        by smtp.gmail.com with ESMTPSA id b6sm3934010pfo.27.2019.02.20.06.55.41
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 20 Feb 2019 06:55:42 -0800 (PST)
From:   Magnus Damm <magnus.damm@gmail.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Magnus Damm <magnus.damm@gmail.com>
Date:   Wed, 20 Feb 2019 23:56:34 +0900
Message-Id: <155067459467.15971.7737852632431664716.sendpatchset@octo>
In-Reply-To: <155067454871.15971.12157033067057246708.sendpatchset@octo>
References: <155067454871.15971.12157033067057246708.sendpatchset@octo>
Subject: [PATCH/RFC 05/09] arm64: dts: renesas: salvator: Introduce keepipmmu boot parameter
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Magnus Damm <damm+renesas@opensource.se>

Introduce a keepipmmu boot paramenter to let the user override.

Not-Yet-Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 arch/arm64/boot/dts/renesas/salvator-common.dtsi |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- 0001/arch/arm64/boot/dts/renesas/salvator-common.dtsi
+++ work/arch/arm64/boot/dts/renesas/salvator-common.dtsi	2019-02-20 23:23:21.820035344 +0900
@@ -38,7 +38,7 @@
 	};
 
 	chosen {
-		bootargs = "ignore_loglevel rw root=/dev/nfs ip=dhcp";
+		bootargs = "keepipmmu ignore_loglevel rw root=/dev/nfs ip=dhcp";
 		stdout-path = "serial0:115200n8";
 	};
 
