Return-Path: <SRS0=bVnl=PQ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBD6CC43387
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  8 Jan 2019 03:31:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C4BC32087F
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  8 Jan 2019 03:31:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727546AbfAHDbG (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 7 Jan 2019 22:31:06 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:41637 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727030AbfAHDbG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Jan 2019 22:31:06 -0500
X-IronPort-AV: E=Sophos;i="5.56,452,1539615600"; 
   d="scan'208";a="4404660"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 08 Jan 2019 12:31:04 +0900
Received: from localhost.localdomain (unknown [10.166.17.210])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id E8BC4403F288;
        Tue,  8 Jan 2019 12:31:03 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     thierry.reding@gmail.com
Cc:     linux-pwm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2 0/4] pwm: rcar: Add support "atomic" API and improve calculation
Date:   Tue,  8 Jan 2019 12:28:10 +0900
Message-Id: <1546918094-13960-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch series adds support for PWM "atomic" API and improve
the clock calculation.

Changes from v1 [1]:
 - Remove workaround code of output pseudo low level for now because it is
   rejected on the ML.
 - Add a condition for polarity because the HW doesn't support polarity change
   in patch 1/4.
 - Improve the clock calculation in patch 4/4.

[1]
https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=53193


Yoshihiro Shimoda (4):
  pwm: rcar: Add support "atomic" API
  pwm: rcar: Use "atomic" API on rcar_pwm_resume()
  pwm: rcar: remove legacy APIs
  pwm: rcar: improve calculation of divider

 drivers/pwm/pwm-rcar.c | 99 ++++++++++++++++++++++++--------------------------
 1 file changed, 48 insertions(+), 51 deletions(-)

-- 
1.9.1

