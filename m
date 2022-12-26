Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB679C46467
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 26 Dec 2022 07:14:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231580AbiLZHOh (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 26 Dec 2022 02:14:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229643AbiLZHOf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 26 Dec 2022 02:14:35 -0500
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 8CFD62BF2;
        Sun, 25 Dec 2022 23:14:33 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.96,274,1665414000"; 
   d="scan'208";a="144515781"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 26 Dec 2022 16:14:32 +0900
Received: from localhost.localdomain (unknown [10.166.15.32])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id DF19A4003FA1;
        Mon, 26 Dec 2022 16:14:32 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     linux@armlinux.org.uk, andrew@lunn.ch, hkallweit1@gmail.com,
        davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com
Cc:     netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH net-next 0/3] net: ethernet: renesas: rswitch: Modify initialization for SERDES and PHY
Date:   Mon, 26 Dec 2022 16:14:22 +0900
Message-Id: <20221226071425.3895915-1-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The patch [1/3] sets phydev->host_interfaces by phylink for Marvell PHY
driver (marvell10g) to initialize the MACTYPE.

The patch [2/3] siplifies the rswitch driver, and [3/3] adds
phy_power_on() calling to initialize the Ethernet SERDES PHY driver
(r8a779f0-eth-serdes) for each channel.

Yoshihiro Shimoda (3):
  net: phylink: Set host_interfaces for a non-sfp PHY
  net: ethernet: renesas: rswitch: Simplify struct phy * handling
  net: ethernet: renesas: rswitch: Add phy_power_{on,off}() calling

 drivers/net/ethernet/renesas/rswitch.c | 48 ++++++++++++++------------
 drivers/net/ethernet/renesas/rswitch.h |  1 +
 drivers/net/phy/phylink.c              |  1 +
 3 files changed, 28 insertions(+), 22 deletions(-)

-- 
2.25.1

