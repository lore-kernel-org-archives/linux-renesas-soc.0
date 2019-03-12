Return-Path: <SRS0=vwGd=RP=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CA21C43381
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 12 Mar 2019 06:38:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EF0FF214AE
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 12 Mar 2019 06:38:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=umn.edu header.i=@umn.edu header.b="DoizHe/h"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726325AbfCLGik (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 12 Mar 2019 02:38:40 -0400
Received: from mta-p6.oit.umn.edu ([134.84.196.206]:54430 "EHLO
        mta-p6.oit.umn.edu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726629AbfCLGii (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 Mar 2019 02:38:38 -0400
Received: from localhost (unknown [127.0.0.1])
        by mta-p6.oit.umn.edu (Postfix) with ESMTP id 26C43B35
        for <linux-renesas-soc@vger.kernel.org>; Tue, 12 Mar 2019 06:38:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p6.oit.umn.edu ([127.0.0.1])
        by localhost (mta-p6.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id KD_Za2xnIaMK for <linux-renesas-soc@vger.kernel.org>;
        Tue, 12 Mar 2019 01:38:36 -0500 (CDT)
Received: from mail-it1-f198.google.com (mail-it1-f198.google.com [209.85.166.198])
        (using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mta-p6.oit.umn.edu (Postfix) with ESMTPS id D67B6B32
        for <linux-renesas-soc@vger.kernel.org>; Tue, 12 Mar 2019 01:38:36 -0500 (CDT)
Received: by mail-it1-f198.google.com with SMTP id j127so1355496itj.7
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Mar 2019 23:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umn.edu; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=BFz1nugcEtlUOsGtar042lMEs7it+P+LEHQB9+9a60Q=;
        b=DoizHe/hZBidSBbs+E2WmmyukUS6MIfkl64098Ih/jG6ndsyTiNeWS0hYU7QzyGgvy
         y01y3r68vIlKds3mhqiaLQKLgApbppCVaDg+oom5iwqsmva+nD31OpX9mf+e6yklzDDT
         nKyy0V2IRR6IB4jEteZzkenCujpUQEept4JCp+FbHTycj6U9Keld806jSb2UvriHzzgJ
         tIwspFi3heC6M36hMHXfh8CywgtinlVY1ogkA+kvgKOuxGeSVdi+eJpMlYstjnxmursw
         0o5veKKbbWFLoHiYtFojEcYNFUStyhiCwfj5HKnfzBpvz1Dm2t5EfS8ibgkzirLMO+uy
         mp7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=BFz1nugcEtlUOsGtar042lMEs7it+P+LEHQB9+9a60Q=;
        b=CV9UzcrjM00sM4XNPnFZmA0u3UtH7+Cespsy4TeLvY+24EOMrIhdg4XI/XelNEIGZx
         YUALwtt8d26BZfzsTDPqwsCcQ/hAUAM+CFRxqr/XD92GAHgdSAVj0sgcJ3I6toNbCSu5
         +zlTOnc20fjd0Pp39ACARFLgFBzb7nEYN9RQT1zmYN+8VYV9EIDfUJn4Kh1jawDL7AXs
         8ZlYzHBTd64h2U03uVUBBsBDMlTaJNjFPb5L1jAR5CD9W4TkXC6SoDqjTEnzhBtqUMc8
         gHz5DYBQlg7i8oxq4JBRP+pRUiaAAb6MH2ya8/2CWTgMq9OvQ8zfZ+uvQp1uu2X4Ov7C
         mmMw==
X-Gm-Message-State: APjAAAX/DvFmmeYwkx+PMhV4uxjig4UY5+6VZMmljBas5RNdoKUrV4nM
        blsa73Aq2/2APuQzLpp3dvWqxSCtHJozG7mpQU16xl3gW9yghnWJQuDuKhARgFEzcbpaexBytCs
        nO8NrunWxPE/BhKcS+g7x42eajLxU7fqad1I=
X-Received: by 2002:a6b:b285:: with SMTP id b127mr6531925iof.179.1552372716454;
        Mon, 11 Mar 2019 23:38:36 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy7Vqi7AwBVApRs6dZSptd+Uoi/O7Z4l2//nf2gOtOPSjQg+DJNCPibKFsINzojSh8o3eyc0w==
X-Received: by 2002:a6b:b285:: with SMTP id b127mr6531912iof.179.1552372716225;
        Mon, 11 Mar 2019 23:38:36 -0700 (PDT)
Received: from bee.dtc.umn.edu (cs-bee-u.cs.umn.edu. [128.101.106.63])
        by smtp.gmail.com with ESMTPSA id j66sm851877itb.38.2019.03.11.23.38.35
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 11 Mar 2019 23:38:35 -0700 (PDT)
From:   Kangjie Lu <kjlu@umn.edu>
To:     kjlu@umn.edu
Cc:     pakki001@umn.edu,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        "David S. Miller" <davem@davemloft.net>,
        Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Andrew Lunn <andrew@lunn.ch>,
        Magnus Damm <damm+renesas@opensource.se>,
        Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>,
        netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] net: ravb_main: fix a missing check of of_get_phy_mode
Date:   Tue, 12 Mar 2019 01:38:26 -0500
Message-Id: <20190312063827.16046-1-kjlu@umn.edu>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

of_get_phy_mode may fail and return a negative error code;
the fix checks the return value of of_get_phy_mode and
goes to out_release if it fails.

Signed-off-by: Kangjie Lu <kjlu@umn.edu>
---
 drivers/net/ethernet/renesas/ravb_main.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index d28c8f9ca55b..791b6842eb12 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -1996,6 +1996,7 @@ static int ravb_probe(struct platform_device *pdev)
 	int error, irq, q;
 	struct resource *res;
 	int i;
+	int ret;
 
 	if (!np) {
 		dev_err(&pdev->dev,
@@ -2054,7 +2055,12 @@ static int ravb_probe(struct platform_device *pdev)
 	spin_lock_init(&priv->lock);
 	INIT_WORK(&priv->work, ravb_tx_timeout_work);
 
-	priv->phy_interface = of_get_phy_mode(np);
+	ret = of_get_phy_mode(np);
+	if (ret < 0) {
+		error = -EINVAL;
+		goto out_release;
+	}
+	priv->phy_interface = ret;
 
 	priv->no_avb_link = of_property_read_bool(np, "renesas,no-ether-link");
 	priv->avb_link_active_low =
-- 
2.17.1

