Return-Path: <SRS0=QYV/=RG=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC3E2C43381
	for <linux-renesas-soc@archiver.kernel.org>; Sun,  3 Mar 2019 15:03:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 79B2820857
	for <linux-renesas-soc@archiver.kernel.org>; Sun,  3 Mar 2019 15:03:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726347AbfCCPDY (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sun, 3 Mar 2019 10:03:24 -0500
Received: from sauhun.de ([88.99.104.3]:45676 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726217AbfCCPDX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 3 Mar 2019 10:03:23 -0500
Received: from localhost (p54B334AE.dip0.t-ipconnect.de [84.179.52.174])
        by pokefinder.org (Postfix) with ESMTPSA id 2AEB42C0963;
        Sun,  3 Mar 2019 16:03:21 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 0/2] i2c: rcar: improve concurrency
Date:   Sun,  3 Mar 2019 16:03:12 +0100
Message-Id: <20190303150314.6528-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.11.0
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Here is a small series which mainly upports a patch from the BSP, reasonably
fixing an issue. Thanks, Yamasaki-san. I also noticed during review that there
is no explanation of the special lockless design of this driver, so I added a
comment for that. It is really noteworthy, I think.


Hiromitsu Yamasaki (1):
  i2c: rcar: fix concurrency issue related to ICDMAER

Wolfram Sang (1):
  i2c: rcar: explain the lockless design

 drivers/i2c/busses/i2c-rcar.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

-- 
2.11.0

