Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:55949 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750860AbeEMIYD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 13 May 2018 04:24:03 -0400
Date: Sun, 13 May 2018 10:23:44 +0200
From: Simon Horman <horms@verge.net.au>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Rob Herring <robh+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/2] Disable EtherAVB by default on R8A779{7|8}0 SoCs
Message-ID: <20180513082344.yt7ytbfhzanm3ui4@verge.net.au>
References: <5844eef7-0f5e-6366-4d3d-a3a658e7f988@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5844eef7-0f5e-6366-4d3d-a3a658e7f988@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, May 11, 2018 at 11:18:36PM +0300, Sergei Shtylyov wrote:
> Hello!
> 
> Here's the set of 2 patches against Simon Horman's 'renesas.git' repo's
> 'renesas-devel-20180511-v4.17-rc4' tag. I'm fixing the issue in the EtherAVB
> device nodes in the R8A779{7|8}0 device trees that missed the "status" prop,
> usually disabling the SoC devices in anticipation that the board device trees
> enable the devices according to their needs. There should be no issues with
> the current R8A779{7|8}0 board device trees, as all of them use EtherAVB
> anyway, so I'm sending the patches generated against the 'devel' branch...
> 
> [1/2] arm64: dts: renesas: r8a77970: disable EtherAVB
> [2/2] arm64: dts: renesas: r8a77980: disable EtherAVB

Thanks, applied.
