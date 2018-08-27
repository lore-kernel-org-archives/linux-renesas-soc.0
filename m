Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:50125 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726883AbeH0QWR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 27 Aug 2018 12:22:17 -0400
Date: Mon, 27 Aug 2018 14:35:44 +0200
From: Simon Horman <horms@verge.net.au>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Rob Herring <robh+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4] arm64: dts: renesas: condor/v3hsk: add DU/LVDS/HDMI
 support
Message-ID: <20180827123544.awqip3mbevjvzh7i@verge.net.au>
References: <95d0db34-713d-8206-00c2-ee9a42aab823@cogentembedded.com>
 <fe3794e1-2452-d1af-5c30-203fcbb9932e@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fe3794e1-2452-d1af-5c30-203fcbb9932e@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Aug 23, 2018 at 07:59:20PM +0300, Sergei Shtylyov wrote:
> Define the Condor/V3HSK board dependent parts of the DU and  LVDS device
> nodes. Also add the device nodes for Thine THC63LVD1024 LVDS decoder and
> Analog Devices ADV7511W HDMI transmitter...
> 
> Based on the original (and large) patch by Vladimir Barinov.
> 
> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> Reviewed-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> ---
> The patch is against the 'renesas-devel-20180822-v4.18' tag of Simon Horman's
> 'renesas.git' repo. The only driver support still unmerged seems to be the
> R8A77980 LVDS support patches...

Thanks, applied for v4.20.
