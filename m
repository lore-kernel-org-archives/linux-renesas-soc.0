Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f44.google.com ([209.85.215.44]:34671 "EHLO
        mail-lf0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1757199AbdIHVh7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 8 Sep 2017 17:37:59 -0400
Received: by mail-lf0-f44.google.com with SMTP id l196so8199569lfl.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 08 Sep 2017 14:37:59 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-Id: <20170908213418.823028011@cogentembedded.com>
Date: Sat, 09 Sep 2017 00:34:18 +0300
To: Michael Turquette <mturquette@baylibre.com>
To: Stephen Boyd <sboyd@codeaurora.org>
To: Rob Herring <robh+dt@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
To: linux-clk@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
Cc: Simon Horman <horms+renesas@verge.net.au>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH v2 0/2] Renesas R8A77970 CPG/MSSR clock support
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

   Here's the set of 2 patches against the 'clk-next' branch of CLK group's
'linux.git' repo. As the DT patches in the R8A77970/Eagle board support series
depend on the patch #1 of this series, it might make sense to merge this patch
to the 'renesas.git' repo as well...

[1/2] dt-bindings: clock: add R8A77970 CPG core clock definitions
[2/2] clk: renesas: cpg-mssr: add R8A77970 support

MBR, Sergei
