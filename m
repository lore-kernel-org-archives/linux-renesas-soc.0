Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:49327 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1750760AbdJBGdj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 2 Oct 2017 02:33:39 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: horms@verge.net.au, magnus.damm@gmail.com, robh+dt@kernel.org,
        mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 0/3] arm64: dts: renesas: r8a7795: salvator-xs: enable USB2.0 host channel 3
Date: Mon,  2 Oct 2017 15:29:46 +0900
Message-Id: <1506925789-19392-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch set is based on the latest renesas.git /
renesas-devel-20170928-v4.14-rc2 tag.

Yoshihiro Shimoda (3):
  arm64: dts: renesas: r8a7795: salvator-xs: enable USB2.0 phy channel 3
  arm64: dts: renesas: r8a7795: salvator-xs: enable USB2.0 Host channel
    3
  arm64: dts: renesas: r8a7795: salvator-xs: enable HS-USB channel 3

 .../arm64/boot/dts/renesas/r8a7795-salvator-xs.dts | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)

-- 
1.9.1
