Return-Path: <SRS0=/KHX=RY=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E75A9C43381
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 21 Mar 2019 14:24:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C1C1F218FD
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 21 Mar 2019 14:24:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727809AbfCUOYE (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 21 Mar 2019 10:24:04 -0400
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:56605 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728166AbfCUOYE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Mar 2019 10:24:04 -0400
X-Originating-IP: 2.224.242.101
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 8A8A2E000B;
        Thu, 21 Mar 2019 14:24:00 +0000 (UTC)
Date:   Thu, 21 Mar 2019 15:24:39 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Chris Brandt <chris.brandt@renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH] pinctrl: rza1: Remove unneeded spinlock acquisitions
Message-ID: <20190321142439.4fvsubhmwko6m5y2@uno.localdomain>
References: <20190320102629.19865-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="sq4j6pvm7nj3yrls"
Content-Disposition: inline
In-Reply-To: <20190320102629.19865-1-geert+renesas@glider.be>
User-Agent: NeoMutt/20180716
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--sq4j6pvm7nj3yrls
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Geert,

On Wed, Mar 20, 2019 at 11:26:29AM +0100, Geert Uytterhoeven wrote:
> rza1_get_bit() is just a single register read.  Hence there's no need to
> synchronize it with other register writes to the same bank.
>

Thanks, no need to protect that single register access.
I assume you've been carrying this patch in your tree for your RSKRZA1
recent developments.

Acked-by: Jacopo Mondi <jacopo@jmondi.org>

Thanks
   j

> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> To be queued in sh-pfc-for-v5.2.
>
>  drivers/pinctrl/pinctrl-rza1.c | 18 ++----------------
>  1 file changed, 2 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/pinctrl/pinctrl-rza1.c b/drivers/pinctrl/pinctrl-rza1.c
> index 9cfe9d0520acaf61..021e37b7689e4fda 100644
> --- a/drivers/pinctrl/pinctrl-rza1.c
> +++ b/drivers/pinctrl/pinctrl-rza1.c
> @@ -620,14 +620,7 @@ static void rza1_pin_reset(struct rza1_port *port, unsigned int pin)
>  static inline int rza1_pin_get_direction(struct rza1_port *port,
>  					 unsigned int pin)
>  {
> -	unsigned long irqflags;
> -	int input;
> -
> -	spin_lock_irqsave(&port->lock, irqflags);
> -	input = rza1_get_bit(port, RZA1_PM_REG, pin);
> -	spin_unlock_irqrestore(&port->lock, irqflags);
> -
> -	return !!input;
> +	return !!rza1_get_bit(port, RZA1_PM_REG, pin);
>  }
>
>  /**
> @@ -671,14 +664,7 @@ static inline void rza1_pin_set(struct rza1_port *port, unsigned int pin,
>
>  static inline int rza1_pin_get(struct rza1_port *port, unsigned int pin)
>  {
> -	unsigned long irqflags;
> -	int val;
> -
> -	spin_lock_irqsave(&port->lock, irqflags);
> -	val = rza1_get_bit(port, RZA1_PPR_REG, pin);
> -	spin_unlock_irqrestore(&port->lock, irqflags);
> -
> -	return val;
> +	return rza1_get_bit(port, RZA1_PPR_REG, pin);
>  }
>
>  /**
> --
> 2.17.1
>

--sq4j6pvm7nj3yrls
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAlyTnqcACgkQcjQGjxah
VjzAXA/9EwfMHP9cWSZVPVuyLmEuJPSX1A/zHdvIlSVBgCx/CC//oqFhcAbSui/x
0JtIfqTDPLDUuRy6biIYzPXNundjpcjWJYoTrzHd/I8Nq8p9LdVr5RPbSnWqNy6d
ZshjawbPhWFACr38enrhRq9ztee1uqUFnBUcJ3n4BYehzjeOLVBIsLgie6x7O/dG
rjgzbvMJZ2nWNLeIXvAEAdMdxOsWnepder0cSipXN9B4Z7HzFus1tpWmgjbZ1F1d
h5ESwxZGYi07THtPATCQfTxAw1FxzGdxJKyKSo66502topgAQmlp4fNQ8uyaMDzm
0HCuzjssIJaW3UQXyClfdlZxNrlHHc+iH2TM/Sq2vMLjB9yoEV9RyguATqxQhNG5
KmcPOz/JpTmr4CjSBIB47jt8+AyBO4FZspxnnEwGfbnnQxR5U+884HS+z8LUg78J
YuUQLN+rjjZ84GRrfx+g+2sp0bf1z3Vmfi0/JnM7ZrB/TW9mgq+wpsuKDy862CTl
SpmLf2hgAJmtoAH0PCzH+gDuhOoJ6YtBxkTRkFmxBz6HwfFGjD2WuAKn02ndM4kE
FwykfndJQd/R8frfe12GntboAb08lAeRHWPvX0ZUn/xo4DqY5R7eWv/K0fUmtEz5
4N7PV6DHUNVg0aWu2cpocs0sjnRKaL6WwZQZXYCH1wM6iJ3ec5Y=
=oHF0
-----END PGP SIGNATURE-----

--sq4j6pvm7nj3yrls--
