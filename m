Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:53228 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750787AbdIOIFu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 Sep 2017 04:05:50 -0400
Date: Fri, 15 Sep 2017 10:05:30 +0200
From: Simon Horman <horms@verge.net.au>
To: Chris Paterson <chris.paterson2@renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 4/8] ARM: dts: iwg22d: Enable SDHI0 controller
Message-ID: <20170915080530.GH3924@verge.net.au>
References: <1505322341-9480-1-git-send-email-chris.paterson2@renesas.com>
 <1505322341-9480-5-git-send-email-chris.paterson2@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1505322341-9480-5-git-send-email-chris.paterson2@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Sep 13, 2017 at 06:05:37PM +0100, Chris Paterson wrote:
> From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> 
> Enable the SDHI0 controller on iWave RZ/G1E carrier board.

...

> @@ -63,3 +88,15 @@
>  		micrel,led-mode = <1>;
>  	};
>  };
> +
> +&sdhi0 {
> +	pinctrl-0 = <&sdhi0_pins>;
> +	pinctrl-1 = <&sdhi0_pins_uhs>;
> +	pinctrl-names = "default", "state_uhs";
> +
> +	vmmc-supply = <&reg_3p3v>;
> +	vqmmc-supply = <&vccq_sdhi0>;
> +	cd-gpios = <&gpio6 6 GPIO_ACTIVE_LOW>;

I take that the absence of a wp-gpio means that that this is a µSD slot.
Could you help me by documenting this correctly on
http://elinux.org/index.php?title=Renesas-MMC-Enabled-Speeds ?

For some reason I thought that SDHI0 wasn't exposed at all, so I guess
my reading of the documentation was incorrect.


I think you also want sd-uhs-sdr50 here too.
You can test it by removing the sd-uhs-sdr104 property.

> +	sd-uhs-sdr104;
> +	status = "okay";
> +};
> -- 
> 1.9.1
> 
