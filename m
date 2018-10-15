Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-oi1-f196.google.com ([209.85.167.196]:37512 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726765AbeJPCRA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 15 Oct 2018 22:17:00 -0400
Date: Mon, 15 Oct 2018 13:30:34 -0500
From: Rob Herring <robh@kernel.org>
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Simon Horman <horms+renesas@verge.net.au>
Subject: Re: [PATCH] dt-bindings: timer: ostm: Add R7S9210 support
Message-ID: <20181015183034.GA14003@bogus>
References: <20180927141258.103071-1-chris.brandt@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180927141258.103071-1-chris.brandt@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Sep 27, 2018 at 09:12:58AM -0500, Chris Brandt wrote:
> The R7S9210 belongs to the RZ/A2 SoC series
> 
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> ---
> FYI: No driver changes were needed
> ---
>  Documentation/devicetree/bindings/timer/renesas,ostm.txt | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Applied.
