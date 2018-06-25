Return-Path: <devicetree-owner@vger.kernel.org>
Date: Mon, 25 Jun 2018 14:47:21 -0600
From: Rob Herring <robh@kernel.org>
To: Michel Pollet <michel.pollet@bp.renesas.com>
Cc: linux-renesas-soc@vger.kernel.org,
        Simon Horman <horms@verge.net.au>, phil.edworthy@renesas.com,
        Michel Pollet <buserror+upstream@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/5] dt-bindings: Add the r9a06g032-pinctrl.h file
Message-ID: <20180625204721.GA20131@rob-hp-laptop>
References: <1528974029-29617-1-git-send-email-michel.pollet@bp.renesas.com>
 <1528974029-29617-2-git-send-email-michel.pollet@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1528974029-29617-2-git-send-email-michel.pollet@bp.renesas.com>
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Jun 14, 2018 at 12:00:17PM +0100, Michel Pollet wrote:
> This adds the constants necessary to use the renesas,r9a06g032-pinctrl
> node.
> 
> Signed-off-by: Michel Pollet <michel.pollet@bp.renesas.com>
> ---
>  include/dt-bindings/pinctrl/r9a06g032-pinctrl.h | 191 ++++++++++++++++++++++++
>  1 file changed, 191 insertions(+)
>  create mode 100644 include/dt-bindings/pinctrl/r9a06g032-pinctrl.h

This can be combined with patch 2.
