Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:50143 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753620AbcIWHhx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 23 Sep 2016 03:37:53 -0400
Date: Fri, 23 Sep 2016 09:37:46 +0200
From: Simon Horman <horms@verge.net.au>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: linux-renesas-soc@vger.kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, devicetree@vger.kernel.org,
        magnus.damm@gmail.com, linux@arm.linux.org.uk,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] ARM: dts: wheat: add DU support
Message-ID: <20160923073745.GB20129@verge.net.au>
References: <34968644.DhifNderY8@wasted.cogentembedded.com>
 <3066182.ZErLCrPBIM@wasted.cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3066182.ZErLCrPBIM@wasted.cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Sep 23, 2016 at 12:06:43AM +0300, Sergei Shtylyov wrote:
> Define  the  Wheat board dependent  part of the DU device node.
> Add the device nodes for the Analog Devices ADV7513 HDMI transmitters
> connected to DU0/1.  Add the necessary subnodes to interconnect DU with
> HDMI transmitters/connectors.
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Thanks, I have queued this up.
