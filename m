Return-Path: <devicetree-owner@vger.kernel.org>
Date: Mon, 30 Jan 2017 14:37:09 -0600
From: Rob Herring <robh@kernel.org>
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        devicetree@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v6 2/3] mmc: sh_mobile_sdhi: explain clock bindings
Message-ID: <20170130203709.atowu3liadamyrcp@rob-hp-laptop>
References: <20170125202810.16876-1-chris.brandt@renesas.com>
 <20170125202810.16876-3-chris.brandt@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170125202810.16876-3-chris.brandt@renesas.com>
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Jan 25, 2017 at 03:28:09PM -0500, Chris Brandt wrote:
> In the case of a single clock source, you don't need names. However,
> if the controller has 2 clock sources, you need to name them correctly
> so the driver can find the 2nd one. The 2nd clock is for the internal
> card detect logic.
> 
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v5:
> * add Reviewed-by: Geert Uytterhoeven
> * list number of clocks for each SoC
> * remove example because it already exists in mmc.txt
> v4:
> * just explain there might be 2 clocks, don't explain how
>   we will use them in the driver
> v3:
> * add more clarification about why there are sometimes 2 clocks
>   and what you should do with them.
> * remove 'status = "disabled"' from example
> v2:
> * fix spelling and change wording
> * changed clock name from "carddetect" to "cd"
> ---
>  Documentation/devicetree/bindings/mmc/tmio_mmc.txt | 13 +++++++++++++
>  1 file changed, 13 insertions(+)

Acked-by: Rob Herring <robh@kernel.org>
