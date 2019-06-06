Return-Path: <SRS0=EBUn=UF=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04662C04AB5
	for <linux-renesas-soc@archiver.kernel.org>; Thu,  6 Jun 2019 11:35:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D461E2070B
	for <linux-renesas-soc@archiver.kernel.org>; Thu,  6 Jun 2019 11:35:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727703AbfFFLfv (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 6 Jun 2019 07:35:51 -0400
Received: from sauhun.de ([88.99.104.3]:33832 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727089AbfFFLfv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 6 Jun 2019 07:35:51 -0400
Received: from localhost (p5486CDEB.dip0.t-ipconnect.de [84.134.205.235])
        by pokefinder.org (Postfix) with ESMTPSA id 90A342C35BF;
        Thu,  6 Jun 2019 13:35:48 +0200 (CEST)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v2 0/3] mmc: sdhi: improve HS400 quirk handling
Date:   Thu,  6 Jun 2019 13:35:34 +0200
Message-Id: <20190606113537.8869-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.11.0
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

There are some more SoCs which cannot handle HS400. Add them and clean up the
quirk handling a bit. So, patch 1 is suitable for stable, the rest isn't.

Note that I don't have that HW, so I am relying on the provided information.

Changes since v1 (thanks Geert and Fabrizio!):
	* use '[012]' to specify the range instead of single entries
	* add RZ/G2M to the list

Wolfram Sang (3):
  mmc: sdhi: disallow HS400 for M3-W ES1.2, RZ/G2M, and V3H
  mmc: sdhi: improve quirk descriptions
  mmc: sdhi: remove unneeded initialization

 drivers/mmc/host/renesas_sdhi_core.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

-- 
2.11.0

