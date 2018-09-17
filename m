Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:36745 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727204AbeIQNru (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Sep 2018 09:47:50 -0400
Date: Mon, 17 Sep 2018 10:21:27 +0200
From: Simon Horman <horms@verge.net.au>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        linux-renesas-soc@vger.kernel.org,
        Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v2 2/3] dt-bindings: timer: renesas: cmt: document R-Car
 gen3 support
Message-ID: <20180917082126.nrhvq3r4uzosjpiv@verge.net.au>
References: <c94a4ad6-93ee-05e4-e2c1-e8d24d3bc75e@cogentembedded.com>
 <42923b22-9ce9-b9cc-c569-0e364b63b783@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <42923b22-9ce9-b9cc-c569-0e364b63b783@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Sep 12, 2018 at 11:15:28PM +0300, Sergei Shtylyov wrote:
> Document support for the R-Car gen3 CMT types 0/1 bindings -- they seem
> to be the same CMT types 0/1 as in the R-Car gen2 SoCs.
> 
> Also document R8A779{7|8}0 bindings as these are the R-Car gen3 SoCs for
> which the initial support was done.
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
