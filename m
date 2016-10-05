Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f49.google.com ([209.85.215.49]:33076 "EHLO
        mail-lf0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750935AbcJEUug (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Oct 2016 16:50:36 -0400
Received: by mail-lf0-f49.google.com with SMTP id x79so29298637lff.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 05 Oct 2016 13:50:35 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: mturquette@baylibre.com, linux-clk@vger.kernel.org,
        sboyd@codeaurora.org, robh+dt@kernel.org, mark.rutland@arm.com,
        devicetree@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
Subject: [PATCH 0/3] Renesas R8A7743 CPG/MSSR clock support
Date: Wed, 05 Oct 2016 23:50:32 +0300
Message-ID: <19700058.YBgRO3SXUI@wasted.cogentembedded.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello.

   Here's the set of 3 patches against the 'clk-next' branch of CLK group's
'linux.git' repo. The R8A7743 SoC support will be posted separately later --
this series depend on the Kconfig variable introduced there, however, the DTs
in that series will depend on the patch #2 of this series...

[1/3] clk: renesas: cpg-mssr: add common R-Car Gen2 support
[2/3] ARM: shmobile: r8a7743: add CPG clock index macros
[3/3] clk: renesas: cpg-mssr: add R8A7743 support

MBR, Sergei
