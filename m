Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf1-f46.google.com ([209.85.167.46]:36587 "EHLO
        mail-lf1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726626AbeHUXJo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 21 Aug 2018 19:09:44 -0400
Received: by mail-lf1-f46.google.com with SMTP id c21-v6so4683906lfh.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Aug 2018 12:48:12 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH 0/2] Add R8A77980/Condor eMMC support
To: Simon Horman <horms@verge.net.au>,
        Rob Herring <robh+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: Magnus Damm <magnus.damm@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org
Message-ID: <1af46bf9-d9e5-8dcf-0ac7-a85e7348a34e@cogentembedded.com>
Date: Tue, 21 Aug 2018 22:48:09 +0300
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

Here's the set of 2 patches against Simon Horman's 'renesas.git' repo's
'renesas-devel-20180810-v4.18-rc7' tag. We're adding the R8A77970 MMC0
(SDHI2) device nodes and then enable eMMC support on the V3M Starter Kit
board. The SDHI (w/internal DMA) driver patch white-listing the R8A77970
was posted last Saturday; the R8A77970 CPG/MSSR driver patch and the SDHI
bindings patch have been posted earlier today.

[1/2] arm64: dts: renesas: r8a77970: add MMC support
[2/2] arm64: dts: renesas: v3msk: add eMMC support

WBR, Sergei
