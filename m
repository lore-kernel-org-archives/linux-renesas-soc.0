Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f65.google.com ([209.85.215.65]:36717 "EHLO
	mail-lf0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751623AbcFYUp5 (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Sat, 25 Jun 2016 16:45:57 -0400
Received: by mail-lf0-f65.google.com with SMTP id a2so25117990lfe.3
        for <linux-renesas-soc@vger.kernel.org>; Sat, 25 Jun 2016 13:45:57 -0700 (PDT)
Subject: Re: [PATCH 03/11] ASoC: simple-card-utils: add
 asoc_simple_card_parse_dailink_name()
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
References: <87wplfxumi.wl%kuninori.morimoto.gx@renesas.com>
 <87shw3xui4.wl%kuninori.morimoto.gx@renesas.com>
Cc: Mark Brown <broonie@kernel.org>,
	Linux-ALSA <alsa-devel@alsa-project.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Simon <horms@verge.net.au>, linux-renesas-soc@vger.kernel.org
From: Sylwester Nawrocki <sylwester.nawrocki@gmail.com>
Message-ID: <576EED81.3010203@gmail.com>
Date: Sat, 25 Jun 2016 22:45:53 +0200
MIME-Version: 1.0
In-Reply-To: <87shw3xui4.wl%kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 06/24/2016 03:16 AM, Kuninori Morimoto wrote:

> +int asoc_simple_card_parse_dailink_name(struct device *dev,
> +					struct snd_soc_dai_link *dai_link)
> +{
> +	char *name = NULL;
> +	int ret = -ENOMEM;
> +
> +	if (dai_link->dynamic && dai_link->cpu_dai_name) {
> +		name = devm_kzalloc(dev,
> +				    strlen(dai_link->cpu_dai_name) + 4,
> +				    GFP_KERNEL);
> +		if (name)
> +			sprintf(name, "fe.%s", dai_link->cpu_dai_name);
> +
> +	} else if (dai_link->no_pcm && dai_link->codec_dai_name) {
> +		name = devm_kzalloc(dev,
> +				    strlen(dai_link->codec_dai_name) + 4,
> +				    GFP_KERNEL);
> +		if (name)
> +			sprintf(name, "be.%s", dai_link->codec_dai_name);
> +	} else if (dai_link->cpu_dai_name && dai_link->codec_dai_name) {
> +		name = devm_kzalloc(dev,
> +				    strlen(dai_link->cpu_dai_name)   +
> +				    strlen(dai_link->codec_dai_name) + 2,
> +				    GFP_KERNEL);
> +		if (name) {
> +			sprintf(name, "%s-%s",
> +				dai_link->cpu_dai_name,
> +				dai_link->codec_dai_name);
> +		}
> +	}

This could be simplified by using devm_kasprintf().
