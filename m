Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f65.google.com ([209.85.215.65]:41067 "EHLO
        mail-lf0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755270AbeFRQQv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 Jun 2018 12:16:51 -0400
Received: by mail-lf0-f65.google.com with SMTP id d24-v6so25553587lfa.8
        for <linux-renesas-soc@vger.kernel.org>; Mon, 18 Jun 2018 09:16:50 -0700 (PDT)
Subject: Re: [PATCH v2 0/2] Add R8A77980/Condor PCIe support
To: Simon Horman <horms@verge.net.au>
Cc: Rob Herring <robh+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org
References: <b37d458c-071a-833a-2057-be8a07c880be@cogentembedded.com>
 <20180618093623.s33bkiptazxem463@verge.net.au>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <cfa599bd-d244-0032-490b-553f7870d07c@cogentembedded.com>
Date: Mon, 18 Jun 2018 19:16:47 +0300
MIME-Version: 1.0
In-Reply-To: <20180618093623.s33bkiptazxem463@verge.net.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 06/18/2018 12:36 PM, Simon Horman wrote:

>> Here's the set of 2 patches against Simon Horman's 'renesas.git' repo's
>> 'renesas-devel-20180614v2-v4.17' tag. We're adding the R8A77980 PCIe related
>> device nodes and then enable PCIe on the Condor board. These patches depend
>> on the R8A77980 PCIe PHY driver support in order to work properly. Note that
>> in case the PCIe PHY driver is not enabled, the kernel will BUG() due to I/O
>> space page leak in the PCIe driver...
> 
> Is that problem specific to the presence of PCIe nodes for
> condor/r8a77980

   The nodes are safe unless they are enabled, so the Condor patch may be
deferred untl I fix the PCI code.
> condor/r8a77980 or is it also true of other (R-Car) boards where
> PCIe is enabled?

   The leak happens every time the driver fails to probe later than
pci_remap_iospace() is called but the BUG_ON() is only triggered by rhe 2nd try
with EPROBE_DEFER returned previously.

> Regardless, it sounds like these patches expose a kernel bug.
> Is it being fixed?

   I'm working on a fix (which embraces several PCI drivers)...

>> [1/2] arm64: dts: renesas: r8a77980: add PCIe support
>> [2/2] arm64: dts: renesas: condor: add PCIe support

WBR, Sergei
