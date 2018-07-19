Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pl0-f67.google.com ([209.85.160.67]:42052 "EHLO
        mail-pl0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726475AbeGSMbl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 19 Jul 2018 08:31:41 -0400
Received: by mail-pl0-f67.google.com with SMTP id z7-v6so1775363plo.9
        for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Jul 2018 04:48:54 -0700 (PDT)
From: Magnus Damm <magnus.damm@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Magnus Damm <magnus.damm@gmail.com>
Date: Thu, 19 Jul 2018 20:50:57 +0900
Message-Id: <153200105784.13504.12882377600823578834.sendpatchset@little-apple>
Subject: [PATCH/RFC 00/02] ravb: Duplex handling update
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

ravb: Duplex handling update

[PATCH/RFC 01/02] ravb: Do not announce 100Mbps HDX as supported
[PATCH/RFC 02/02] ravb: Clean up duplex handling

This series contains prototype-level code to update the Ethernet-AVB
driver to improve duplex handling.

Based on the latest data sheet for R-Car Gen3 [1] and R-Car Gen2 [2]
the following information is part of the EthernetAVB-IF overview page:

Transfer speed: Supports transfer at 100 and 1000 Mbps
Mode: Full-duplex mode

It seems that the driver implementation is not matching the information
provided in the friendly data sheet, and on top of this during run-time
when changing PHY configuration of the link partner the Ethernet-AVB PHY
seems to want to announce unsupported modes.

[1] R-Car Series, 3rd Generation Rev.1.00 (Apr 2018)
[2] R-Car Series, 2nd Generation Rev.2.00 (Feb 2016)

Not suitable for upstream merge yet - needs more discussion.

Not-Yet-Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 Written on top of renesas-drivers-2018-07-17-v4.18-rc5

 drivers/net/ethernet/renesas/ravb.h      |    1 -
 drivers/net/ethernet/renesas/ravb_main.c |   30 +++---------------------------
 2 files changed, 3 insertions(+), 28 deletions(-)
