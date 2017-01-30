Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:63416 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1754037AbdA3TTb (ORCPT
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
Subject: RE: [RFC 1/5] pinctrl: rz-pfc: Add Renesas RZ pinctrl core module
Date: Mon, 30 Jan 2017 19:19:15 +0000
Message-ID: <SG2PR06MB11651AE84528322CB29B33FF8A4B0@SG2PR06MB1165.apcprd06.prod.outlook.com>
References: <1485367787-8109-1-git-send-email-jacopo+renesas@jmondi.org>
 <1485367787-8109-2-git-send-email-jacopo+renesas@jmondi.org>
In-Reply-To: <1485367787-8109-2-git-send-email-jacopo+renesas@jmondi.org>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Jacopo,

On Wednesday, January 25, 2017, Jacopo Mondi wrote:
> +
> +	return 0;
> +
> +free_map:
> +	devm_kfree(rz_pinctrl->dev, *map);
> +free_fngrps:
> +	devm_kfree(rz_pinctrl->dev, fngrps);
> +free_pins:
> +	devm_kfree(rz_pinctrl->dev, mux_modes);
> +	devm_kfree(rz_pinctrl->dev, grpins);
> +	return ret;
> +}

Since one of the benefits of using devm_kzalloc is that if
the probe fails and returns an error, all the memory associated with
that device will automatically get freed, you 'might' not
need this code to free memory.

I say might because I'm not sure if returning an error here will
kill the driver or not. But, might be interesting to look into.


> +#define RZ_PIN_NAME(bank, pin)						\
> +	PIN_##bank##_##pin
> +
> +#define RZ_PIN_DESC(b, p)						\
> +	{ .number =3D RZ_PIN_NAME(b, p),					\
> +	  .name =3D __stringify(RZ_PIN_NAME(b, p)),			\

The hardware manual uses the names "P1_0" for ports, so it might
be better to match that format for consistency.


Chris
