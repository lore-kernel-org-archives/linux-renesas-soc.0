Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793206072;
	b=GxrQDgaQJRbk3K2R+m5bqBlymQTWEGMNe3aOEIOwzM277Dg7KDse9UxstGERtq+fCudg
	 AcChCGBm7iQ3WMCEW5U6gYl+a4oeMNBVGHA3fZeTmyY0UPLn9vjaqC2e74K8HoT9XPeeA
	 WBvj64/4aL4Cl1MI0jjxn09PwmkbQYxJjeu3onyR+X5q0IWmj3hEyN5DepnR9Ts1ecxAL
	 SR8LnURkxmzD0wDzEp3yb0suWHr4KWSNFf8vO9mPPzXSdEgD867wVG6DG/d3JFw+dm7HP
	 GJTvTHHKLcZtsMGYo2PlY96PMmPiMnguoD84+Q2qtv4vvmJKreW2whpYQBy68RM12ng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793206072;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Y3c8hKxTfQ29WS+Th581uoCwhl1GtRSUhRSi/lkyiBg=;
	b=d8bwlkQY6tE7I4C767JIkRugqLykydvRF1M2Yzy7Q2ayhWLZ5cve+iYIQvnkYjpX5qVT
	 ylnl9Hp+P5W8cODnjXgEfTzCE8EsOCKLA8zet1wCvPajRXWbkAaY3pIZ71zABTQHLF7qC
	 kEqCYn/EZ1iyq0qjd0uHdMlmTka247rRb8kbbDWliG7arN6Yc8f7+B4Pj0RpHKLPw1/tU
	 mozAlc7Ad6x5p0TiE9orVfbB/v85Ylf/nbqJTJvNMbdklrESH6rfO/16qgogh7vds4Fr5
	 nfTcu+Pmu5CXdFOTF/A9nRQdvnsRCyMI/XggRiJIBPh4023wVNqxQzWbNnUCvSv2xHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="n/+WkKdl";
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E65E2606A322
	for <linux-renesas-soc@vger.kernel.org>; Wed, 28 Oct 2026 16:47:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E65E2606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n/+WkKdl
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-35829219da8so2854043eec.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 28 Oct 2026 09:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793206071; x=1793810871; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y3c8hKxTfQ29WS+Th581uoCwhl1GtRSUhRSi/lkyiBg=;
        b=n/+WkKdlLfVH0OD18dJk7m+iOZAmUe5EAufthxuSJhazbHSXxBR8OVHXSdkyOnMpCh
         qWlV/Nn+uyrOUWb/fLwKXa06QflK9CtFAnlNEOE7Xh/jTi0YBPLkx7rRzNnkhm6X6x+L
         c+sQxvY18roo99y8xMHBmwpjQs+YZfwCKd/F42GGTLYM9c4J4SzphbRSEwnRp4LoTTxb
         wJCXu5l2ZY51tgvnjK15eKkSUKeG8hjr8XJvVtkuV17+OhnCIX9wZhAxUhNSDQU2u205
         GVEy4Zv1RskZTCZIhSuk9pxRoSGNuGAfpFBfCYPGo7BO5wyHklOl+UsR7NpoQjY1cmX9
         NDOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793206071; x=1793810871;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y3c8hKxTfQ29WS+Th581uoCwhl1GtRSUhRSi/lkyiBg=;
        b=I+mcItKJF9WO3bu6qTRjqCLtoGQ55+ptJF4M98bZB2eee7kuovPTKxDwMQXl3j/aBH
         oQNhhpCMk9GMz00SRleW93LJK1L9Ra2tk3hs3b9KWAugyZmEtBpQE29ejtILTq25BbR9
         oO98VKi5qG1YK5vhyOkjJSoABB/OHtL4fu4B8FJyWpgMVF6w8F2iiQjsHJMvNOAs6SfB
         cYQjj+kiXvVr5HAl8lmXyWHiOSKTmzDLbRSV/I9ADiroWxtWW9QN0Ayj+gXa6FF1z7C5
         bfAdlt9C0GDTdXluiqQHf9Z9nt1YHQkIJRZYQIu+5d9ctkWNlcm1aosH5PVa4TB7BkzC
         JYfw==
X-Forwarded-Encrypted: i=1; AKwUvByyo/91p3bu4GT9ft8VYugT7U8WPlDx11aeQ0ebzGxioBayCsOfkW41fjskdlPRtlkW0IealnI2XvVbrKCAFEMuHA==@vger.kernel.org
X-Gm-Message-State: AFq9FYKXW1oRcf75y3dvfmIw0o8yXiHjRwc74k9Jrn9H2j0jQQlJiruJ
	cYG52O2WKHUTMJb1aNeGFCjws0TnKRz5AVmCZ5BYjo4ETPXPxYSe7jU=
