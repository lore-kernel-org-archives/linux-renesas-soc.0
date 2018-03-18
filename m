Return-Path: <devicetree-owner@vger.kernel.org>
Date: Sun, 18 Mar 2018 07:52:54 -0500
From: Rob Herring <robh@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] ASoC: rsnd: Document R-Car M3-W support
Message-ID: <20180318033451.d4ejjp34k6udgvex@rob-hp-laptop>
References: <1521208785-5698-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1521208785-5698-1-git-send-email-geert+renesas@glider.be>
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Mar 16, 2018 at 02:59:45PM +0100, Geert Uytterhoeven wrote:
> Document support for the sound modules in the Renesas M3-W (r8a7796)
> SoC.
> 
> No driver update is needed.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> "renesas,rcar_sound-r8a7796" has been in use since quite a while, but
> the binding update was still missing.
> ---
>  Documentation/devicetree/bindings/sound/renesas,rsnd.txt | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Rob Herring <robh@kernel.org>

