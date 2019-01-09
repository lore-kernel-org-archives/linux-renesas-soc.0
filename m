Return-Path: <SRS0=7Xuf=PR=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF1CFC43387
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  9 Jan 2019 08:22:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BBFC720883
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  9 Jan 2019 08:22:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729845AbfAIIWA (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 9 Jan 2019 03:22:00 -0500
Received: from relmlor1.renesas.com ([210.160.252.171]:55996 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729844AbfAIIWA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Jan 2019 03:22:00 -0500
X-IronPort-AV: E=Sophos;i="5.56,456,1539615600"; 
   d="scan'208";a="4746199"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 09 Jan 2019 17:21:58 +0900
Received: from localhost.localdomain (unknown [10.166.17.210])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 0D1CA446E142;
        Wed,  9 Jan 2019 17:21:58 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     thierry.reding@gmail.com
Cc:     linux-pwm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v3 0/4] pwm: rcar: Add support "atomic" API and improve calculation
Date:   Wed,  9 Jan 2019 17:19:04 +0900
Message-Id: <1547021948-7664-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
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

Changes from v2 [1]:
 - Add Acked-by of Uwe in patch [234]/4.
 - Modify a condition to support normal polarity only.
 - Fix possible to output wrong a duty cycle when disabling in patch 1/4.
 - Fix overflow value on 32-bit arch in patch 4/4.

Changes from v1 [2]:
 - Remove workaround code of output pseudo low level for now because it is
   rejected on the ML.
 - Add a condition for polarity because the HW doesn't support polarity change
   in patch 1/4.
 - Improve the clock calculation in patch 4/4.

[1]
https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=63219

Remarks:
On the email thread of patch 2/4, we discuss about suspend/resume
handling and I suposed to improve it. However, I need more time
how to improve it. So, for now, I don't improve it on this patch series.

[2]
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

