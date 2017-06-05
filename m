Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from civicrm.laptop.org ([18.85.44.157]:37173 "EHLO swan.laptop.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751290AbdFEFVg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 5 Jun 2017 01:21:36 -0400
Date: Mon, 5 Jun 2017 15:15:47 +1000
From: James Cameron <quozl@laptop.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mark Brown <broonie@kernel.org>, linux-renesas-soc@vger.kernel.org,
        Linux-ALSA <alsa-devel@alsa-project.org>,
        Simon <horms@verge.net.au>
Subject: Re: [alsa-devel] [PATCH] ASoC: audio-graph-scu-card: add missing MIX
 binding example
Message-ID: <20170605051547.GC25989@us.netrek.org>
References: <87h8zvdq17.wl%kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87h8zvdq17.wl%kuninori.morimoto.gx@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Jun 05, 2017 at 04:25:15AM +0000, Kuninori Morimoto wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  .../bindings/sound/audio-graph-scu-card.txt        | 47 +++++++++++++++++++++-
>  1 file changed, 46 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/audio-graph-scu-card.txt b/Documentation/devicetree/bindings/sound/audio-graph-scu-card.txt
> index b2dd23f..ca494cf 100644
> --- a/Documentation/devicetree/bindings/sound/audio-graph-scu-card.txt
> +++ b/Documentation/devicetree/bindings/sound/audio-graph-scu-card.txt
> @@ -35,7 +35,7 @@ Required properties:
>  - compatible				: "audio-graph-scu-card";
>  - dais					: list of CPU DAI port{s}
>  
> -Example
> +Example 1. Sampling Rate Covert

Other documentation refers to sampling rate conversion or converter
unit, but simple-scu-card.txt and your patch refer to making the
sampling rate covert.  Perhaps "covert" should be "convert."

-- 
James Cameron
http://quozl.netrek.org/
