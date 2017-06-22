Return-Path: <devicetree-owner@vger.kernel.org>
Date: Thu, 22 Jun 2017 16:09:17 -0500
From: Rob Herring <robh@kernel.org>
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc: linus.walleij@linaro.org, geert+renesas@glider.be,
        laurent.pinchart@ideasonboard.com, chris.brandt@renesas.com,
        mark.rutland@arm.com, linux@armlinux.org.uk, aisheng.dong@nxp.com,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/8] dt-bindings: pinctrl: Add RZ/A1 bindings doc
Message-ID: <20170622210917.ljbxkpaalckhegmq@rob-hp-laptop>
References: <1498143276-7976-1-git-send-email-jacopo+renesas@jmondi.org>
 <1498143276-7976-3-git-send-email-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1498143276-7976-3-git-send-email-jacopo+renesas@jmondi.org>
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Jun 22, 2017 at 04:54:30PM +0200, Jacopo Mondi wrote:
> Add device tree bindings documentation for Renesas RZ/A1 gpio and pin
> controller.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  .../bindings/pinctrl/renesas,rza1-pinctrl.txt      | 221 +++++++++++++++++++++
>  1 file changed, 221 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/renesas,rza1-pinctrl.txt

Please add acks when posting new versions. It seems there are 2 more 
lines here, but I have no idea what changed. I'm assuming it was minor 
enough to retain my ack.

Rob
