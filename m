Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f54.google.com ([209.85.215.54]:34781 "EHLO
        mail-lf0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754035AbdHWM5l (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Aug 2017 08:57:41 -0400
Received: by mail-lf0-f54.google.com with SMTP id g77so149515lfg.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Aug 2017 05:57:41 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-Id: <20170823125227.387729191@cogentembedded.com>
Date: Wed, 23 Aug 2017 15:52:27 +0300
To: Michael Turquette <mturquette@baylibre.com>
To: Stephen Boyd <sboyd@codeaurora.org>
To: Rob Herring <robh+dt@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
To: linux-clk@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 0/2] Renesas R8A7797 CPG/MSSR clock support
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello.

   Here's the set of 2 patches against the 'clk-next' branch of CLK group's
'linux.git' repo. As the DT patches in the R8A7797/Eagle board support series
depend on the patch #1 of this series, it might make sense to merge this patch
to the 'renesas.git' repo as well...

[1/2] clk: renesas: add R8A7797 CPG core clock definitions
[2/2] clk: renesas: cpg-mssr: add R8A7797 support

MBR, Sergei
