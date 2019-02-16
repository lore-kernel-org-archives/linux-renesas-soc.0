Return-Path: <SRS0=vwki=QX=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A907CC43381
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 16 Feb 2019 23:59:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 70E9221A4C
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 16 Feb 2019 23:59:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726511AbfBPX7Q (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sat, 16 Feb 2019 18:59:16 -0500
Received: from bin-mail-out-05.binero.net ([195.74.38.228]:50905 "EHLO
        bin-mail-out-05.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726232AbfBPX7Q (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 16 Feb 2019 18:59:16 -0500
X-Halon-ID: d60a4036-3246-11e9-b530-005056917a89
Authorized-sender: niklas@soderlund.pp.se
Received: from bismarck.berto.se (unknown [89.233.230.99])
        by bin-vsp-out-01.atm.binero.net (Halon) with ESMTPA
        id d60a4036-3246-11e9-b530-005056917a89;
        Sun, 17 Feb 2019 00:59:12 +0100 (CET)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Simon Horman <horms@verge.net.au>,
        linux-renesas-soc@vger.kernel.org
Cc:     =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 0/2] arm64: dts: r8a77990-ebisu: small fixes for VIN
Date:   Sun, 17 Feb 2019 00:58:52 +0100
Message-Id: <20190216235854.15244-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi,

This series corrects two minor issues in the Ebisu's device tree related 
to video capture. 1/2 aligns how other Renesas device trees represent 
register addresses for the ports in the adv7482 node while 2/2 enables 
VIN5 which is usable on the SoC but was disabled.

Patches are only compile tested and verified using the 
datasheets/schematics as I have no access to boards to test them on.

Takeshi Kihara (2):
  arm64: dts: r8a77990-ebisu: Fix adv7482 hexadecimal register address
  arm64: dts: r8a77990-ebisu: Enable VIN5

 arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

-- 
2.20.1

