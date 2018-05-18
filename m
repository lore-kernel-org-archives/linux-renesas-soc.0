Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f42.google.com ([209.85.215.42]:44288 "EHLO
        mail-lf0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751750AbeERThe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 May 2018 15:37:34 -0400
Received: by mail-lf0-f42.google.com with SMTP id h197-v6so15538997lfg.11
        for <linux-renesas-soc@vger.kernel.org>; Fri, 18 May 2018 12:37:34 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH 0/2] Add R8A77980/V3HSK GEther support
To: Rob Herring <robh+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Simon Horman <horms@verge.net.au>, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org
Message-ID: <a4230699-e46f-0782-e3b1-22d58b9033c8@cogentembedded.com>
Date: Fri, 18 May 2018 22:37:29 +0300
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

Here's the set of 2 patches against Simon Horman's 'renesas.git' repo's
'renesas-devel-20180518-v4.17-rc5' tag plus the R8A77980 SMP support patch.
I'm adding the device tree support for mounting the NFS root on the R8A77980-
based V3H Starter Kit board. The 'sh_eth' driver patches adding R8A77980
GEther support patches needed for these 2 patches to work have been posted
and are close to be merged...

[1/2] arm64: dts: renesas: r8a77980: add GEther support
[2/2] arm64: dts: renesas: v3hsk: add GEther support

WBR, Sergei
