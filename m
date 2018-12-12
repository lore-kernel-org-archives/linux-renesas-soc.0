Return-Path: <SRS0=B/Gi=OV=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16AAAC65BAF
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 12 Dec 2018 10:23:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DA5B52084E
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 12 Dec 2018 10:23:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DA5B52084E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=renesas.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-renesas-soc-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726791AbeLLKXI (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 12 Dec 2018 05:23:08 -0500
Received: from relmlor1.renesas.com ([210.160.252.171]:58426 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727152AbeLLKWG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Dec 2018 05:22:06 -0500
X-IronPort-AV: E=Sophos;i="5.56,344,1539615600"; 
   d="scan'208";a="2627858"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 12 Dec 2018 19:22:05 +0900
Received: from localhost.localdomain (unknown [10.166.17.210])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 05FA84014F5A;
        Wed, 12 Dec 2018 19:22:05 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     geert+renesas@glider.be, linus.walleij@linaro.org
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 0/2] pinctrl: sh-pfc: r8a7799[05]: Fix MOD_SEL bit numbering
Date:   Wed, 12 Dec 2018 19:19:33 +0900
Message-Id: <1544609975-26477-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 1.9.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch set fixes the issue that some MOD_SEL setting is incorrect
on r8a7799[05] SoCs.

Takeshi Kihara (2):
  pinctrl: sh-pfc: r8a77990: Fix MOD_SEL bit numbering
  pinctrl: sh-pfc: r8a77995: Fix MOD_SEL bit numbering

 drivers/pinctrl/sh-pfc/pfc-r8a77990.c | 28 ++++++++++++++--------------
 drivers/pinctrl/sh-pfc/pfc-r8a77995.c |  8 ++++----
 2 files changed, 18 insertions(+), 18 deletions(-)

-- 
1.9.1

