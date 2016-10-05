Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f54.google.com ([209.85.215.54]:34944 "EHLO
        mail-lf0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750700AbcJEVX7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Oct 2016 17:23:59 -0400
Received: by mail-lf0-f54.google.com with SMTP id l131so300954lfl.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 05 Oct 2016 14:23:58 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: horms@verge.net.au, linux-renesas-soc@vger.kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.com,
        devicetree@vger.kernel.org
Cc: magnus.damm@gmail.com, linux@arm.linux.org.uk,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 0/11] Add R8A7743/SK-RZG1M board support
Date: Thu, 06 Oct 2016 00:23:55 +0300
Message-ID: <2056698.ncAHq8vRQ3@wasted.cogentembedded.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello.

   Here's the set of 11 patches against Simon Horman's 'renesas.git' repo's
'renesas-devel-20161003-v4.8' tag. I'm adding the device tree support for
the R8A7743-based SK-RZG1M board. The SoC is close to R8A7791 and the board
seems identical to the R8A7791/Porter board. The device tree patches depend on
the R8A7743 CPG/MSSR driver series just posted in order to compile and work.

[01/12] ARM: shmobile: r8a7743: add power domain index macros
[02/12] soc: renesas: rcar-sysc: add R8A7743 support
[03/12] ARM: shmobile: r8a7743: basic SoC support
[04/12] ARM: dts: r8a7743: initial SoC device tree
[05/12] ARM: dts: r8a7743: add SYS-DMAC support
[06/12] ARM: dts: r8a7743: add [H]SCIF{A|B} support
[07/12] ARM: dts: r8a7743: add Ether support
[08/12] ARM: dts: r8a7743: add IRQC support
[09/12] DT: arm: shmobile: document SK-RZG1M board
[10/12] ARM: dts: sk-rzg1m: initial device tree
[11/12] ARM: dts: sk-rzg1m: add Ether support

WBR, Sergei
