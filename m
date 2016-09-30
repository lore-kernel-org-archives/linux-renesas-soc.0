Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:39985 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751107AbcI3GfN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 30 Sep 2016 02:35:13 -0400
Date: Fri, 30 Sep 2016 08:35:06 +0200
From: Simon Horman <horms@verge.net.au>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: gregkh@linuxfoundation.org, jslaby@suse.cz,
        linux-serial@vger.kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] sh-sci: add R8A7743/5 support
Message-ID: <20160930063506.GB9409@verge.net.au>
References: <2017044.9fZNuWa2OZ@wasted.cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2017044.9fZNuWa2OZ@wasted.cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Sep 30, 2016 at 12:37:13AM +0300, Sergei Shtylyov wrote:
> Renesas  RZ/G SoC also have the SCIF, SCIFA, SCIFB, and HSCIF ports.
> Document RZ/G1[ME] (also known as R8A774[35]) SoC bindings along with
> the RZ/G family bindings.  The driver itself also needs to recognize
> the latter binding for the SCIF ports, so teach it...
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Acked-by: Simon Horman <horms+renesas@verge.net.au>
