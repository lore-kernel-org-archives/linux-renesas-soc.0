Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:36910 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756832AbcKXIET (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 Nov 2016 03:04:19 -0500
Subject: Re: [PATCH v4] drm: bridge: add DesignWare HDMI I2S audio support
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
References: <8737j2bxba.wl%kuninori.morimoto.gx@renesas.com>
 <20161108111009.GO1041@n2100.armlinux.org.uk>
 <87oa1pscne.wl%kuninori.morimoto.gx@renesas.com>
 <87vavdcvgh.wl%kuninori.morimoto.gx@renesas.com>
Cc: Russell King - ARM Linux <linux@armlinux.org.uk>,
        Mark Brown <broonie@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Fabio Estevam <fabio.estevam@freescale.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Koji Matsuoka <koji.matsuoka.xm@renesas.com>,
        Thierry Reding <treding@nvidia.com>,
        Linux-ALSA <alsa-devel@alsa-project.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Simon <horms@verge.net.au>, linux-renesas-soc@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Jose Abreu <joabreu@synopsys.com>
From: Archit Taneja <architt@codeaurora.org>
Message-ID: <626df165-da09-298e-ed60-03d4119caec2@codeaurora.org>
Date: Thu, 24 Nov 2016 13:34:03 +0530
MIME-Version: 1.0
In-Reply-To: <87vavdcvgh.wl%kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi,

On 11/24/2016 10:43 AM, Kuninori Morimoto wrote:
>
> Hi Archit, David, and DRM ML
>
> I had heared that Archit is the maintainer of dw-hdmi driver, but am I wrong ??
> I'm posting this patch series since half year ago, but no response
> from him, and nothing happen (I got review from Russell though).
> Is Archit really maintainer ??
> OTOH, get_maintainer.pl indicates David is the maintainer ?
> What should I do for this patch ??

I'm not the maintainer of the dw-hdmi driver, but I pull in the
changes that go into drm/bridge/

Will pull this.

Thanks,
Archit


>
>> Hi Russell
>>
>>>> @@ -11,4 +11,11 @@ struct dw_hdmi_audio_data {
>>>>  	u8 *eld;
>>>>  };
>>>>
>>>> +struct dw_hdmi_i2s_audio_data {
>>>> +	struct dw_hdmi *hdmi;
>>>> +
>>>> +	void (*write)(struct dw_hdmi *hdmi, u8 val, int offset);
>>>> +	u8 (*read)(struct dw_hdmi *hdmi, int offset);
>>>> +};
>>>
>>> Another slight concern here is why we need this separate data for i2s -
>>> maybe adding the write/read ops to struct dw_hdmi_audio_data would be
>>> a better thing to do, which would then allow the AHB audio to drop
>>> the .base argument in the future.
>>>
>>> I'm not that bothered about this though.  So...
>>
>> Thank you for your feedback.
>> Maybe we can merge these in incremental patch if needed ?
>>

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
