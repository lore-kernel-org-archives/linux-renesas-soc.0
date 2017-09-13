Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:64787 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1750949AbdIMMWQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Sep 2017 08:22:16 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: horms@verge.net.au, magnus.damm@gmail.com, robh+dt@kernel.org,
        mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 0/2] arm64: dts: renesas: r8a77995 and draak: add support EthernetAVB
Date: Wed, 13 Sep 2017 21:18:37 +0900
Message-Id: <1505305119-4257-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch is based on the renesas-drivers.git /
renesas-drivers-2017-09-05-v4.13 tag.

Yoshihiro Shimoda (2):
  arm64: dts: renesas: r8a77995: Add EthernetAVB device node
  arm64: dts: renesas: r8a77995: draak: enable EthernetAVB

 arch/arm64/boot/dts/renesas/r8a77995-draak.dts | 25 ++++++++++++++
 arch/arm64/boot/dts/renesas/r8a77995.dtsi      | 45 ++++++++++++++++++++++++++
 2 files changed, 70 insertions(+)

-- 
1.9.1
