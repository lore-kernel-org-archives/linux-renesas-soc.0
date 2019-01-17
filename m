Return-Path: <SRS0=aD2s=PZ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDD1EC43612
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 17 Jan 2019 11:08:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9CA5920657
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 17 Jan 2019 11:08:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728260AbfAQLIG (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 17 Jan 2019 06:08:06 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:15966 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725990AbfAQLIF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Jan 2019 06:08:05 -0500
X-IronPort-AV: E=Sophos;i="5.56,488,1539615600"; 
   d="scan'208";a="5246345"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 17 Jan 2019 20:08:03 +0900
Received: from localhost.localdomain (unknown [10.166.17.210])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id BDCB944A15F3;
        Thu, 17 Jan 2019 20:08:03 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     andrew@lunn.ch, f.fainelli@gmail.com, davem@davemloft.net
Cc:     netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v3/RFT 0/2] net: phy: assert the phy reset during suspended if phy is not attached
Date:   Thu, 17 Jan 2019 20:05:07 +0900
Message-Id: <1547723109-28792-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 1.9.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch series is for R-Car Gen3 Salvator-XS boards. If we do
the following method, the phy cannot link up correctly.

 1) Kernel boots by using initramfs.
 --> No open the nic, so phy_device_register() and phy_probe()
     deasserts the reset.
 2) Kernel enters the suspend.
 --> So, keep the reset signal as deassert.
 --> On R-Car Salvator-XS board, unfortunately, the board power is
     turned off.
 3) Kernel returns from suspend.
 4) ifconfig eth0 up
 --> Then, since edge signal of the reset doesn't happen,
     it cannot link up.
 5) ifconfig eth0 down
 6) ifconfig eth0 up
 --> In this case, it can link up.

Changes from v2:
 - Rebase on the latest net-next.
 - More generic code instead of micrel phy only code
   (https://www.spinics.net/lists/netdev/msg540462.html).
   So, I marked this patch series as RFT.

Changes from v1 (as RFC):
 - No remove the current code of phy_device.c to avoid any side effects.
 - Fix the mdio_bus_phy_resume() in phy_device.c.
 - Add toggling the phy reset in micrel.c if the PHY is not attached.


Yoshihiro Shimoda (2):
  net: phy: Fix not to call phy_resume() if PHY is not attached
  net: phy: assert the phy reset during suspended if phy is not attached

 drivers/net/phy/phy_device.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

-- 
1.9.1

