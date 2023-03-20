Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01A16C7618D
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 20 Mar 2023 09:21:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231297AbjCTJVd (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 20 Mar 2023 05:21:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231299AbjCTJVL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Mar 2023 05:21:11 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4505A23DB5
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Mar 2023 02:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=wHYsXvK6uoJ9eQZQ74HzrijgpuT
        y5EsMMcmd3JB2YQg=; b=F3Y/A1Sd9IsF9wCcZT0tv03+I3XVhNumsH++/Go7/vk
        eYjTxPv9zrf6bijAte0WODKTAMFPV7IN0W/VVgoe5f3BNqbcdobWgxESMxumevyi
        rae3Vh89ms8thX4Q1aeLr9tfDVeBmZ0RIwRtbxuDwBD8Kp1h/LafF0TTarzfbBps
        =
Received: (qmail 860414 invoked from network); 20 Mar 2023 10:20:47 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 Mar 2023 10:20:47 +0100
X-UD-Smtp-Session: l3s3148p1@ChP+cFH3Xtwujnuq
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     netdev@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH net v2 0/2] smsc911x: fix issues when interface is not up yet
Date:   Mon, 20 Mar 2023 10:20:39 +0100
Message-Id: <20230320092041.1656-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Similar to upstream commit 7f5ebf5dae42 ("ravb: avoid PHY being resumed
when interface is not up"), here is the fix for SMSC911x (patch 2).
Also, I saw a splat running 'ifconfig' when interface was not up. Patch
1 fixes it. Thank to Geert for a comment on this one.

Patches are based on v6.2-rc3 and tested on a Renesas APE6-EK.

Changes since v1:
* patch 1 is not a revert but a proper fix this time


Wolfram Sang (2):
  smsc911x: only update stats when interface is up
  smsc911x: avoid PHY being resumed when interface is not up

 drivers/net/ethernet/smsc/smsc911x.c | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

-- 
2.30.2

