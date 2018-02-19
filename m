Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pg0-f42.google.com ([74.125.83.42]:37462 "EHLO
        mail-pg0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752389AbeBSLtp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Feb 2018 06:49:45 -0500
Received: by mail-pg0-f42.google.com with SMTP id o1so5766323pgn.4
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Feb 2018 03:49:45 -0800 (PST)
From: Magnus Damm <magnus.damm@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Magnus Damm <magnus.damm@gmail.com>
Date: Mon, 19 Feb 2018 20:49:33 +0900
Message-Id: <151904097369.30541.12132732484797103163.sendpatchset@little-apple>
Subject: [PATCH 00/02] ARM: dts: silk: Add EEPROM and GPIO keys
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

ARM: dts: silk: Add EEPROM and GPIO keys

[PATCH 01/02] ARM: dts: silk: Add r1ex24002 EEPROM to DT
[PATCH 02/02] ARM: dts: silk: Add GPIO keys to DT

This series updates the DTS for the R-Car E2-based Silk board to support an
EEPROM connected via I2C and GPIO based tactile switches. Based on the Gose
board support and adjusted to fit the board schematics.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 Developed on top of renesas-devel-20180215-v4.16-rc1

 arch/arm/boot/dts/r8a7794-silk.dts |   61 ++++++++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)
