Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail.free-electrons.com ([62.4.15.54]:52432 "EHLO
        mail.free-electrons.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753594AbdLDNjH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 Dec 2017 08:39:07 -0500
From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
To: "David S. Miller" <davem@davemloft.net>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: [PATCH 0/2] net: sh_eth: DMA mapping API fixes
Date: Mon,  4 Dec 2017 14:33:25 +0100
Message-Id: <20171204133327.3505-1-thomas.petazzoni@free-electrons.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello,

Here are two patches that fix how the sh_eth driver is using the DMA
mapping API: a bogus struct device is used in some places, or a NULL
struct device is used.

Best regards,

Thomas

Thomas Petazzoni (2):
  net: sh_eth: use correct "struct device" when calling DMA mapping
    functions
  net: sh_eth: don't use NULL as "struct device" for the DMA mapping API

 drivers/net/ethernet/renesas/sh_eth.c | 31 ++++++++++++++++---------------
 1 file changed, 16 insertions(+), 15 deletions(-)

-- 
2.13.6
