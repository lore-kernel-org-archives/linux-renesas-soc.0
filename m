Return-Path: <SRS0=drmD=QA=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 951F0C282C5
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 24 Jan 2019 16:40:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 67A9A2184C
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 24 Jan 2019 16:40:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727573AbfAXQkd (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 24 Jan 2019 11:40:33 -0500
Received: from michel.telenet-ops.be ([195.130.137.88]:48344 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727658AbfAXQkd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 Jan 2019 11:40:33 -0500
Received: from ramsan ([84.194.111.163])
        by michel.telenet-ops.be with bizsmtp
        id UGgU1z0033XaVaC06GgUzQ; Thu, 24 Jan 2019 17:40:30 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1gmi3H-0008GR-Ul; Thu, 24 Jan 2019 17:40:27 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1gmi3H-0002Z5-TV; Thu, 24 Jan 2019 17:40:27 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc:     Chris Brandt <chris.brandt@renesas.com>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/2] ARM: multi_v7_defconfig: Enable support for RZ/A2
Date:   Thu, 24 Jan 2019 17:40:22 +0100
Message-Id: <20190124164022.9810-3-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190124164022.9810-1-geert+renesas@glider.be>
References: <20190124164022.9810-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Enable support for the RZ/A2 SoC, including pin control, now the DTS for
the Renesas RZ/A2M evaluation board is included.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
I didn't bother refreshing multi_v7_defconfig.
---
 arch/arm/configs/multi_v7_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index ffaf5c00f3671d09..dba15b1b30831f08 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -76,6 +76,7 @@ CONFIG_ARCH_ROCKCHIP=y
 CONFIG_ARCH_RENESAS=y
 CONFIG_ARCH_EMEV2=y
 CONFIG_ARCH_R7S72100=y
+CONFIG_ARCH_R7S9210=y
 CONFIG_ARCH_R8A73A4=y
 CONFIG_ARCH_R8A7740=y
 CONFIG_ARCH_R8A7743=y
@@ -404,6 +405,7 @@ CONFIG_SPI_XILINX=y
 CONFIG_SPI_SPIDEV=y
 CONFIG_SPMI=y
 CONFIG_PINCTRL_AS3722=y
+CONFIG_PINCTRL_RZA2=y
 CONFIG_PINCTRL_PALMAS=y
 CONFIG_PINCTRL_APQ8064=y
 CONFIG_PINCTRL_APQ8084=y
-- 
2.17.1