X-Gm-Gg: AYBFou16qnQuQuQm8Ze+2uYCkAAhtCgLwnXU4hLwh0tBFvarX8X7PXGtZzj1qbfEBvU
	94KQSXXmMGkWTd7HMuOJi1c5s/seDvjj5FMF9YH3RusMMAhZyDnP02WvEzWtiCS5nxWFdRgFlAV
	ASB0uGhjv567e0jvcKUSVXcxViLMg0gjkSE7D4xheoOazvgz9syRy++x3MntWTzC9wba8VbZ57g
	mr0mb6DRlTKSnwOihmMpj319x0WYE5GRU2Em665t2rgscQ01XZSe0XNRy+m/oL/WihQC5CuuMAW
	JvKTdfEToLdOvNswjqzq4coYqomwnEkP6IbExsnBf/0qDVfShrV2lNXJvvNrlRadhc22X2WMtiQ
	wbbb6D+fleDWm8k2Am4HwV3rzucE512FUdS/jC9gD31kUEV2Ib3bRPCdwIHo4r8jGbkz2JcoJtG
	WHz2PTYomG3uNPs/RSuwY7DMHe6AF61j8V6PyOyW2bzPvqs1Nw1lal/oo19EtE4sA9dpOPgARcF
	pxVWt6+Ui5KNLaJhTkyp3z/o4LExpnJKZy1vKt3sn6ey3XIoutdj3gfclgy/U+mlSUWRYobsIWI
	LB7/JXFwWYoZAxVIfGV2XVa+hkt4fG8keXk75pMo7bRjt10n24P+6lRvITjDoW6M2KW+
X-Received: by 2002:a05:7301:c009:b0:369:f3a3:fad6 with SMTP id 5a478bee46e88-36a2fd52a75mr120073eec.4.1793206070780;
        Wed, 28 Oct 2026 09:47:50 -0700 (PDT)
Received: from localhost.localdomain ([2406:3003:2002:639c:7583:67d7:1072:ccc0])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a237be80csm16894099eec.2.2026.10.28.09.47.48
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 28 Oct 2026 09:47:50 -0700 (PDT)
From: Yige Jiang <yigejiang86@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Yige Jiang <yigejiang86@gmail.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH] mtd: hyperbus: rpc-if: fix an OF node reference leak
Date: Thu, 29 Oct 2026 00:47:40 +0800
Message-ID: <rc-review-20261023-ai33-33-fd231771d138@gmail.com>
X-Mailer: git-send-email 2.50.1
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rpcif_hb_probe() gets a child-node reference with of_get_next_child().
The HyperBus core does not consume it, so the driver leaks the
reference on registration failure and remove.

Put the node on registration failure and after unregistering the
HyperBus device on remove. Leave hardware initialization failures on
out_disable_rpm, since no node reference has been acquired there.

Fixes: 5de15b610f78 ("mtd: hyperbus: add Renesas RPC-IF driver")
Assisted-by: LLM
Signed-off-by: Yige Jiang <yigejiang86@gmail.com>
---
Based on linux-next next-20261016 (2efb7a11f1aa).
Compile-tested: arm64, GCC 14.2.0, W=1, CONFIG_OF_DYNAMIC=y.
COMPILE_TEST=y.
The object was built from this exact base with the patch applied.
No full kernel or module-link, hardware or runtime test was performed.

 drivers/mtd/hyperbus/rpc-if.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/hyperbus/rpc-if.c b/drivers/mtd/hyperbus/rpc-if.c
index f448e23f9260f10abe17842849b312365dcd8294..aa69abe6d6bc674bb8cdb531bbadfb7b356e3123 100644
--- a/drivers/mtd/hyperbus/rpc-if.c
+++ b/drivers/mtd/hyperbus/rpc-if.c
@@ -145,10 +145,12 @@ static int rpcif_hb_probe(struct platform_device *pdev)
 	hyperbus->hbdev.np = of_get_next_child(pdev->dev.parent->of_node, NULL);
 	error = hyperbus_register_device(&hyperbus->hbdev);
 	if (error)
-		goto out_disable_rpm;
+		goto out_put_node;
 
 	return 0;
 
+out_put_node:
+	of_node_put(hyperbus->hbdev.np);
 out_disable_rpm:
 	pm_runtime_disable(hyperbus->rpc.dev);
 	return error;
@@ -161,6 +163,7 @@ static void rpcif_hb_remove(struct platform_device *pdev)
 	hyperbus_unregister_device(&hyperbus->hbdev);
 
 	pm_runtime_disable(hyperbus->rpc.dev);
+	of_node_put(hyperbus->hbdev.np);
 }
 
 static const struct platform_device_id rpc_if_hyperflash_id_table[] = {

base-commit: 2efb7a11f1aa4d2dc285fe2680cca22cb9f72f64
