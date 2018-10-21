Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pl1-f193.google.com ([209.85.214.193]:44364 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727688AbeJVB3Z (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 21 Oct 2018 21:29:25 -0400
Received: by mail-pl1-f193.google.com with SMTP id d23-v6so4541072pls.11
        for <linux-renesas-soc@vger.kernel.org>; Sun, 21 Oct 2018 10:14:26 -0700 (PDT)
From: Magnus Damm <magnus.damm@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Magnus Damm <magnus.damm@gmail.com>
Date: Mon, 22 Oct 2018 02:14:34 +0900
Message-Id: <154014207424.4344.6894320987219157257.sendpatchset@octo>
Subject: [PATCH 00/03] Connect R-Car Gen3 Ethernet-AVB to IPMMU
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Connect R-Car Gen3 Ethernet-AVB to IPMMU

[PATCH 01/03] arm64: dts: renesas: r8a77965: Connect R-Car M3-N AVB to IPMMU
[PATCH 02/03] arm64: dts: renesas: r8a77980: Connect R-Car V3H AVB to IPMMU
[PATCH 03/03] arm64: dts: renesas: r8a77990: Connect R-Car E3 AVB to IPMMU

For each SoC describe Ethernet-AVB to IPMMU hardware connection in the
Device Tree. This series affects R-Car M3-N, V3H and E3. Other members
of the R-Car Gen3 family such as H3, M3-W, V3M and D3 already includes
this information in their DT files.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 Developed on top of renesas-devel-20181019-v4.19-rc8

 arch/arm64/boot/dts/renesas/r8a77965.dtsi |    1 +
 arch/arm64/boot/dts/renesas/r8a77980.dtsi |    1 +
 arch/arm64/boot/dts/renesas/r8a77990.dtsi |    1 +
 3 files changed, 3 insertions(+)
