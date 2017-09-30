Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f42.google.com ([209.85.215.42]:50938 "EHLO
        mail-lf0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750991AbdI3KDm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 30 Sep 2017 06:03:42 -0400
Received: by mail-lf0-f42.google.com with SMTP id d4so1749771lfj.7
        for <linux-renesas-soc@vger.kernel.org>; Sat, 30 Sep 2017 03:03:41 -0700 (PDT)
Subject: Re: [PATCH 4/6] ASoC: rsnd: CTU kctrl sets once
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Mark Brown <broonie@kernel.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
        Simon <horms@verge.net.au>, linux-renesas-soc@vger.kernel.org,
        Hiroyuki Yokoyama <hiroyuki.yokoyama.vx@renesas.com>
References: <87tvzmgyqv.wl%kuninori.morimoto.gx@renesas.com>
 <87o9pugynb.wl%kuninori.morimoto.gx@renesas.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <a524bf6d-0e49-def5-6fd7-00a4405bb01f@cogentembedded.com>
Date: Sat, 30 Sep 2017 13:03:39 +0300
MIME-Version: 1.0
In-Reply-To: <87o9pugynb.wl%kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

On 9/29/2017 3:10 AM, Kuninori Morimoto wrote:

> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> Same CTU might be used few times if system/platform is using MIX.
> For example below case.
> 
> 	DAI0 playback = <&src0 &ctu02 &mix0 &dvc0 &ssi0>;
> 	DAI1 playback = <&src2 &ctu03 &mix0 &dvc0 &ssi0>;
> 
> This case, ALSA will have CTU,0 and CTU,1 kcontrol interfaces,
> but these are same CTU. This is confusable.

    Again, confusing,

> This patch adds new flags and avoid such case.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Tested-by: Hiroyuki Yokoyama <hiroyuki.yokoyama.vx@renesas.com>
> ---
>   sound/soc/sh/rcar/ctu.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/sound/soc/sh/rcar/ctu.c b/sound/soc/sh/rcar/ctu.c
> index e7f53f4..1536d9d 100644
> --- a/sound/soc/sh/rcar/ctu.c
> +++ b/sound/soc/sh/rcar/ctu.c
> @@ -81,8 +81,11 @@ struct rsnd_ctu {
>   	struct rsnd_kctrl_cfg_m sv3;
>   	struct rsnd_kctrl_cfg_s reset;
>   	int channels;
> +	u32 flags;
>   };
>   
> +#define KCTRL_INITIALIZEED	(1 << 0)
> +

    Again, one E is enough. :-)

[...]

MBR, Sergei
