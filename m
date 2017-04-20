Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:49537 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S941959AbdDTIw2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 20 Apr 2017 04:52:28 -0400
Date: Thu, 20 Apr 2017 17:52:24 +0900
From: Simon Horman <horms@verge.net.au>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/3] Add R8A7743/SK-RZG1M PFC support
Message-ID: <20170420085223.GG3760@verge.net.au>
References: <20170414210941.143838720@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170414210941.143838720@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Sat, Apr 15, 2017 at 12:09:41AM +0300, Sergei Shtylyov wrote:
> Hello.
> 
> Here's the set of 3 patches against Simon Horman's 'renesas.git' repo,
> 'renesas-devel-20170410-v4.11-rc6' tag.  We're adding the R8A7743 PFC node and
> then describe the pins for SCIF0 and Ether devices described eralier. These
> patches depend on the R8A7743 PFC suport in order to work properly.
> 
> [1/3] ARM: dts: r8a7743: add PFC support
> [2/3] ARM: dts: sk-rzg1m: add SCIF0 pins
> [3/3] ARM: dts: sk-rzg1m: add Ether pins

These look good to me. Please repost me or ping me once the prerequisites
have been accepted. Likewise for the similar patchset for the R8A7745/SK-RZG1E.
