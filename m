Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75401C433F5
	for <linux-renesas-soc@archiver.kernel.org>; Thu,  9 Sep 2021 08:49:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4D2336113E
	for <linux-renesas-soc@archiver.kernel.org>; Thu,  9 Sep 2021 08:49:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232116AbhIIIvG (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 9 Sep 2021 04:51:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231510AbhIIIvF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 Sep 2021 04:51:05 -0400
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56162C0613C1
        for <linux-renesas-soc@vger.kernel.org>; Thu,  9 Sep 2021 01:49:56 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:7d44:646d:3ffb:9bbf])
        by albert.telenet-ops.be with bizsmtp
        id rkpq2500G3eH4vN06kpqrJ; Thu, 09 Sep 2021 10:49:54 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mOFkj-003Cqq-Nk; Thu, 09 Sep 2021 10:49:49 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mOFkj-00Aj5V-5r; Thu, 09 Sep 2021 10:49:49 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Adam Ford <aford173@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 4/9] iARM: dts: renesas: Add compatible properties to LAN8710A Ethernet PHYs
Date:   Thu,  9 Sep 2021 10:49:40 +0200
Message-Id: <247dc2074dae149af07b6d014985ad30eb362eda.1631174218.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1631174218.git.geert+renesas@glider.be>
References: <cover.1631174218.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add compatible values to Ethernet PHY subnodes representing SMSC
LAN8710A PHYs on RZ/A1 and R-Mobile A1 boards.  This allows software to
identify the PHY model at any time, regardless of the state of the PHY
reset line.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
I could not verify the PHY revision number (least significant nibble of
the ID) on gr-peach, due to lack of hardware.
---
 arch/arm/boot/dts/r7s72100-gr-peach.dts       | 2 ++
 arch/arm/boot/dts/r8a7740-armadillo800eva.dts | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/r7s72100-gr-peach.dts b/arch/arm/boot/dts/r7s72100-gr-peach.dts
index 2562cc9b53564915..105f9c71f9fd54f4 100644
--- a/arch/arm/boot/dts/r7s72100-gr-peach.dts
+++ b/arch/arm/boot/dts/r7s72100-gr-peach.dts
@@ -129,6 +129,8 @@ &ether {
 	phy-handle = <&phy0>;
 
 	phy0: ethernet-phy@0 {
+		compatible = "ethernet-phy-id0007.c0f0",
+			     "ethernet-phy-ieee802.3-c22";
 		reg = <0>;
 
 		reset-gpios = <&port4 2 GPIO_ACTIVE_LOW>;
diff --git a/arch/arm/boot/dts/r8a7740-armadillo800eva.dts b/arch/arm/boot/dts/r8a7740-armadillo800eva.dts
index ab7034f2f9fc157c..f052f8bade5d9c78 100644
--- a/arch/arm/boot/dts/r8a7740-armadillo800eva.dts
+++ b/arch/arm/boot/dts/r8a7740-armadillo800eva.dts
@@ -180,6 +180,8 @@ &ether {
 	status = "okay";
 
 	phy0: ethernet-phy@0 {
+		compatible = "ethernet-phy-id0007.c0f1",
+			     "ethernet-phy-ieee802.3-c22";
 		reg = <0>;
 	};
 };
-- 
2.25.1

