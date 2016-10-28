Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f51.google.com ([209.85.215.51]:33220 "EHLO
        mail-lf0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S942843AbcJ1WFA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 28 Oct 2016 18:05:00 -0400
Received: by mail-lf0-f51.google.com with SMTP id x79so66606695lff.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Oct 2016 15:04:59 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: horms@verge.net.au, linux-renesas-soc@vger.kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.com,
        devicetree@vger.kernel.org
Cc: magnus.damm@gmail.com, linux@arm.linux.org.uk,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/11] Add R8A7745/SK-RZG1E board support
Date: Sat, 29 Oct 2016 01:04:56 +0300
Message-ID: <4121805.SRTmqJtRfv@wasted.cogentembedded.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello.

   Here's the set of 11 patches against Simon Horman's 'renesas.git' repo's
'renesas-devel-20161027-v4.9-rc2' tag plus the R8A7743/SK-RZG1M patch series.
I'm adding the device tree support for the R8A7745-based SK-RZG1E board.
The SoC is close to R8A7794 and the board seems identical to the R8A7794/SILK
board. The device tree patches depend on the R8A7745 CPG/MSSR driver series
just posted in order to compile and work.

[01/12] ARM: shmobile: r8a7745: add power domain index macros
[02/12] soc: renesas: rcar-sysc: add R8A7745 support
[03/12] ARM: shmobile: r8a7745: basic SoC support
[04/12] ARM: dts: r8a7745: initial SoC device tree
[05/12] ARM: dts: r8a7745: add SYS-DMAC support
[06/12] ARM: dts: r8a7745: add [H]SCIF{A|B} support
[07/12] ARM: dts: r8a7745: add Ether support
[08/12] ARM: dts: r8a7745: add IRQC support
[09/12] ARM: shmobile: document SK-RZG1M board
[10/12] ARM: dts: sk-rzg1e: initial device tree
[11/12] ARM: dts: sk-rzg1e: add Ether support

WBR, Sergei
