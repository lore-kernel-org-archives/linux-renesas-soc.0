Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:37435 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753629AbeAQPmD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 17 Jan 2018 10:42:03 -0500
Received: by mail-wm0-f66.google.com with SMTP id v71so16690983wmv.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 17 Jan 2018 07:42:03 -0800 (PST)
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com, magnus.damm@gmail.com,
        geert@linux-m68k.org, Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Subject: [PATCH 0/2] ZG clock for r8a7796
Date: Wed, 17 Jan 2018 16:41:54 +0100
Message-Id: <1516203716-4606-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi!

This is the revised ZG clock portion of the "r8a7796 bits required for
out-of-tree GSX module" series. As per Geert's advice, it has been
remodeled to use the common Z clock infrastructure.

CU
Uli


Ulrich Hecht (2):
  clk: renesas: r8a7796: Add ZG clock
  clk: renesas: rcar-gen3: Add ZG clock divider support

 drivers/clk/renesas/r8a7796-cpg-mssr.c | 2 ++
 drivers/clk/renesas/rcar-gen3-cpg.c    | 5 +++++
 drivers/clk/renesas/rcar-gen3-cpg.h    | 1 +
 3 files changed, 8 insertions(+)

-- 
2.7.4
