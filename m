Return-Path: <devicetree-owner@vger.kernel.org>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH 00/11] Add R8A77980/Condor board support
To: Rob Herring <robh+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Simon Horman <horms@verge.net.au>, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org
Message-ID: <46fca582-220d-e5a7-62cd-2fc77a29846b@cogentembedded.com>
Date: Fri, 2 Feb 2018 21:18:33 +0300
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

Here's the set of 11 patches against Simon Horman's 'renesas.git' repo's
'renesas-devel-20180202-v4.15' tag. I'm adding the device tree support for
the R8A77980-based Condor board (note that NFS root would only work on the
Condor boards [re]wired for booting from EtherAVB -- we haven't been able
to get the 'sh_eth' driver working in either U-Boot or Linux so far).
The necessary SYS-DMAC, [H]SCIF, and EtherAVB bindings updates have been
posted yesterday, the clock driver was posted the day before...

[01/11] soc: renesas: identify R-Car V3H
[02/11] soc: renesas: rcar-rst: add R8A77980 support
[03/11] dt-bindings: power: add R8A77980 SYSC power domain definitions
[04/11] soc: renesas: rcar-sysc: add R8A77980 support
[05/11] arm64: dts: renesas: initial R8A77980 SoC device tree
[06/11] arm64: dts: renesas: r8a77980: add SYS-DMAC support
[07/11] arm64: dts: renesas: r8a77980: add [H]SCIF support
[08/11] arm64: dts: renesas: r8a77980: add EtherAVB support
[09/11] DT: arm: shmobile: document Condor board bindings
[10/11] arm64: dts: renesas: initial Condor board device tree
[11/11] arm64: dts: renesas: condor: add EtherAVB support

WBR, Sergei
