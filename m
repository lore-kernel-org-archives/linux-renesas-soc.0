Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f44.google.com ([209.85.215.44]:33557 "EHLO
        mail-lf0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751417AbeDFULl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 6 Apr 2018 16:11:41 -0400
Received: by mail-lf0-f44.google.com with SMTP id x70-v6so2150612lfa.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 06 Apr 2018 13:11:41 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH 0/3] Add R8A77980/Condor PCIe support
To: Simon Horman <horms@verge.net.au>,
        Rob Herring <robh+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: Magnus Damm <magnus.damm@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org
Message-ID: <f07e6173-75b3-fe10-81d6-915942a5f4fe@cogentembedded.com>
Date: Fri, 6 Apr 2018 23:11:38 +0300
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

Here's the set of 3 patches against Simon Horman's 'renesas.git' repo's
'renesas-devel-20180330-v4.16-rc7' tag. We're adding the R8A77980 PCIe related
device nodes and then enable PCIe on the Condor board. These patches depend on
the R8A77980 PCIe PHY and PCIEC driver support in order to work properly...

[1/3] arm64: dts: renesas: r8a77980: add PCIe PHY support
[2/3] arm64: dts: renesas: r8a77980: add PCIEC support
[3/3] arm64: dts: renesas: condor: add PCIe support

WBR, Sergei
