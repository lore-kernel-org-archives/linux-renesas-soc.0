Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pg0-f67.google.com ([74.125.83.67]:34162 "EHLO
        mail-pg0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750916AbeDVKHV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 22 Apr 2018 06:07:21 -0400
Received: by mail-pg0-f67.google.com with SMTP id p10so6356429pgn.1
        for <linux-renesas-soc@vger.kernel.org>; Sun, 22 Apr 2018 03:07:21 -0700 (PDT)
From: Magnus Damm <magnus.damm@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: horms+renesas@verge.net.au, Magnus Damm <magnus.damm@gmail.com>
Date: Sun, 22 Apr 2018 19:08:06 +0900
Message-Id: <152439168688.19829.5853068596124565316.sendpatchset@little-apple>
Subject: [PATCH 00/04] arm64: dts: renesas: Enable IPMMU devices
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

arm64: dts: renesas: Enable IPMMU devices

[PATCH 01/04] arm64: dts: renesas: r8a7795: Enable IPMMU devices
[PATCH 02/04] arm64: dts: renesas: r8a7796: Enable IPMMU devices
[PATCH 03/04] arm64: dts: renesas: r8a77970: Enable IPMMU devices
[PATCH 04/04] arm64: dts: renesas: r8a77995: Enable IPMMU devices

Following the policy of using DT to describe the hardware and not software
support state, this series makes sure all IPMMU devices are enabled in DT
for SoCs such as r8a7795, r8a7796, r8a77970 and r8a77995. 

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 Developed on top of renesas-devel-20180420-v4.17-rc1

 arch/arm64/boot/dts/renesas/r8a7795.dtsi  |   12 ------------
 arch/arm64/boot/dts/renesas/r8a7796.dtsi  |    5 -----
 arch/arm64/boot/dts/renesas/r8a77970.dtsi |    2 --
 arch/arm64/boot/dts/renesas/r8a77995.dtsi |   10 ----------
 4 files changed, 29 deletions(-)
