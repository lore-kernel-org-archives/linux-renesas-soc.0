Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:39222 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753133AbeDRN5M (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 18 Apr 2018 09:57:12 -0400
Date: Wed, 18 Apr 2018 15:57:08 +0200
From: Simon Horman <horms@verge.net.au>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Rob Herring <robh+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/3] Add R8A77980/Condor PCIe support
Message-ID: <20180418135707.ruifzsv3ljgriujg@verge.net.au>
References: <f07e6173-75b3-fe10-81d6-915942a5f4fe@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f07e6173-75b3-fe10-81d6-915942a5f4fe@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Apr 06, 2018 at 11:11:38PM +0300, Sergei Shtylyov wrote:
> Hello!
> 
> Here's the set of 3 patches against Simon Horman's 'renesas.git' repo's
> 'renesas-devel-20180330-v4.16-rc7' tag. We're adding the R8A77980 PCIe related
> device nodes and then enable PCIe on the Condor board. These patches depend on
> the R8A77980 PCIe PHY and PCIEC driver support in order to work properly...

Thanks, I have marked these as deferred.

Please ping me once the dependencies have been accepted.
