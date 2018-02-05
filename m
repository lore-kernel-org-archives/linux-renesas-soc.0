Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:42387 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752199AbeBEJAa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 5 Feb 2018 04:00:30 -0500
Date: Mon, 5 Feb 2018 10:00:26 +0100
From: Simon Horman <horms@verge.net.au>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Rob Herring <robh+dt@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH 1/2] dt-bindings: clock: add R8A77980 CPG core clock
 definitions
Message-ID: <20180205090025.bvdzdgh6ebebmaw3@verge.net.au>
References: <5b7895ac-11c1-ac2d-837b-56726bc6226a@cogentembedded.com>
 <4281b305-ff0d-cf56-ce6b-dff4589c39f6@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4281b305-ff0d-cf56-ce6b-dff4589c39f6@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Jan 31, 2018 at 11:27:47PM +0300, Sergei Shtylyov wrote:
> Add macros usable by the device tree sources to reference the R8A77980
> CPG core clocks by index. The data come from the table 8.2e of the R-Car
> Series, 3rd Generation User's Manual: Hardware (Rev. 0.80, Oct, 2017),
> however I had to add the Z2 clock which is somehow present only on the
> figure 8.1e...
> 
> Based on the original (and large) patch by Vladimir Barinov.
> 
> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
