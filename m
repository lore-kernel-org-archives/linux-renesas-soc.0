Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f53.google.com ([209.85.215.53]:33713 "EHLO
        mail-lf0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1758915AbcKCVHF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 Nov 2016 17:07:05 -0400
Received: by mail-lf0-f53.google.com with SMTP id c13so49587428lfg.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 03 Nov 2016 14:07:04 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: mturquette@baylibre.com, linux-clk@vger.kernel.org,
        sboyd@codeaurora.org, robh+dt@kernel.org, mark.rutland@arm.com,
        devicetree@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org, horms+renesas@verge.net.au
Subject: [PATCH v2 0/2] Renesas R8A7745 CPG/MSSR clock support
Date: Fri, 04 Nov 2016 00:07:01 +0300
Message-ID: <9992368.desJvZIsUT@wasted.cogentembedded.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello.

   Here's the set of 2 patches against the 'clk-next' branch of CLK group's
'linux.git' repo plus the R8A7743 CPG/MSSR patches just re-posted. They also
depend on the common R-Car Gen2 support patch. As the DT patches in the
R8A7745/SK-RZG1E board support series depend on the patch #1 of this series,
it might make sense to merge this patch to the 'renesas.git' repo as well...

[1/2] ARM: shmobile: r8a7745: add CPG clock index macros
[2/2] clk: renesas: cpg-mssr: add R8A7745 support

MBR, Sergei
