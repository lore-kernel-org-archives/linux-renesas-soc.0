Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pl0-f67.google.com ([209.85.160.67]:40038 "EHLO
        mail-pl0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752255AbeDRUOv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 18 Apr 2018 16:14:51 -0400
Received: by mail-pl0-f67.google.com with SMTP id t22-v6so1772207plo.7
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Apr 2018 13:14:51 -0700 (PDT)
From: Yoshihiro Kaneko <ykaneko0929@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/5] arm64: dts: renesas: r8a779xx: sort nodes
Date: Thu, 19 Apr 2018 05:14:35 +0900
Message-Id: <1524082480-18163-1-git-send-email-ykaneko0929@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Sort nodes of the R-Car M3-N (r8a77965), V3M (r8a77970) and D3 (r8a77995) DTs.

This is part of an ongoing effort to provide consistent node
order in the DT of Renesas SoCs to improve maintainability.

This should not have any run-time effect.

Based on the devel branch of Simon Horman's renesas tree.

Yoshihiro Kaneko (5):
  arm64: dts: renesas: r8a77995: sort subnodes of the root node
  arm64: dts: renesas: r8a77995: sort subnodes of the soc node
  arm64: dts: renesas: r8a77965: sort subnodes of the root node
  arm64: dts: renesas: r8a77965: sort subnodes of the soc node
  arm64: dts: renesas: r8a77970: sort subnodes of the soc node

 arch/arm64/boot/dts/renesas/r8a77965.dtsi | 1160 ++++++++++++++---------------
 arch/arm64/boot/dts/renesas/r8a77970.dtsi |  378 +++++-----
 arch/arm64/boot/dts/renesas/r8a77995.dtsi |  717 +++++++++---------
 3 files changed, 1127 insertions(+), 1128 deletions(-)

-- 
1.9.1
