Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor1.renesas.com ([210.160.252.171]:52136 "EHLO
        relmlie4.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1754053AbdA3TTb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 30 Jan 2017 14:19:31 -0500
From: Chris Brandt <Chris.Brandt@renesas.com>
To: Jacopo Mondi <jacopo+renesas@jmondi.org>,
        "laurent.pinchart@ideasonboard.com"
        <laurent.pinchart@ideasonboard.com>,
        "geert+renesas@glider.be" <geert+renesas@glider.be>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>
CC: "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: RE: [RFC 2/5] pinctrl: rz-pfc: Add Renesas RZ/A1 pinctrl driver
Date: Mon, 30 Jan 2017 19:19:18 +0000
Message-ID: <SG2PR06MB1165C49393EAA4027B020B448A4B0@SG2PR06MB1165.apcprd06.prod.outlook.com>
References: <1485367787-8109-1-git-send-email-jacopo+renesas@jmondi.org>
 <1485367787-8109-3-git-send-email-jacopo+renesas@jmondi.org>
In-Reply-To: <1485367787-8109-3-git-send-email-jacopo+renesas@jmondi.org>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Jacopo,


On Wednesday, January 25, 2017, Jacopo Mondi wrote:
> +	/* Port 5 */
> +	RZ_PIN_NAME(5, 0), RZ_PIN_NAME(5, 1), RZ_PIN_NAME(5, 2),
> +	RZ_PIN_NAME(5, 3), RZ_PIN_NAME(5, 4), RZ_PIN_NAME(5, 5),
> +	RZ_PIN_NAME(5, 6), RZ_PIN_NAME(5, 7), RZ_PIN_NAME(5, 8),
> +	RZ_PIN_NAME(5, 9), RZ_PIN_NAME(5, 10),

The RZ/A1L (basically a subset of RZ/A1H to reduce cost) uses
all 16 port pins on "port 5" so I'd like to include them as well.



> +static const struct of_device_id rza1_pinctrl_of_match[] =3D {
> +	{ .compatible =3D "renesas,rza1-pinctrl", },
> +	{ }
> +};

Since this PFC driver file is specifically for RZ/A1, I think a
better compatible string would be:

  .compatible =3D "renesas,r7s72100-renesas-pinctrl",


Chris
