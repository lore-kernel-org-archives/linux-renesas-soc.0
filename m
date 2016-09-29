Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f41.google.com ([209.85.215.41]:36144 "EHLO
        mail-lf0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933405AbcI2WOV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 29 Sep 2016 18:14:21 -0400
Received: by mail-lf0-f41.google.com with SMTP id g62so91600134lfe.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 29 Sep 2016 15:14:21 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: horms@verge.net.au, linux-renesas-soc@vger.kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.com,
        devicetree@vger.kernel.org
Cc: magnus.damm@gmail.com, linux@arm.linux.org.uk,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH RFC v2 0/12] Add R8A7743/SK-RZG1M board support
Date: Fri, 30 Sep 2016 01:14:17 +0300
Message-ID: <1987532.PE2ex6PrJ5@wasted.cogentembedded.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello.

   Here's the set of 12 patches against Simon Horman's 'renesas.git' repo,
'renesas-devel-20160926-v4.8-rc8' tag. I'm adding the device tree support for
the R8A7743-based SK-RZG1M board. The SoC is close to R8A7791 and the board
seems  identical to the R8A7791/Porter board. This version includes the Ether,
so the board should boot with NFS root now. I tried to address all the comments
to the version 1 (except the need to use the new CPG/MSSR drivers -- this one
will be addressed RSN). The DMAC/SCIF/IRQC bindings patches posted recently are
needed for scripts/checkpatch.pl to be happy. :-)

[1/12] ARM: shmobile: r8a7743: add clock index macros
[2/12] ARM: shmobile: r8a7743: add power domain index macros
[3/12] soc: renesas: rcar-sysc: add R8A7743 support
[4/12] ARM: shmobile: r8a7743: basic SoC support
[5/12] ARM: dts: r8a7743: initial SoC device tree
[6/12] ARM: dts: r8a7743: add SYS-DMAC support
[7/12] ARM: dts: r8a7743: add [H]SCIF[AB] support
[8/12] ARM: dts: r8a7743: add Ether support
[9/12] ARM: dts: r8a7743: add IRQC support
[10/12] DT: arm: shmobile: document SK-RZG1M board
[11/12] ARM: dts: sk-rzg1m: initial device tree
[12/12] ARM: dts: sk-rzg1m: add Ether support

WBR, Sergei
