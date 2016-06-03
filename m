Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f43.google.com ([209.85.215.43]:34329 "EHLO
	mail-lf0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752809AbcFCVJi (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Fri, 3 Jun 2016 17:09:38 -0400
Received: by mail-lf0-f43.google.com with SMTP id k98so62133744lfi.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 03 Jun 2016 14:09:38 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: horms@verge.net.au, linux-renesas-soc@vger.kernel.org,
	robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com,
	ijc+devicetree@hellion.org.uk, galak@codeaurora.org,
	devicetree@vger.kernel.org
Cc: magnus.damm@gmail.com, linux@arm.linux.org.uk,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 00/11] Add R8A7792/Blanche board support
Date: Sat, 04 Jun 2016 00:09:35 +0300
Message-ID: <3446154.oZ24315zaL@wasted.cogentembedded.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello.

   Here's the set of 11 patches against Simon Horman's 'renesas.git' repo,
'renesas-devel-20160530-v4.7-rc1' tag. We add the device tree support for
the R8A7792-based Blanche board. The R-Car 'clk' driver patch was posted last
week separately and 2 'clk' binding patches was split from this series and just
re-posted...

[01/13] ARM: shmobile: r8a7792: add clock index macros
[02/13] ARM: shmobile: r8a7792: add power domain index macros
[03/13] soc: renesas: rcar-sysc: add R8A7792 support
[04/13] ARM: shmobile: r8a7792: basic SoC support
[05/13] ARM: dts: r8a7792: initial SoC device tree
[06/13] ARM: dts: r8a7792: add SYS-DMAC support
[07/13] ARM: dts: r8a7792: add [H]SCIF support
[08/13] ARM dts: r8a7792: add IRQC support
[09/13] DT: arm: shmobile: document Blanche board
[10/13] ARM: dts: blanche: initial device tree
[11/13] ARM: dts: blanche: add Ethernet support

WBR, Sergei
