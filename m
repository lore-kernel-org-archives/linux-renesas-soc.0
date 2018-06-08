Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:56778 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932068AbeFHIV3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 8 Jun 2018 04:21:29 -0400
Date: Fri, 8 Jun 2018 10:21:25 +0200
From: Simon Horman <horms@verge.net.au>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Rob Herring <robh+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 0/5] Add R8A77980/Condor/V3HSK LVDS/HDMI support
Message-ID: <20180608082125.tjnd6jayecv26csv@verge.net.au>
References: <390fabf0-4caf-1600-3780-1893207d94f7@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <390fabf0-4caf-1600-3780-1893207d94f7@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Jun 07, 2018 at 11:17:03PM +0300, Sergei Shtylyov wrote:
> Hello!
> 
> Here's the set of 5 patches against Simon Horman's 'renesas.git' repo's
> 'renesas-devel-20180604-v4.17' tag. We're adding the R8A77980 FCPVD/VSPD/
> DU/LVDS device nodes and then describing the LVDS decoder and HDMI encoder
> connected to the LVDS output. These patches depend on the Thine THC63LVD1024
> driver and the R8A77980 LVDS support patch in order to work, and R8A77980 GPIO
> DT patches in order to apply/compile...
> 
> [1/5] arm64: dts: renesas: r8a77980: add FCPVD support
> [2/5] arm64: dts: renesas: r8a77980: add VSPD support
> [3/5] arm64: dts: renesas: r8a77980: add DU support
> [4/5] arm64: dts: renesas: r8a77980: add LVDS support
> [5/5] arm64: dts: renesas: condor/v3hsk: add DU/LVDS/HDMI support

Sergei,

what are the changes in this series between v1 and v2?
