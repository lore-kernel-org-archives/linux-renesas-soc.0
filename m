Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:44795 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754695AbeFNTQh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 14 Jun 2018 15:16:37 -0400
Received: by mail-lf0-f68.google.com with SMTP id 36-v6so11077949lfr.11
        for <linux-renesas-soc@vger.kernel.org>; Thu, 14 Jun 2018 12:16:36 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH v2 0/2] Add R8A77980/Condor PCIe support
To: Simon Horman <horms@verge.net.au>,
        Rob Herring <robh+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: Magnus Damm <magnus.damm@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org
Message-ID: <b37d458c-071a-833a-2057-be8a07c880be@cogentembedded.com>
Date: Thu, 14 Jun 2018 22:16:32 +0300
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

Here's the set of 2 patches against Simon Horman's 'renesas.git' repo's
'renesas-devel-20180614v2-v4.17' tag. We're adding the R8A77980 PCIe related
device nodes and then enable PCIe on the Condor board. These patches depend
on the R8A77980 PCIe PHY driver support in order to work properly. Note that
in case the PCIe PHY driver is not enabled, the kernel will BUG() due to I/O
space page leak in the PCIe driver...

[1/2] arm64: dts: renesas: r8a77980: add PCIe support
[2/2] arm64: dts: renesas: condor: add PCIe support

WBR, Sergei
