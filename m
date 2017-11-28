Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f47.google.com ([209.85.215.47]:42088 "EHLO
        mail-lf0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754208AbdK1UVG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 28 Nov 2017 15:21:06 -0500
Received: by mail-lf0-f47.google.com with SMTP id i2so1257217lfe.9
        for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Nov 2017 12:21:06 -0800 (PST)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-Id: <20171128201543.932798613@cogentembedded.com>
Date: Tue, 28 Nov 2017 23:15:43 +0300
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
Subject: [PATCH 0/2] Use R8A77970 CPG core clock and SYSC pwoer domain macros
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

Here's the set of 2 patches against Simon Horman's 'renesas.git' repo's
'renesas-devel-20171128-v4.15-rc1' tag. Now that the R8A77970 CPG core clock
and SYSC power domain #define's have hit Linus' tree, we can replace the bare
numbers (we had to use to avoid a cross tree dependencies) with these #define's,
at last...

[1/2] arm64: dts: renesas: r8a77970: use CPG core clock macros
[2/2] arm64: dts: renesas: r8a77970: use SYSC power domain macros

WBR, Sergei
