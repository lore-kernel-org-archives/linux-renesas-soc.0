Return-Path: <SRS0=xQI0=RO=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2473C43381
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 11 Mar 2019 07:50:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B0BC620643
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 11 Mar 2019 07:50:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=umn.edu header.i=@umn.edu header.b="VDNZtG59"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726567AbfCKHuD (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 11 Mar 2019 03:50:03 -0400
Received: from mta-p8.oit.umn.edu ([134.84.196.208]:58532 "EHLO
        mta-p8.oit.umn.edu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726074AbfCKHuD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 11 Mar 2019 03:50:03 -0400
Received: from localhost (unknown [127.0.0.1])
        by mta-p8.oit.umn.edu (Postfix) with ESMTP id 8EF439D2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Mar 2019 07:50:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p8.oit.umn.edu ([127.0.0.1])
        by localhost (mta-p8.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id mP77XS0eu1MH for <linux-renesas-soc@vger.kernel.org>;
        Mon, 11 Mar 2019 02:50:01 -0500 (CDT)
Received: from mail-it1-f200.google.com (mail-it1-f200.google.com [209.85.166.200])
        (using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mta-p8.oit.umn.edu (Postfix) with ESMTPS id 5B4C79CB
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Mar 2019 02:50:01 -0500 (CDT)
Received: by mail-it1-f200.google.com with SMTP id 142so4366223itx.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Mar 2019 00:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umn.edu; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=Ad+Ht6iuPEK3V66itIO25xm2d2MmiWnk2HmclFaUdgw=;
        b=VDNZtG59PFO7DSh0K1Jhd7J/P9sr1z5nGz5m24NANiVWhaC6/kijvsGQKeLD+9NTV/
         RlsQoOio6SjU5DcZnFd5dqBdQYO1qDtjNDSHFVx6fZ4tZtElwS6uleVsLehsznLbEQiU
         Az/VaVelJECl2hvDUu34Sj3sUVD6AL5uHhi/FSaTvucmJ8LTU0nxG7SNKLh9aEGQqM+Q
         ErilQYuzOGronQY8OiIRExqvOvybK51e4xvuGMfAAC6FJjRaXk6J6APnVsZm9yZ9EjX6
         KIOIJsRa+hkEhxsDzMBahiY5AoxjcL8VfYLhrcl7ZFG3I+AagOyewqzkEanrnA735PEQ
         56AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Ad+Ht6iuPEK3V66itIO25xm2d2MmiWnk2HmclFaUdgw=;
        b=njucyCFRpyjkOUEjYRiWwKTBatqUWapAEMaiWzQYFyyfW1f2KjpKK6lxSu4NHCcaVK
         /T2wBze/pkYH9t/oz5Xgr7/3Z6CiNGDaYUji7ppLppzqMZI0501Lhdo8irTX7hrO+I2l
         R0weesBOK4/OpCf9jyWRZWoyaFcC+dHz0ev7Y50X8xw4vgm31h9fnmViUfa++miXTJcr
         zH6Bir7aVoJ4SRX3eLrLndeMLDGjc5JSLmyHZTI/MztCHFPpAQpfmkuwjgCiBXGc9Hzw
         IpVXs/Zgp3FbjyOCTy5IIZO/cDhgSENtBPp22jklD1n18zpRAe37n8ml0RZap4gsOmY5
         OGzQ==
X-Gm-Message-State: APjAAAW1I6CaNz3+csld2G6Ta2En0S3u80GCIwwbLdD4VOrcds7rRWe3
        zQgZsXHTNtej5a1ZI8RzJwJDedaTtsUFfWVyVfFcXahDW6KIu8uxflA2JNZy3RR6oaNLNz9h0v8
        rU/qKXmcJAPxFmHya4ZgWmFB9tI9X61wbCRA=
X-Received: by 2002:a24:1091:: with SMTP id 139mr15197827ity.110.1552290600968;
        Mon, 11 Mar 2019 00:50:00 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxEcwbeVHeTUD0YZEey71JInwRH/jTEenqU6CZEUTD1zMNotqyC2OqmpD6lJpywuJsoIPrvZg==
X-Received: by 2002:a24:1091:: with SMTP id 139mr15197810ity.110.1552290600647;
        Mon, 11 Mar 2019 00:50:00 -0700 (PDT)
Received: from bee.dtc.umn.edu (cs-bee-u.cs.umn.edu. [128.101.106.63])
        by smtp.gmail.com with ESMTPSA id d6sm1852609ioc.44.2019.03.11.00.49.59
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 11 Mar 2019 00:49:59 -0700 (PDT)
From:   Kangjie Lu <kjlu@umn.edu>
To:     kjlu@umn.edu
Cc:     pakki001@umn.edu,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        "David S. Miller" <davem@davemloft.net>,
        Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>,
        Chris Brandt <chris.brandt@renesas.com>,
        netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2] net: renesas: fix a missing check of of_get_phy_mode
Date:   Mon, 11 Mar 2019 02:49:37 -0500
Message-Id: <20190311074939.517-1-kjlu@umn.edu>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

of_get_phy_mode may fail and return a negative error code;
the fix checks the return value of of_get_phy_mode and
returns NULL of it fails.

Signed-off-by: Kangjie Lu <kjlu@umn.edu>
---
 drivers/net/ethernet/renesas/sh_eth.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/ethernet/renesas/sh_eth.c b/drivers/net/ethernet/renesas/sh_eth.c
index 339b2eae2100..239eeafe1b2d 100644
--- a/drivers/net/ethernet/renesas/sh_eth.c
+++ b/drivers/net/ethernet/renesas/sh_eth.c
@@ -3187,6 +3187,8 @@ static struct sh_eth_plat_data *sh_eth_parse_dt(struct device *dev)
 		return NULL;
 
 	pdata->phy_interface = of_get_phy_mode(np);
+	if (pdata->phy_interface < 0)
+		return NULL;
 
 	mac_addr = of_get_mac_address(np);
 	if (mac_addr)
-- 
2.17.1

