Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:57433 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1758207AbdKQNjb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Nov 2017 08:39:31 -0500
Date: Fri, 17 Nov 2017 05:39:26 -0800
From: Simon Horman <horms@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [PATCH v5 00/15] arm64: dts: renesas: r8a7795: IPMMU upstream
 integration
Message-ID: <20171117133926.3fdu74fj2wrpfohk@verge.net.au>
References: <20171110132532.1202-1-horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171110132532.1202-1-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Nov 10, 2017 at 02:25:17PM +0100, Simon Horman wrote:
> This series adds DT nodes for IPMMU instances on r8a7795 together with
> connections to various r8a7795 on-chip devices such as Audio-DMAC, SYS-DMAC,
> Ethernet-AVB, SATA and a bunch of multimedia devices that make use of FCP.
> 
> With these patches applied a white list enabled IPMMU driver may be used
> to check silicon revision and then enable IPMMU in the known working cases.
> 
> The recommended test stack for this patchset is a merge of
> * The iommu/next branch of the vfio tree
> * renesas-devel-20171110-v4.14-rc8 tag of the renesas tree
> 
> The final two patches in the series enable IPMMU support for all IPMMU
> instances on r8a7795 that are used by IPMMU devices listed above with one
> exception.  The exception is the SATA device connected to IPMMU-HC which
> still is disabled pending IPMMU USB integration support. I expect IPMMU USB
> integration to be handled as a second step once this series is agreed on.
> 
> The DT binding for r8a7795 has since long been included in mainline and
> this series implements support following such format:
> 
> d4e42e7 iommu/ipmmu-vmsa: Add r8a7795 DT binding

I have applied this series.
