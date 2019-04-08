Return-Path: <SRS0=yOlw=SK=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E96CFC282CE
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  8 Apr 2019 08:32:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AD3F120880
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  8 Apr 2019 08:32:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="TICC0Ckv"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725877AbfDHIcC (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 8 Apr 2019 04:32:02 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:48511 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726417AbfDHIcC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 8 Apr 2019 04:32:02 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 9C59725B766;
        Mon,  8 Apr 2019 18:32:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1554712320; bh=dsCQNbXkHXJ9afVPCeXEgmHgsXm3zIfGnXY+drm0QG4=;
        h=From:To:Cc:Subject:Date:From;
        b=TICC0Ckv/NJh0hf89NWyRRbMFGRJkarYQM2J1UOk0hv9dACt+7ILYhI+uVOpnx3t7
         ysBuvXLrfCN44OjXRwtLK6E1ULJPQ8shPSUsz2TqzsanbuUz0TnlES/HPxeNNXZht6
         NEl+t/CK6o6q0kuWc6F2yjMRs3wCeAKcfN/9qveI=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 89A4394069B; Mon,  8 Apr 2019 10:31:58 +0200 (CEST)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH/RFC] arm64: dts: renesas: ebisu, draak: Limit EtherAVB to 100Mbps
Date:   Mon,  8 Apr 2019 10:31:48 +0200
Message-Id: <20190408083148.23134-1-horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

* According to the R-Car Gen3 Hardware Manual Errata for Rev 1.00 of
  August 24, 2018, the TX clock internal delay mode isn't supported
  on R-Car E3 (r8a77990) and D3 (r8a77995).

* TX clock internal delay mode is required for reliable 1Gbps communication
  using the KSZ9031RNX phy present on the Ebisu and Draak boards.

Thus, the E3 based Ebisu and D3 based Draak boards reliably use 1Gbps and
the speed should be limited to 100Mbps.

Based on work by Kazuya Mizuguchi.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts | 1 +
 arch/arm64/boot/dts/renesas/r8a77995-draak.dts | 1 +
 2 files changed, 2 insertions(+)

 Based on renesas-devel-20190404-v5.1-rc3

diff --git a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
index c72772589953..05214b8dd2c5 100644
--- a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
@@ -272,6 +272,7 @@
 		interrupt-parent = <&gpio2>;
 		interrupts = <21 IRQ_TYPE_LEVEL_LOW>;
 		reset-gpios = <&gpio1 20 GPIO_ACTIVE_LOW>;
+		max-speed = <100>;
 	};
 };
 
diff --git a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
index a7dc11e36fd9..80d82bd047fd 100644
--- a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
@@ -175,6 +175,7 @@
 		reg = <0>;
 		interrupt-parent = <&gpio5>;
 		interrupts = <19 IRQ_TYPE_LEVEL_LOW>;
+		max-speed = <100>;
 	};
 };
 
-- 
2.11.0

