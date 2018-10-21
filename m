Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pl1-f196.google.com ([209.85.214.196]:44379 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727794AbeJVCgN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 21 Oct 2018 22:36:13 -0400
Received: by mail-pl1-f196.google.com with SMTP id d23-v6so4576072pls.11
        for <linux-renesas-soc@vger.kernel.org>; Sun, 21 Oct 2018 11:21:02 -0700 (PDT)
From: Magnus Damm <magnus.damm@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Magnus Damm <magnus.damm@gmail.com>
Date: Mon, 22 Oct 2018 03:21:11 +0900
Message-Id: <154014607107.1639.11934965040569923.sendpatchset@octo>
Subject: [PATCH 00/03] Further 32-bit product name updates
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Further 32-bit product name updates

[PATCH 01/03] arm: dts: Include SoC name in DTSI for r8a7740
[PATCH 02/03] arm: dts: Include SoC name in DTSI for sh73a0
[PATCH 03/03] arm: dts: Include SoC name in DTSI for sh73a0

Update a couple of SoC DTSI files to include SoC product name. The name is
matching the DT binding documentation.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 Applies on top of renesas-devel-20181019-v4.19-rc8

 arch/arm/boot/dts/emev2.dtsi   |    2 +-
 arch/arm/boot/dts/r8a7740.dtsi |    2 +-
 arch/arm/boot/dts/sh73a0.dtsi  |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)
