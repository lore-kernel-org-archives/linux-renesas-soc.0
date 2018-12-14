Return-Path: <SRS0=qJci=OX=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 993D9C6786C
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 14 Dec 2018 09:37:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6166420672
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 14 Dec 2018 09:37:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6166420672
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-renesas-soc-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729197AbeLNJht (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 14 Dec 2018 04:37:49 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:26889 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727693AbeLNJhs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 14 Dec 2018 04:37:48 -0500
X-IronPort-AV: E=Sophos;i="5.56,352,1539615600"; 
   d="scan'208";a="2632412"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 14 Dec 2018 18:37:47 +0900
Received: from fabrizio-dev.ree.adwin.renesas.com (unknown [10.226.37.69])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id B8E56406B147;
        Fri, 14 Dec 2018 18:37:44 +0900 (JST)
From:   Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH 00/17] Add more support for the RZ/G2E
Date:   Fri, 14 Dec 2018 09:37:23 +0000
Message-Id: <1544780260-27590-1-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Dear All,

this series adds more support to the RZ/G2E (a.k.a. r8a774c0)
SoC specific device tree on top of what added from series
(on which this series depends on):
https://www.mail-archive.com/linux-renesas-soc@vger.kernel.org/msg36692.html

Thanks,
Fab

Fabrizio Castro (17):
  arm64: dts: renesas: r8a774c0: Add SDHI nodes
  arm64: dts: renesas: r8a774c0: Add I2C and IIC-DVFS support
  arm64: dts: renesas: r8a774c0: Add IPMMU device nodes
  arm64: dts: renesas: r8a774c0: Add CAN nodes
  arm64: dts: renesas: r8a774c0: Add thermal support
  arm64: dts: renesas: r8a774c0: Add MSIOF nodes
  arm64: dts: renesas: r8a774c0: Add audio support
  arm64: dts: renesas: r8a774c0: Add PWM support
  arm64: dts: renesas: r8a774c0: Add display output support
  arm64: dts: renesas: r8a774c0: Add USB2.0 phy and host device nodes
  arm64: dts: renesas: r8a774c0: Add USB-DMAC and HSUSB device nodes
  arm64: dts: renesas: r8a774c0: Add USB3.0 device nodes
  arm64: dts: renesas: r8a774c0: Connect RZ/G2E SYS-DMAC to IPMMU
  arm64: dts: renesas: r8a774c0: Connect RZ/G2E AVB to IPMMU
  arm64: dts: renesas: r8a774c0: Connect RZ/G2E Audio-DMAC to IPMMU
  arm64: dts: renesas: r8a774c0: Add PCIe device node
  arm64: dts: renesas: r8a774c0: Add VIN and CSI-2 device nodes

 arch/arm64/boot/dts/renesas/r8a774c0.dtsi | 1099 +++++++++++++++++++++++++++++
 1 file changed, 1099 insertions(+)

-- 
2.7.4

