Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE3E2C433FE
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  8 Dec 2020 08:04:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A294023A5B
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  8 Dec 2020 08:04:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727695AbgLHIEm (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 8 Dec 2020 03:04:42 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:50630 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725927AbgLHIEm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 8 Dec 2020 03:04:42 -0500
X-IronPort-AV: E=Sophos;i="5.78,401,1599490800"; 
   d="scan'208";a="65020040"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 08 Dec 2020 17:04:10 +0900
Received: from localhost.localdomain (unknown [10.166.252.89])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 9F9A2422927B;
        Tue,  8 Dec 2020 17:04:10 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     marek.vasut+renesas@gmail.com, lee.jones@linaro.org
Cc:     khiem.nguyen.xt@renesas.com, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 0/3] mfd: bd9571mwv: Add support for BD9574MWF
Date:   Tue,  8 Dec 2020 17:04:00 +0900
Message-Id: <1607414643-25498-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add BD574MWF support into bd9571mwv mfd driver. Latest Ebisu-4D
boards has this chip instead of BD9571MWV so that we need this
patch.

Khiem Nguyen (2):
  mfd: bd9571mwv: Make the driver more generic
  mfd: bd9571mwv: Add support for BD9574MWF

Yoshihiro Shimoda (1):
  mfd: bd9571mwv: Use the SPDX license identifier

 drivers/mfd/bd9571mwv.c       | 149 +++++++++++++++++++++++++++++++++++++-----
 include/linux/mfd/bd9571mwv.h | 109 +++++++++++++++++++++++++++---
 2 files changed, 231 insertions(+), 27 deletions(-)

-- 
2.7.4

