Return-Path: <SRS0=E4fS=PS=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E6D8C43612
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 10 Jan 2019 13:39:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E23E22173B
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 10 Jan 2019 13:39:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728810AbfAJNjZ (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 10 Jan 2019 08:39:25 -0500
Received: from andre.telenet-ops.be ([195.130.132.53]:36182 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727847AbfAJNjZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Jan 2019 08:39:25 -0500
Received: from ramsan ([84.194.111.163])
        by andre.telenet-ops.be with bizsmtp
        id NdfM1z00X3XaVaC01dfMLX; Thu, 10 Jan 2019 14:39:23 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1ghaYL-0004sI-PL; Thu, 10 Jan 2019 14:39:21 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1ghaYL-0005ZI-Mo; Thu, 10 Jan 2019 14:39:21 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 0/5] arm64: dts: renesas: Enable DMA for SCIF2 where missing
Date:   Thu, 10 Jan 2019 14:39:12 +0100
Message-Id: <20190110133917.21353-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi Simon, Magnus,

R-Car Gen3 Hardware User Manual Rev. 1.50 (finally) documents DMA
support for the SCIF2 serial port on R-Car H3, M3-W, M3-N, E3, and D3
(albeit with the wrong MID/RID, due to a hex-vs-dec mix-up).

This patch series enables DMA for the SCIF2 serial ports on R-Car Gen3
and RZ/G2 SoCs that do not have DMA enabled yet.  It consists of 5
separate patches, one for each SoC, to ease backporting.

Changes compared to v1:
  - Add Fixes tags where appropriate.

This has been tested on R-Car M3-W, M3-N, and E3.

Thanks!

Geert Uytterhoeven (5):
  arm64: dts: renesas: r8a774a1: Enable DMA for SCIF2
  arm64: dts: renesas: r8a774c0: Enable DMA for SCIF2
  arm64: dts: renesas: r8a7796: Enable DMA for SCIF2
  arm64: dts: renesas: r8a77965: Enable DMA for SCIF2
  arm64: dts: renesas: r8a77990: Enable DMA for SCIF2

 arch/arm64/boot/dts/renesas/r8a774a1.dtsi | 3 +++
 arch/arm64/boot/dts/renesas/r8a774c0.dtsi | 3 +++
 arch/arm64/boot/dts/renesas/r8a7796.dtsi  | 3 +++
 arch/arm64/boot/dts/renesas/r8a77965.dtsi | 3 +++
 arch/arm64/boot/dts/renesas/r8a77990.dtsi | 4 +++-
 5 files changed, 15 insertions(+), 1 deletion(-)

-- 
2.17.1

