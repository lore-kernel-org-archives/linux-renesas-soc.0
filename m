Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f66.google.com ([209.85.215.66]:39309 "EHLO
        mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753679AbdKXVDO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 24 Nov 2017 16:03:14 -0500
Received: by mail-lf0-f66.google.com with SMTP id x76so22029863lfb.6
        for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Nov 2017 13:03:13 -0800 (PST)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-Id: <20171124205943.310383519@cogentembedded.com>
Date: Fri, 24 Nov 2017 23:59:43 +0300
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
Subject: [PATCH 0/2] Add V3M Starter Kit board support
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello.

Here's the set of 2 patches against Simon Horman's 'renesas.git' repo's
'renesas-devel-20171124v2-v4.14' tag. I'm adding the device tree support for
the R8A77970-based V3M Starter Kit board.

[1/2] arm64: dts: renesas: initial V3MSK board device tree
[2/2] arm64: dts: renesas: v3msk: add EtherAVB support

WBR, Sergei
