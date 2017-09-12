Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f50.google.com ([209.85.215.50]:34693 "EHLO
        mail-lf0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751020AbdILVFI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 Sep 2017 17:05:08 -0400
Received: by mail-lf0-f50.google.com with SMTP id l196so29504938lfl.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 12 Sep 2017 14:05:07 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-Id: <20170912203716.238067587@cogentembedded.com>
Date: Tue, 12 Sep 2017 23:37:16 +0300
To: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will.deacon@arm.com>
To: Simon Horman <horms@verge.net.au>
Cc: Magnus Damm <magnus.damm@gmail.com>
To: devicetree@vger.kernel.org
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Subject: [PATCH 00/11] Add R8A77970/Eagle board support
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello.

   Here's the set of 11 patches against Simon Horman's 'renesas.git' repo's
'renesas-devel-20170911v2-v4.13' tag. I'm adding the device tree support for
the R8A77970-based Eagle board. The necessary SYS-DMAC, [H]SCIF, and EtherAVB
bindings updates have been posted earlier.

[01/11] soc: renesas: identify R-Car V3M
[02/11] soc: renesas: rcar-rst: add R8A77970 support
[03/11] dt-bindings: power: add R8A77970 SYSC power domain definitions
[04/11] soc: renesas: rcar-sysc: add R8A77970 support
[05/11] arm64: dts: renesas: initial R8A77970 SoC device tree
[06/11] arm64: dts: renesas: r8a77970: add SYS-DMAC support
[07/11] arm64: dts: renesas: r8a77970: add [H]SCIF support
[08/11] arm64: dts: renesas: r8a77970: add EtherAVB support
[09/11] arm64: renesas: document Eagle board
[11/11] arm64: dts: renesas: initial Eagle board device tree
[11/11] arm64: dts: renesas: eagle: add EtherAVB support

WBR, Sergei
