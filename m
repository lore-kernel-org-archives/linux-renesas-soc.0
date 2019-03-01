Return-Path: <SRS0=w5fC=RE=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5B0DC43381
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  1 Mar 2019 11:06:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AEAC420851
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  1 Mar 2019 11:06:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728232AbfCALGG (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 1 Mar 2019 06:06:06 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:38537 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725978AbfCALGG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 1 Mar 2019 06:06:06 -0500
X-IronPort-AV: E=Sophos;i="5.58,427,1544454000"; 
   d="scan'208";a="9011026"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 01 Mar 2019 20:06:04 +0900
Received: from fabrizio-dev.ree.adwin.renesas.com (unknown [10.226.36.184])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 388E24383227;
        Fri,  1 Mar 2019 20:06:01 +0900 (JST)
From:   Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>, ebiharaml@si-linux.co.jp
Subject: [PATCH 0/4] Add USB-HOST support to cat874
Date:   Fri,  1 Mar 2019 11:05:44 +0000
Message-Id: <1551438348-22119-1-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

While trying to add USB-HOST support to the cat874 board,
it came up that of_usb_get_dr_mode_by_phy was selecting
the wrong DT node to use for dr_mode.
Also, drivers/phy/renesas/phy-rcar-gen3-usb2.c was registering
IRQs, no matter the dr_mode.

This series adds all that is required to add USB-HOST support
to the cat874 board, and also removes the hsusb from Draak's DT
as not necessary anymore.

Thanks,
Fab

Fabrizio Castro (4):
  usb: common: Consider only available nodes for dr_mode
  phy: renesas: rcar-gen3-usb2: No need to request IRQ for non-OTG
  arm64: dts: renesas: r8a774c0-cat874: Add USB-HOST support
  arm64: dts: renesas: r8a77995: draak: Remove hsusb node

 arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts | 15 ++++++++++++++
 arch/arm64/boot/dts/renesas/r8a77995-draak.dts  |  5 -----
 drivers/phy/renesas/phy-rcar-gen3-usb2.c        | 26 ++++++++++++-------------
 drivers/usb/common/common.c                     |  2 ++
 4 files changed, 30 insertions(+), 18 deletions(-)

-- 
2.7.4

