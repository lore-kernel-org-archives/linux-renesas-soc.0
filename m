Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f48.google.com ([209.85.215.48]:47317 "EHLO
        mail-lf0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751793AbdIOToW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 Sep 2017 15:44:22 -0400
Received: by mail-lf0-f48.google.com with SMTP id 80so3406087lfy.4
        for <linux-renesas-soc@vger.kernel.org>; Fri, 15 Sep 2017 12:44:21 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-Id: <20170915193718.359780292@cogentembedded.com>
Date: Fri, 15 Sep 2017 22:43:18 +0300
To: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will.deacon@arm.com>
To: Simon Horman <horms@verge.net.au>
Cc: Magnus Damm <magnus.damm@gmail.com>
To: devicetree@vger.kernel.org
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 0/8] Add Renesas R8A77970/Eagle board support
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello.

   Here's the set of 8 patches against Simon Horman's 'renesas.git' repo's
'renesas-devel-20170915-v4.13' tag. I'm adding the device tree support for
the R8A77970-based Eagle board. Already merged patches will not be reposted.
The necessary SYS-DMAC, [H]SCIF, and EtherAVB bindings updates have been
posted earlier.

[1/8] soc: renesas: rcar-sysc: add R8A77970 support
[2/8] arm64: dts: renesas: initial R8A77970 SoC device tree
[3/8] arm64: dts: renesas: r8a77970: add SYS-DMAC support
[4/8] arm64: dts: renesas: r8a77970: add [H]SCIF support
[5/8] arm64: dts: renesas: r8a77970: add EtherAVB support
[6/8] arm64: renesas: document Eagle board bindings
[7/8] arm64: dts: renesas: initial Eagle board device tree
[8/8] arm64: dts: renesas: eagle: add EtherAVB support

WBR, Sergei
