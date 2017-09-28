Return-Path: <devicetree-owner@vger.kernel.org>
Subject: Re: [PATCH 3/4] arm64: dts: renesas: salvator-common: Add EthernetAVB
 PHY reset
To: Geert Uytterhoeven <geert+renesas@glider.be>,
        "David S . Miller" <davem@davemloft.net>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Andrew Lunn <andrew@lunn.ch>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>, netdev@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
References: <1506614014-4398-1-git-send-email-geert+renesas@glider.be>
 <1506614014-4398-4-git-send-email-geert+renesas@glider.be>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <947b19ea-a295-26ef-9606-729fd2694b6b@gmail.com>
Date: Thu, 28 Sep 2017 10:20:57 -0700
MIME-Version: 1.0
In-Reply-To: <1506614014-4398-4-git-send-email-geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 09/28/2017 08:53 AM, Geert Uytterhoeven wrote:
> Describe the GPIO used to reset the Ethernet PHY for EthernetAVB.
> This allows the driver to reset the PHY during probe and after system
> resume.
> 
> This fixes Ethernet operation after resume from s2ram on Salvator-XS,
> where the enable pin of the regulator providing PHY power is connected
> to PRESETn, and PSCI powers down the SoC during system suspend.
> 
> On Salvator-X, the enable pin is always pulled high, but the driver may
> still need to reset the PHY if this wasn't done by the bootloader
> before.
> 
> Inspired by patches in the BSP for the individual Salvator-X/XS boards
> by Kazuya Mizuguchi.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> For proper PHY reset operation during system resume, this depends on
> "ravb: Add missing PHY reset during system resume".
> However, this patch can be applied independently.
> ---
>  arch/arm64/boot/dts/renesas/salvator-common.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/salvator-common.dtsi b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
> index ed4a8dfead3c2e58..db00e7c484f76eac 100644
> --- a/arch/arm64/boot/dts/renesas/salvator-common.dtsi
> +++ b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
> @@ -296,6 +296,7 @@
>  	pinctrl-names = "default";
>  	renesas,no-ether-link;
>  	phy-handle = <&phy0>;
> +	reset-gpios = <&gpio2 10 GPIO_ACTIVE_LOW>;
>  	status = "okay";
>  
>  	phy0: ethernet-phy@0 {

This should be a PHY node property, unless this GPIO pin really is
global to the MDIO bus itself.
Florian
