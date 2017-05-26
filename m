Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
Subject: Re: [PATCH 5/5] drm: dw-hdmi-i2s: add .get_dai_id callback for ALSA
 SoC
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Mark Brown <broonie@kernel.org>
References: <87efvnosnb.wl%kuninori.morimoto.gx@renesas.com>
 <877f1fosji.wl%kuninori.morimoto.gx@renesas.com>
 <20170524173849.h7jkmkrwk47pn6kd@sirena.org.uk>
 <877f1525qq.wl%kuninori.morimoto.gx@renesas.com>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
        Simon <horms@verge.net.au>, linux-renesas-soc@vger.kernel.org,
        David Airlie <airlied@linux.ie>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Russell King <rmk+kernel@armlinux.org.uk>,
        Jose Abreu <joabreu@synopsys.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
From: Archit Taneja <architt@codeaurora.org>
Message-ID: <55fd9644-2a71-866c-af51-260abb38c50a@codeaurora.org>
Date: Fri, 26 May 2017 09:46:31 +0530
MIME-Version: 1.0
In-Reply-To: <877f1525qq.wl%kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi,

On 05/25/2017 05:04 AM, Kuninori Morimoto wrote:
>
> Hi Mark
> Cc: DRM maintainer
>
>>> ALSA SoC needs to know connected DAI ID for probing.
>>> It is not a big problem if device/driver was only for sound,
>>> but getting DAI ID will be difficult if device includes both
>>> Video/Sound, like HDMI.
>>
>> As far as I understand what's going on with the graph code this seems to
>> make sense to me.  How do we want to go about handling the patch?
>
> This is comment to me ? or DRM maintainer ?
>
> If to me, any case (pickup by Mark, or by DRM maintainer) is OK for me

I'll pick it up for drm-misc-next.

Thanks,
Archit

>
> Best regards
> ---
> Kuninori Morimoto
>

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
