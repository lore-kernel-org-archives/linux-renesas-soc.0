Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pl1-f193.google.com ([209.85.214.193]:41385 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726016AbeKUVyv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 21 Nov 2018 16:54:51 -0500
From: Magnus Damm <magnus.damm@gmail.com>
To: netdev@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>, davem@davemloft.net,
        sergei.shtylyov@cogentembedded.com
Date: Wed, 21 Nov 2018 20:21:08 +0900
Message-Id: <154279926877.10272.700833429936129422.sendpatchset@octo>
Subject: [PATCH v3 00/02] ravb: Duplex handling update V3
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

ravb: Duplex handling update V3

[PATCH v3 01/02] ravb: Do not announce HDX as supported
[PATCH v3 02/02] ravb: Clean up duplex handling

This series is V3 of duplex handling improvements for the Ethernet-AVB driver.

Previous versions of this series have been posted to linux-renesas-soc as RFC
so V3 is the first actual version to make it to netdev.

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

Changes since V2:
- Updated patch 1/2 to make use of phy_remove_link_mode()
- Added Reviewed-by from Sergei - thanks!

Changes since V1:
- Updated patches to reflect input from Sergei and Geert - thanks!

Fixes: c156633f1353 ("Renesas Ethernet AVB driver proper")
Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
Reviewed-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
---

 Applies on top of next-20181121

 drivers/net/ethernet/renesas/ravb.h      |    1 -
 drivers/net/ethernet/renesas/ravb_main.c |   23 +++++------------------
 2 files changed, 5 insertions(+), 19 deletions(-)
