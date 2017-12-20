Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pg0-f67.google.com ([74.125.83.67]:37862 "EHLO
        mail-pg0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752886AbdLTMYs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 20 Dec 2017 07:24:48 -0500
Received: by mail-pg0-f67.google.com with SMTP id o13so1116507pgp.4
        for <linux-renesas-soc@vger.kernel.org>; Wed, 20 Dec 2017 04:24:48 -0800 (PST)
From: Magnus Damm <magnus.damm@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Magnus Damm <magnus.damm@gmail.com>
Date: Wed, 20 Dec 2017 21:23:45 +0900
Message-Id: <151377262568.17613.8610167192375932687.sendpatchset@little-apple>
Subject: [PATCH/RFC 00/03] iommu/ipmmu-vmsa: IPMMU prototyping on r8a77965
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

iommu/ipmmu-vmsa: IPMMU prototyping on r8a77965

[PATCH/RFC 01/03] arm64: dts: r8a77965: Enable IPMMU MM, DS0 and DS1
[PATCH/RFC 02/03] iommu/ipmmu-vmsa: Detect r8a77965 compat strings
[PATCH/RFC 03/03] iommu/ipmmu-vmsa: Add SYS-DMAC devices as whitelist

This series contain a few trivial modifications to the r8a77965 (R-Car M3-N)
prototype environment and the IPMMU driver. The goal is to try out some basic
features of the IPMMU hardware on the r8a77965 Salvator-X board.

At this point this is just a bunch of prototype patches. More effort is
needed to upstream support for the r8a77965 SoC and the IPMMU patches.

Not-Yet-Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 Built on top of "renesas-drivers-next-2017-11-14-v4.14" and
 [PATCH/RFC] arm64: r8a77965 Salvator-X SoC/board support prototype
 [PATCH/RFC] arm64: r8a77965 Salvator-X IPMMU environment prototype

 arch/arm64/boot/dts/renesas/r8a77965.dtsi |    3 ---
 drivers/iommu/ipmmu-vmsa.c                |   13 +++++++++++++
 2 files changed, 13 insertions(+), 3 deletions(-)
