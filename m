Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f54.google.com ([209.85.215.54]:36933 "EHLO
        mail-lf0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750724AbeFAUmD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 1 Jun 2018 16:42:03 -0400
Received: by mail-lf0-f54.google.com with SMTP id r2-v6so16616124lff.4
        for <linux-renesas-soc@vger.kernel.org>; Fri, 01 Jun 2018 13:42:02 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH 0/3] Add R8A77980/Condor/V3HSK GPIO support
To: Simon Horman <horms@verge.net.au>,
        Rob Herring <robh+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: Magnus Damm <magnus.damm@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org
Message-ID: <4acc208e-c593-1e8a-00ca-fc9a5574074e@cogentembedded.com>
Date: Fri, 1 Jun 2018 23:41:59 +0300
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

Here's the set of 3 patches against Simon Horman's 'renesas.git' repo's
'renesas-devel-20180529-v4.17-rc7' tag plus the I2C patches reposted yesterday.
We're adding the R8A77980 GPIO nodes and then describing the PHY IRQ for the
GEther/EtherAVB devices declared earlier.

[1/3] arm64: dts: renesas: r8a77980: add GPIO support
[2/3] arm64: dts: renesas: condor: specify EtherAVB PHY IRQ
[3/3] arm64: dts: renesas: v3hsk: specify GEther PHY IRQ

WBR, Sergei
