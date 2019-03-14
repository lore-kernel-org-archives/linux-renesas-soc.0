Return-Path: <SRS0=FDtJ=RR=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD054C43381
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 14 Mar 2019 08:45:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B1B922184E
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 14 Mar 2019 08:45:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727300AbfCNIpy (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 14 Mar 2019 04:45:54 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:58673 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727152AbfCNIpy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 14 Mar 2019 04:45:54 -0400
X-IronPort-AV: E=Sophos;i="5.58,477,1544454000"; 
   d="scan'208";a="10141356"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 14 Mar 2019 17:45:52 +0900
Received: from be1yocto.ree.adwin.renesas.com (unknown [172.29.43.62])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id EC3204038F0F;
        Thu, 14 Mar 2019 17:45:49 +0900 (JST)
From:   Biju Das <biju.das@bp.renesas.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Biju Das <biju.das@bp.renesas.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org,
        Simon Horman <horms@verge.net.au>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 5/7] arm64: defconfig: enable TYPEC_HD3SS3220 config option
Date:   Thu, 14 Mar 2019 08:39:33 +0000
Message-Id: <1552552775-51667-6-git-send-email-biju.das@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1552552775-51667-1-git-send-email-biju.das@bp.renesas.com>
References: <1552552775-51667-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Enable support for the TI HD3SS320 USB Type-C DRP Port controller driver
by turning on CONFIG_TYPEC and CONFIG_TYPEC_HD3SS3220 as modules.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
---
V1-->V2
  * No change
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index c5ec86c..d72e0bc 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -565,6 +565,8 @@ CONFIG_USB_ULPI=y
 CONFIG_USB_GADGET=y
 CONFIG_USB_RENESAS_USBHS_UDC=m
 CONFIG_USB_RENESAS_USB3=m
+CONFIG_TYPEC=m
+CONFIG_TYPEC_HD3SS3220=m
 CONFIG_MMC=y
 CONFIG_MMC_BLOCK_MINORS=32
 CONFIG_MMC_ARMMMCI=y
-- 
2.7.4

