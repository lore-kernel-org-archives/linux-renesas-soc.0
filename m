Return-Path: <SRS0=F/Q8=RI=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FF7AC43381
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  5 Mar 2019 17:54:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EF23D20643
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  5 Mar 2019 17:54:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730796AbfCERyt (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 5 Mar 2019 12:54:49 -0500
Received: from sauhun.de ([88.99.104.3]:36270 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730674AbfCERyt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Mar 2019 12:54:49 -0500
Received: from localhost (p54B3334F.dip0.t-ipconnect.de [84.179.51.79])
        by pokefinder.org (Postfix) with ESMTPSA id 22F162E3551;
        Tue,  5 Mar 2019 18:54:45 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 0/3] i2c: rcar: make DMA more robust
Date:   Tue,  5 Mar 2019 18:54:31 +0100
Message-Id: <20190305175434.13107-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.11.0
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The Renesas BSP has a patch to wait for the data register being empty before
starting TX-DMA. This is according to the data sheet, so this small series does
the same in patch 2 & 3. However, refactored, so there is less to compute and
it is hopefully also easy to read. During that work, I noticed an implicit
assumption about a required minimal DMA length. It is now explicit and
documented :)

Tested on a Renesas Salvator XS (R-Car M3N) and now regressions found when
writing data with DMA.

I am unsure if patches 2+3 should be squashed or not, but at least for
reviewing, seperate patches is easier.

Glad to hear what you think,

   Wolfram


Wolfram Sang (3):
  i2c: rcar: sanity check for minimal DMA length
  i2c: rcar: let DMA enable routine return success status
  i2c: rcar: wait for data empty before starting DMA

 drivers/i2c/busses/i2c-rcar.c | 30 ++++++++++++++++--------------
 1 file changed, 16 insertions(+), 14 deletions(-)

-- 
2.11.0

