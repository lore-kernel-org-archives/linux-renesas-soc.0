Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:17620 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1752448AbdGFHTI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 6 Jul 2017 03:19:08 -0400
Subject: Re: [PATCH v2] ASoC: hdmi-codec: ELD control corresponds to the PCM
 stream
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>
CC: Linux-ALSA <alsa-devel@alsa-project.org>,
        Colin Ian King <colin.king@canonical.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        "Jon Medhurst (Tixy)" <tixy@linaro.org>,
        PhilippZabel <p.zabel@pengutronix.de>,
        Jaroslav Kysela <perex@perex.cz>,
        Vincent ABRIOU <vincent.abriou@st.com>,
        Simon <horms@verge.net.au>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
References: <87bmoyjteh.wl%kuninori.morimoto.gx@renesas.com>
From: Arnaud Pouliquen <arnaud.pouliquen@st.com>
Message-ID: <ee210b21-09a5-3705-c97a-baf45f49077c@st.com>
Date: Thu, 6 Jul 2017 09:16:59 +0200
MIME-Version: 1.0
In-Reply-To: <87bmoyjteh.wl%kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello,

On 07/06/2017 02:39 AM, Kuninori Morimoto wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> Current hdmi-codec driver is using hdmi_controls for "ELD" control.
> But, hdmi-codec driver might be used from many HDMIs. Thus, we need
> to correspond device number, otherwise we will receive below error.
> 
>         xxx: control x:x:x:ELD:x is already present
> 
> This patch registers ELD control in .pcm_new by using
> .device = rtd->pcm->device to corresponding to PCM stream.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> [Takashi: use snd_ctl_new1()/snd_ctl_add()]
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
> v1 -> v2
> 
>  - change title
> 	- ASoC: hdmi-codec: hdmi_codec_priv includes snd_kcontrol_new
> 	+ ASoC: hdmi-codec: ELD control corresponds to the PCM stream
>  - hdmi_eld_ctl is now local variable
>  - Author should be Takashi ?
> 
>  sound/soc/codecs/hdmi-codec.c | 31 ++++++++++++++++---------------
>  1 file changed, 16 insertions(+), 15 deletions(-)
> 
> diff --git a/sound/soc/codecs/hdmi-codec.c b/sound/soc/codecs/hdmi-codec.c
> index 22ed0dc..7686a80 100644
> --- a/sound/soc/codecs/hdmi-codec.c
> +++ b/sound/soc/codecs/hdmi-codec.c
> @@ -399,18 +399,6 @@ static int hdmi_codec_chmap_ctl_get(struct snd_kcontrol *kcontrol,
>  	return 0;
>  }
>  
> -
> -static const struct snd_kcontrol_new hdmi_controls[] = {
> -	{
> -		.access = SNDRV_CTL_ELEM_ACCESS_READ |
> -			  SNDRV_CTL_ELEM_ACCESS_VOLATILE,
> -		.iface = SNDRV_CTL_ELEM_IFACE_PCM,
> -		.name = "ELD",
> -		.info = hdmi_eld_ctl_info,
> -		.get = hdmi_eld_ctl_get,
> -	},
> -};
> -
>  static int hdmi_codec_new_stream(struct snd_pcm_substream *substream,
>  				 struct snd_soc_dai *dai)
>  {
> @@ -668,6 +656,16 @@ static int hdmi_codec_pcm_new(struct snd_soc_pcm_runtime *rtd,
>  {
>  	struct snd_soc_dai_driver *drv = dai->driver;
>  	struct hdmi_codec_priv *hcp = snd_soc_dai_get_drvdata(dai);
> +	struct snd_kcontrol *kctl;
> +	struct snd_kcontrol_new hdmi_eld_ctl = {
> +		.access	= SNDRV_CTL_ELEM_ACCESS_READ |
> +			  SNDRV_CTL_ELEM_ACCESS_VOLATILE,
> +		.iface	= SNDRV_CTL_ELEM_IFACE_PCM,
> +		.name	= "ELD",
> +		.info	= hdmi_eld_ctl_info,
> +		.get	= hdmi_eld_ctl_get,
> +		.device	= rtd->pcm->device,
> +	};
>  	int ret;
>  
>  	dev_dbg(dai->dev, "%s()\n", __func__);
> @@ -686,7 +684,12 @@ static int hdmi_codec_pcm_new(struct snd_soc_pcm_runtime *rtd,
>  	hcp->chmap_info->chmap = hdmi_codec_stereo_chmaps;
>  	hcp->chmap_idx = HDMI_CODEC_CHMAP_IDX_UNKNOWN;
>  
> -	return 0;
> +	/* add ELD ctl with the device number corresponding to the PCM stream */
> +	kctl = snd_ctl_new1(&hdmi_eld_ctl, dai->component);
> +	if (!kctl)
> +		return -ENOMEM;
> +
> +	return snd_ctl_add(rtd->card->snd_card, kctl);
>  }
>  
>  static struct snd_soc_dai_driver hdmi_i2s_dai = {
> @@ -732,8 +735,6 @@ static int hdmi_of_xlate_dai_id(struct snd_soc_component *component,
>  
>  static struct snd_soc_codec_driver hdmi_codec = {
>  	.component_driver = {
> -		.controls		= hdmi_controls,
> -		.num_controls		= ARRAY_SIZE(hdmi_controls),
>  		.dapm_widgets		= hdmi_widgets,
>  		.num_dapm_widgets	= ARRAY_SIZE(hdmi_widgets),
>  		.dapm_routes		= hdmi_routes,
> 

Acked-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>

Regards,

Arnaud
