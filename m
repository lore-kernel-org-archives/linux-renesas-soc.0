Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail.bootlin.com ([62.4.15.54]:56995 "EHLO mail.bootlin.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387441AbeKFGhl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 6 Nov 2018 01:37:41 -0500
Date: Mon, 5 Nov 2018 22:15:23 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Archit Taneja <architt@codeaurora.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        David Airlie <airlied@linux.ie>, Peter Rosin <peda@axentia.se>,
        Wolfram Sang <wsa@the-dreams.de>,
        Mark Brown <broonie@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
        Inki Dae <inki.dae@samsung.com>,
        Boris Brezillon <boris.brezillon@free-electrons.com>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] drm/bridge/sii902x: Fix EDID readback
Message-ID: <20181105221523.4b90c87e@bbrezillon>
In-Reply-To: <1541426208-25434-1-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1541426208-25434-1-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Fabrizio,

Thanks for working on that. I think your solution fixes the issue we had
on atmel boards [1] in a clean way (still have to find some time to
test it).

On Mon,  5 Nov 2018 13:56:48 +0000
Fabrizio Castro <fabrizio.castro@bp.renesas.com> wrote:

> @@ -441,6 +558,9 @@ static int sii902x_remove(struct i2c_client *client)
>  {
>  	struct sii902x *sii902x = i2c_get_clientdata(client);
>  
> +	if (sii902x->i2cmux)
> +		i2c_mux_del_adapters(sii902x->i2cmux);
> +

Just one tiny detail: I think you can safely call i2c_mux_del_adapters()
unconditionally since ->remove() will only be called if ->probe()
succeeded, which guarantees that sii902x->i2cmux != NULL.


>  	drm_bridge_remove(&sii902x->bridge);
>  
>  	return 0;

[1]https://patchwork.kernel.org/patch/9532005/
