Return-Path: <SRS0=TFpS=RJ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76DC5C43381
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  6 Mar 2019 09:13:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4B2682064A
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  6 Mar 2019 09:13:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729307AbfCFJNS (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 6 Mar 2019 04:13:18 -0500
Received: from relmlor1.renesas.com ([210.160.252.171]:58580 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726391AbfCFJNS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 6 Mar 2019 04:13:18 -0500
X-IronPort-AV: E=Sophos;i="5.58,447,1544454000"; 
   d="scan'208";a="9597916"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 06 Mar 2019 18:13:15 +0900
Received: from be1yocto.ree.adwin.renesas.com (unknown [172.29.43.62])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 036114209848;
        Wed,  6 Mar 2019 18:13:11 +0900 (JST)
From:   Biju Das <biju.das@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Felipe Balbi <balbi@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Biju Das <biju.das@bp.renesas.com>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, Simon Horman <horms@verge.net.au>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH 0/9] Add USB3.0 and TI HD3SS3220 driver support
Date:   Wed,  6 Mar 2019 09:07:17 +0000
Message-Id: <1551863246-11656-1-git-send-email-biju.das@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This series adds USB 3.0 support for the CAT874 platform, including a
new driver for the TI HD3SS3220 USB Type-C DRP port controller.

This patch series supports:
1) Host hotplug operation
2) Device hot plug operation
3) USB type-C data_role switch 
   (Tested with 2 RZ/G2E boards connected with a Type-C cable)

This patchset is based on usb_next and renesas-devel-20190304-v5.0 branch.

Biju Das (9):
  dt-bindings: usb: hd3ss3220 device tree binding document
  dt-bindings: usb: renesas_usb3: add extcon support
  usb: typec: driver for TI HD3SS3220 USB Type-C DRP port controller
  usb: gadget: udc: renesas_usb3: use extcon framework to receive
    connect/disconnect
  arm64: defconfig: enable TYPEC_HD3SS3220 config option
  arm64: renesas_defconfig: Enable TYPEC_HD3SS3220 config option
  arm64: dts: renesas: r8a774c0-cat874: enable USB3.0 host/peripheral
    device node
  arm64: dts: renesas: r8a774c0-cat874: Enable TI HD3SS3220 support
  arm64: dts: renesas: r8a774c0-cat874: Enable extcon support

 .../devicetree/bindings/usb/renesas_usb3.txt       |   2 +
 .../devicetree/bindings/usb/ti,hd3ss3220.txt       |  15 ++
 arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts    |  31 +++
 arch/arm64/configs/defconfig                       |   2 +
 arch/arm64/configs/renesas_defconfig               |   2 +
 drivers/usb/gadget/udc/renesas_usb3.c              | 115 +++++++--
 drivers/usb/typec/Kconfig                          |  10 +
 drivers/usb/typec/Makefile                         |   1 +
 drivers/usb/typec/hd3ss3220.c                      | 284 +++++++++++++++++++++
 9 files changed, 446 insertions(+), 16 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/ti,hd3ss3220.txt
 create mode 100644 drivers/usb/typec/hd3ss3220.c

-- 
2.7.4

