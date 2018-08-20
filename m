Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pl0-f68.google.com ([209.85.160.68]:44576 "EHLO
        mail-pl0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726010AbeHTSPj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Aug 2018 14:15:39 -0400
Received: by mail-pl0-f68.google.com with SMTP id ba4-v6so7252582plb.11
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Aug 2018 07:59:40 -0700 (PDT)
From: Magnus Damm <magnus.damm@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Magnus Damm <magnus.damm@gmail.com>
Date: Mon, 20 Aug 2018 23:59:36 +0900
Message-Id: <153477717610.16950.5787705338176325405.sendpatchset@octo>
Subject: [PATCH/RFC v2 00/02] ravb: Duplex handling update V2
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

ravb: Duplex handling update V2

[PATCH/RFC v2 01/02] ravb: Do not announce HDX as supported
[PATCH/RFC v2 02/02] ravb: Clean up duplex handling

This series is V2 of prototype-level code to update the Ethernet-AVB
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

Changes since V1:
- Updated patches to reflect input from Sergei and Geert - thanks!

Getting closer to be suitable for upstream merge?

Not-Yet-Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 Written on top of next-20180820

 drivers/net/ethernet/renesas/ravb.h      |    1 -
 drivers/net/ethernet/renesas/ravb_main.c |   24 ++++--------------------
 2 files changed, 4 insertions(+), 21 deletions(-)
