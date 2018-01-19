Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f41.google.com ([209.85.215.41]:44673 "EHLO
        mail-lf0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755940AbeASTya (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 19 Jan 2018 14:54:30 -0500
Received: by mail-lf0-f41.google.com with SMTP id w23so3429825lfd.11
        for <linux-renesas-soc@vger.kernel.org>; Fri, 19 Jan 2018 11:54:29 -0800 (PST)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-Id: <20180119194233.615400015@cogentembedded.com>
Date: Fri, 19 Jan 2018 22:42:33 +0300
To: Simon Horman <horms@verge.net.au>
Cc: Magnus Damm <magnus.damm@gmail.com>
To: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will.deacon@arm.com>
To: linux-renesas-soc@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH 0/5] Add R8A77970/V3MSK LVDS/HDMI support
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

Here's the set of 5 patches against Simon Horman's 'renesas.git' repo's
'renesas-devel-20180119-v4.15-rc8' tag. We're adding the R8A77970 FCPVD/VSPD/
DU/LVDS device nodes and then describing the HDMI encoder connected to the LVDS
output (we're omitting the LVDS decoder for now). These patches depend on
the recent R8A77970 DU/LVDS and  on the R8A77970 PFC driver in order to work,
and R8A77970 PFC DT patches support patch in order to apply/compile/...

[1/5] arm64: dts: renesas: r8a77970: add FCPVD support
[2/5] arm64: dts: renesas: r8a77970: add VSPD support
[3/5] arm64: dts: renesas: r8a77970: add DU support
[4/5] arm64: dts: renesas: r8a77970: add LVDS support
[5/5] arm64: dts: renesas: v3msk: add DU/LVDS/HDMI support

WBR, Sergei
