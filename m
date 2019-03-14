Return-Path: <SRS0=FDtJ=RR=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFC04C10F0B
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 14 Mar 2019 22:32:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A9B6F21873
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 14 Mar 2019 22:32:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727701AbfCNWcD (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 14 Mar 2019 18:32:03 -0400
Received: from sauhun.de ([88.99.104.3]:60938 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727426AbfCNWcC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 14 Mar 2019 18:32:02 -0400
Received: from localhost (p54B33449.dip0.t-ipconnect.de [84.179.52.73])
        by pokefinder.org (Postfix) with ESMTPSA id 0C5472C0963;
        Thu, 14 Mar 2019 23:32:00 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [RFC PATCH 0/2] mmc: renesas_sdhi: prevent overflow for max_req_size
Date:   Thu, 14 Mar 2019 23:31:28 +0100
Message-Id: <20190314223130.31802-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.11.0
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Here is a small series fixing an 'unsigned int' overflow. I think the patch
descriptions say it all.

Tested on a Renesas Salvator XS board (R-Car M3N) with no regressions.

Sent as RFC to give Shimoda-san some time to approve this approach.

Thanks!

   Wolfram


Wolfram Sang (2):
  mmc: tmio: introduce macro for max block size
  mmc: renesas_sdhi: prevent overflow for max_req_size

 drivers/mmc/host/renesas_sdhi_internal_dmac.c | 8 ++++----
 drivers/mmc/host/renesas_sdhi_sys_dmac.c      | 2 +-
 drivers/mmc/host/tmio_mmc.h                   | 2 ++
 drivers/mmc/host/tmio_mmc_core.c              | 2 +-
 4 files changed, 8 insertions(+), 6 deletions(-)

-- 
2.11.0

