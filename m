Return-Path: <SRS0=UbMS=UT=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AABB5C48BE1
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 20 Jun 2019 20:02:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8F37E2083B
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 20 Jun 2019 20:02:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726726AbfFTUCB (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 20 Jun 2019 16:02:01 -0400
Received: from sauhun.de ([88.99.104.3]:45074 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725914AbfFTUCB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 20 Jun 2019 16:02:01 -0400
Received: from localhost (p5486CFDE.dip0.t-ipconnect.de [84.134.207.222])
        by pokefinder.org (Postfix) with ESMTPSA id 66C972C376D;
        Thu, 20 Jun 2019 22:01:58 +0200 (CEST)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org, Peter Rosin <peda@axentia.se>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH] i2c: mux: demux-pinctrl: use proper email address for ABI requests
Date:   Thu, 20 Jun 2019 22:01:47 +0200
Message-Id: <20190620200147.1268-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Use my commercial address, not my community one.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Peter, I'd assume this goes via your tree unless you let me know
otherwise. Thanks!

 Documentation/ABI/testing/sysfs-platform-i2c-demux-pinctrl | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-platform-i2c-demux-pinctrl b/Documentation/ABI/testing/sysfs-platform-i2c-demux-pinctrl
index 3c3514815cd5..d6e0c3bb6bbf 100644
--- a/Documentation/ABI/testing/sysfs-platform-i2c-demux-pinctrl
+++ b/Documentation/ABI/testing/sysfs-platform-i2c-demux-pinctrl
@@ -1,7 +1,8 @@
 What:		/sys/devices/platform/<i2c-demux-name>/available_masters
 Date:		January 2016
 KernelVersion:	4.6
-Contact:	Wolfram Sang <wsa@the-dreams.de>
+Contact:	Wolfram Sang <wsa+renesas@sang-engineering.com>
+
 Description:
 		Reading the file will give you a list of masters which can be
 		selected for a demultiplexed bus. The format is
@@ -12,7 +13,7 @@ Description:
 What:		/sys/devices/platform/<i2c-demux-name>/current_master
 Date:		January 2016
 KernelVersion:	4.6
-Contact:	Wolfram Sang <wsa@the-dreams.de>
+Contact:	Wolfram Sang <wsa+renesas@sang-engineering.com>
 Description:
 		This file selects/shows the active I2C master for a demultiplexed
 		bus. It uses the <index> value from the file 'available_masters'.
-- 
2.20.1

