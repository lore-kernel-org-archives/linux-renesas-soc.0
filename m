Return-Path: <SRS0=7QLY=T6=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B953C28CC0
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 30 May 2019 10:21:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E2FAE25715
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 30 May 2019 10:21:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727794AbfE3KVB (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 30 May 2019 06:21:01 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:16431 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727761AbfE3KVB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 30 May 2019 06:21:01 -0400
X-IronPort-AV: E=Sophos;i="5.60,530,1549897200"; 
   d="scan'208";a="17378680"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 30 May 2019 19:20:59 +0900
Received: from localhost.localdomain (unknown [10.166.17.210])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 53E5A4235028;
        Thu, 30 May 2019 19:20:59 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     thierry.reding@gmail.com
Cc:     linux-pwm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2 1/4] pwm: Add power management descriptions
Date:   Thu, 30 May 2019 19:16:04 +0900
Message-Id: <1559211367-25106-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1559211367-25106-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1559211367-25106-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch adds power management descriptions that consumers should
implement it.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 Documentation/pwm.txt | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/pwm.txt b/Documentation/pwm.txt
index 8fbf0aa..996e5ea 100644
--- a/Documentation/pwm.txt
+++ b/Documentation/pwm.txt
@@ -65,6 +65,10 @@ period). struct pwm_args contains 2 fields (period and polarity) and should
 be used to set the initial PWM config (usually done in the probe function
 of the PWM user). PWM arguments are retrieved with pwm_get_args().
 
+All consumers should really be reconfiguring the PWM upon resume as
+appropriate. This is the only way to ensure that everything is resumed in
+the proper order.
+
 Using PWMs with the sysfs interface
 -----------------------------------
 
@@ -141,6 +145,9 @@ The implementation of ->get_state() (a method used to retrieve initial PWM
 state) is also encouraged for the same reason: letting the PWM user know
 about the current PWM state would allow him to avoid glitches.
 
+Drivers should not implement any power management. In other words,
+consumers should implement it as described as the "Using PWMs" section.
+
 Locking
 -------
 
-- 
2.7.4

