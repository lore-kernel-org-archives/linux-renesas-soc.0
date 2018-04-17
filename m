Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:46709 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751252AbeDQIur (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Apr 2018 04:50:47 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, netdev@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH/RFC net-next 0/5] ravb: updates
Date: Tue, 17 Apr 2018 10:50:25 +0200
Message-Id: <20180417085030.32650-1-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Sergei,

this series is composed of otherwise unrelated RAVB patches from the R-Car
BSP v3.6.2 which at a first pass seem worth considering for upstream.

I would value your feedback on these patches so they can either proceed
into net-next or remain local to the BSP.

Thanks!

Kazuya Mizuguchi (4):
  ravb: correct ptp does failure after suspend and resume
  ravb: do not write 1 to reserved bits
  ravb: remove undocumented processing
  ravb: remove tx buffer addr 4byte alilgnment restriction for R-Car
    Gen3

Masaru Nagai (1):
  ravb: fix inconsistent lock state at enabling tx timestamp

 drivers/net/ethernet/renesas/ravb.h      |  23 +++-
 drivers/net/ethernet/renesas/ravb_main.c | 192 ++++++++++++++++---------------
 drivers/net/ethernet/renesas/ravb_ptp.c  |   2 +-
 3 files changed, 117 insertions(+), 100 deletions(-)

-- 
2.11.0
