Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:41492 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752899AbdBMPT1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Feb 2017 10:19:27 -0500
From: Simon Horman <horms+renesas@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [GIT PULL FOR renesas-drivers] ravb: Support 1Gbps on R-Car H3 ES1.1+ and R-Car M3-W
Date: Mon, 13 Feb 2017 16:19:04 +0100
Message-Id: <1486999144-23537-1-git-send-email-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

this series adds support for gigabit communication to the Renesas EthernetAVB
controller when used in conjunction with  R-Car Gen3 H3 ES1.1+ and M3-W SoCs.
Gigabit is already supported with R-Car Gen 2 SoCs.

These patches are now include in net-next and expected to appear in v4.11.

The base of the series is the head of next-next at the time the patches
were submitted for inclusion there.


The following changes since commit 158f323b9868b59967ad96957c4ca388161be321:

  net: adjust skb->truesize in pskb_expand_head() (2017-01-27 12:03:29 -0500)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git topic/ravb-gigabit-driver-v2

for you to fetch changes up to 3c409b068cdc2e9f59982b735b081aaa98f648c9:

  ravb: Support 1Gbps on R-Car H3 ES1.1+ and R-Car M3-W (2017-01-27 20:44:19 +0100)

----------------------------------------------------------------
Geert Uytterhoeven (1):
      ravb: Support 1Gbps on R-Car H3 ES1.1+ and R-Car M3-W

Kazuya Mizuguchi (1):
      ravb: Add tx and rx clock internal delays mode of APSR

 drivers/net/ethernet/renesas/ravb.h      | 10 ++++++++++
 drivers/net/ethernet/renesas/ravb_main.c | 33 ++++++++++++++++++++++++++++++--
 2 files changed, 41 insertions(+), 2 deletions(-)
