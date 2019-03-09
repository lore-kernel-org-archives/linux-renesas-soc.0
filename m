Return-Path: <SRS0=uGqO=RM=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED3D3C43381
	for <linux-renesas-soc@archiver.kernel.org>; Sat,  9 Mar 2019 07:12:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B952120866
	for <linux-renesas-soc@archiver.kernel.org>; Sat,  9 Mar 2019 07:12:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=umn.edu header.i=@umn.edu header.b="fZIlvJG+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726736AbfCIHMG (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sat, 9 Mar 2019 02:12:06 -0500
Received: from mta-p5.oit.umn.edu ([134.84.196.205]:46252 "EHLO
        mta-p5.oit.umn.edu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726733AbfCIHMF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 9 Mar 2019 02:12:05 -0500
X-Greylist: delayed 389 seconds by postgrey-1.27 at vger.kernel.org; Sat, 09 Mar 2019 02:12:04 EST
Received: from localhost (unknown [127.0.0.1])
        by mta-p5.oit.umn.edu (Postfix) with ESMTP id 0F6C4C98
        for <linux-renesas-soc@vger.kernel.org>; Sat,  9 Mar 2019 07:05:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p5.oit.umn.edu ([127.0.0.1])
        by localhost (mta-p5.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id m7mfmVuJTJj1 for <linux-renesas-soc@vger.kernel.org>;
        Sat,  9 Mar 2019 01:05:34 -0600 (CST)
Received: from mail-it1-f199.google.com (mail-it1-f199.google.com [209.85.166.199])
        (using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mta-p5.oit.umn.edu (Postfix) with ESMTPS id D17E7C55
        for <linux-renesas-soc@vger.kernel.org>; Sat,  9 Mar 2019 01:05:34 -0600 (CST)
Received: by mail-it1-f199.google.com with SMTP id v125so13763470itc.4
        for <linux-renesas-soc@vger.kernel.org>; Fri, 08 Mar 2019 23:05:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umn.edu; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=j2BKY+t1WAx9ChzDFZSzJABdJ0WWzcfwEgCZ2b2oFVg=;
        b=fZIlvJG+uDNfwDB+zAhg423IF86ug76/U9+M72573kaXtQO+JkKp98AEL0YIUuPaFy
         SahkL2dXOfvvk+71b8gF1/RzUpbzsyYe9yfvehYAQ4MHr2WSeHzdsNQdz06zx7yXnWcm
         JTBOXlcuo8iD3Vv51g1xgNIu83O0pY+UZBnXi5FYf1u3R4cEtlhVtHnO8u1qXhxcgtgp
         LZd7zaEtcSmFfUCEHS5G5RotHrOqCZEPoRQ5BVK6iH9jEuECuJNqbq+nFjI72As9DMge
         JlYjYGBv7b7n1iEyFu9OYY+9ZCAIlZtOQh9ktV35IjCAdTrH2ccnuT8+xbeh/9G2K4OZ
         hAMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=j2BKY+t1WAx9ChzDFZSzJABdJ0WWzcfwEgCZ2b2oFVg=;
        b=tv0hu9s98oAaqCLhFJMI6AZRANNsUpEakaG8cTJelXTQ+usyV+37f4BTRF7BgV4XSe
         OugayftUT/XsR7A3C2a8xEI1DOSygDxf9qjmmbb/3JdG/6XqGSCNANxAXpVTqPH+KK0H
         Nf3JVM2lvykWj90ODc/zmPgdbpwR4e7Jvud40GwGenbbODO6QbIsdfh78ZxiFMKXisRA
         9POMix7uTGKbKuGUGvIurhSAJC383sX5rXgPn7fzy69dlSmRWa2E7FWI0fe6bLB9pL5t
         C8zujeoiWN5hetJb3LYXpvkIoVVfFrjNK6x3QUd0rlrPFlvjatxL3YVCK52cGmaWF/m9
         jHGA==
X-Gm-Message-State: APjAAAVxsNw0N0ZowE6tPaOhCvH2n56Cc11gdMflaW5bF+vfA5aUzyv3
        xXbTrpMKZoqEHglt5q5ma1peEsBtAO+lSOPRWU8x+KMiO5yPbhmeAos4NtQvawL5Ej2r0gfP9e/
        WxlkM4ERLLqhfJpvdlKWa/96ZM5nKDZSSUxw=
X-Received: by 2002:a5e:c249:: with SMTP id w9mr1297609iop.284.1552115134428;
        Fri, 08 Mar 2019 23:05:34 -0800 (PST)
X-Google-Smtp-Source: APXvYqwg55ygPTsg3BkASjoAYH5DwjCDqyrRjwTCxCzz+mXbR0O8CUaIR4HoHTyQEB9BD1enImXCvA==
X-Received: by 2002:a5e:c249:: with SMTP id w9mr1297596iop.284.1552115134176;
        Fri, 08 Mar 2019 23:05:34 -0800 (PST)
Received: from bee.dtc.umn.edu (cs-bee-u.cs.umn.edu. [128.101.106.63])
        by smtp.gmail.com with ESMTPSA id z24sm3977671ioh.57.2019.03.08.23.05.32
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 08 Mar 2019 23:05:33 -0800 (PST)
From:   Kangjie Lu <kjlu@umn.edu>
To:     kjlu@umn.edu
Cc:     pakki001@umn.edu,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] media: rcar-vin: fix a potential NULL pointer dereference
Date:   Sat,  9 Mar 2019 01:05:27 -0600
Message-Id: <20190309070527.2657-1-kjlu@umn.edu>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

In case of_match_node cannot find a match, the fix returns
-EINVAL to avoid NULL pointer dereference.

Signed-off-by: Kangjie Lu <kjlu@umn.edu>
---
 drivers/media/platform/rcar-vin/rcar-core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/rcar-vin/rcar-core.c b/drivers/media/platform/rcar-vin/rcar-core.c
index f0719ce24b97..a058e2023ca8 100644
--- a/drivers/media/platform/rcar-vin/rcar-core.c
+++ b/drivers/media/platform/rcar-vin/rcar-core.c
@@ -266,6 +266,8 @@ static int rvin_group_init(struct rvin_group *group, struct rvin_dev *vin)
 
 	match = of_match_node(vin->dev->driver->of_match_table,
 			      vin->dev->of_node);
+	if (unlikely(!match))
+		return -EINVAL;
 
 	strscpy(mdev->driver_name, KBUILD_MODNAME, sizeof(mdev->driver_name));
 	strscpy(mdev->model, match->compatible, sizeof(mdev->model));
-- 
2.17.1

