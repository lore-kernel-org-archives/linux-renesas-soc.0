Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f42.google.com ([209.85.215.42]:38476 "EHLO
        mail-lf0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751162AbeDNTZB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 14 Apr 2018 15:25:01 -0400
Received: by mail-lf0-f42.google.com with SMTP id u3-v6so16829264lff.5
        for <linux-renesas-soc@vger.kernel.org>; Sat, 14 Apr 2018 12:25:00 -0700 (PDT)
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
Message-ID: <611daf1f-42a2-d463-0814-ebf762871018@cogentembedded.com>
Date: Sat, 14 Apr 2018 22:24:57 +0300
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

Here's the set of 2 patches against Simon Horman's 'renesas.git' repo's
'renesas-devel-20180412-v4.16' tag. We're adding the R8A77980 MMC (SDHI)
device nodes and then enable eMMC support on the Condor board. These patches
are atop of the recently posted PCIe/PFC R8A77980/Condor patches and they
depend on the R8A77980 SDHI driver support patch (not posted yet) in order
to work properly...

[1/2] arm64: dts: renesas: r8a77980: add MMC support
[2/2] arm64: dts: renesas: condor: add eMMC support

WBR, Sergei
