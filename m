Return-Path: <SRS0=qJci=OX=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A1D3C67839
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 14 Dec 2018 09:10:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3837E204FD
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 14 Dec 2018 09:10:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3837E204FD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-renesas-soc-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726494AbeLNJK0 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 14 Dec 2018 04:10:26 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:34099 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726344AbeLNJK0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 14 Dec 2018 04:10:26 -0500
X-IronPort-AV: E=Sophos;i="5.56,352,1539615600"; 
   d="scan'208";a="2629699"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 14 Dec 2018 18:10:24 +0900
Received: from fabrizio-dev.ree.adwin.renesas.com (unknown [10.226.37.69])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 1416B401C56C;
        Fri, 14 Dec 2018 18:10:21 +0900 (JST)
From:   Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH 0/9] RZ/G2E basic device tree
Date:   Fri, 14 Dec 2018 09:10:04 +0000
Message-Id: <1544778613-24279-1-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Dear All,

this series adds a basic dtsi for the RZ/G2E (a.k.a. r8a774c0).

Thanks,
Fab

Fabrizio Castro (9):
  arm64: dts: renesas: Initial device tree for r8a774c0
  arm64: dts: renesas: r8a774c0: Add SYS-DMAC controller nodes
  arm64: dts: renesas: r8a774c0: Add SCIF and HSCIF nodes
  arm64: dts: renesas: r8a774c0: Add INTC-EX device node
  arm64: dts: renesas: r8a774c0: Add PFC support
  arm64: dts: renesas: r8a774c0: Add GPIO device nodes
  arm64: dts: renesas: r8a774c0: Add Ethernet AVB node
  arm64: dts: renesas: r8a774c0: Add watchdog support
  arm64: dts: renesas: r8a774c0: Add secondary CA53 CPU core

 arch/arm64/boot/dts/renesas/r8a774c0.dtsi | 649 ++++++++++++++++++++++++++++++
 1 file changed, 649 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a774c0.dtsi

-- 
2.7.4

