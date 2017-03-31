Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:56279 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753203AbdCaJxi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 31 Mar 2017 05:53:38 -0400
Date: Fri, 31 Mar 2017 11:52:09 +0200
From: jacopo <jacopo@jmondi.org>
To: Rob Herring <robh@kernel.org>
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>, geert+renesas@glider.be,
        laurent.pinchart@ideasonboard.com, chris.brandt@renesas.com,
        linus.walleij@linaro.org, mark.rutland@arm.com,
        linux@armlinux.org.uk, linux-renesas-soc@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/7] dt-bindings: pinctrl: Add RZ/A1 bindings doc
Message-ID: <20170331095209.GG7900@w540>
References: <1490368934-12494-1-git-send-email-jacopo+renesas@jmondi.org>
 <1490368934-12494-3-git-send-email-jacopo+renesas@jmondi.org>
 <20170330223903.yafbhrdulrnv2pfz@rob-hp-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20170330223903.yafbhrdulrnv2pfz@rob-hp-laptop>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Rob,
   thanks for the ack

On Thu, Mar 30, 2017 at 05:39:03PM -0500, Rob Herring wrote:
> On Fri, Mar 24, 2017 at 04:22:09PM +0100, Jacopo Mondi wrote:
> > Add device tree bindings documentation for Renesas RZ/A1 gpio and pin
> > controller.
> > 
> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > ---
> >  .../bindings/pinctrl/renesas,rza1-pinctrl.txt      | 143 +++++++++++++++++++++
> >  1 file changed, 143 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/pinctrl/renesas,rza1-pinctrl.txt
> 
> Acked-by: Rob Herring <robh@kernel.org>

Just an heads-up: in v4 dt bindings will change considerably to meet a
format more close to standard pin controller bindings.

I cannot take you ack here and apply to next iteration as it will
require you or other dt guardians to have a look at it again. Sorry
about this.

Thanks
   j
