Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp-proxy001.phy.lolipop.jp ([157.7.104.42]:45220 "EHLO
	smtp-proxy001.phy.lolipop.jp" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753319AbcHDD1A (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 3 Aug 2016 23:27:00 -0400
Subject: Re: Question about struct snd_soc_dai() :: cpu_dai->codec
To: Mark Brown <broonie@kernel.org>
References: <s5h1t2f6jdm.wl-tiwai@suse.de>
 <20160727182233.GV11806@sirena.org.uk> <s5hpopy6dbi.wl-tiwai@suse.de>
 <20160728034643.GH9681@localhost> <579A6C1B.2060904@metafoo.de>
 <579AA39B.5030100@sakamocchi.jp>
 <884bd15f-da5e-49f5-73ee-d8173dc0720a@metafoo.de>
 <20160729160702.GK9681@localhost> <s5hy44k41oa.wl-tiwai@suse.de>
 <ab6b5a69-9d36-b4a5-0b8f-10a7dcf1ea40@sakamocchi.jp>
 <20160729220854.GN10376@sirena.org.uk>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Takashi Iwai <tiwai@suse.de>,
	Liam Girdwood <lgirdwood@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	Vinod Koul <vinod.koul@intel.com>, Simon <horms@verge.net.au>
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Message-ID: <5152607b-90ab-1675-6be8-986be880a8eb@sakamocchi.jp>
Date: Thu, 4 Aug 2016 12:17:57 +0900
MIME-Version: 1.0
In-Reply-To: <20160729220854.GN10376@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Jul 30 2016 07:08, Mark Brown wrote:
>> But I think it's logically difficult to manage state of sound card; e.g.
>> disconnect. When one sound card instance consists of instances of
>> several 'DAI', 'Codecs' and 'Components' (this 'component' is not in
>> ALSA core contexts[1]) and we try to unload one of them, then which
>> state the card should be assigned to? Or no 'Codecs' drivers are loaded,
>> then which state should be assigned to the card?
>
> The card only instantiates when all the components of the card are
> present, until then it defers probe.

Oops. I forgot ALSA soc part utilizes EPROBE_DEFER. Thanks for your 
correction.

>> Additionally, when old Codec driver is unloaded and new Codec driver is
>> loaded, then what should we do for corresponding PCM character devices
>> are? Currently, once snd_card_regsiter() is called, we cannot
>> insert/delete ALSA components such like PCM.
>
> The card should be deinstantiated and reinstantiated whenever a
> component driver unbinds and rebinds (respectively).  You'd need to
> completely deregister the card to change the list of things it's
> expecting currently.

In a point of application interfaces, I guess that current 
implementation of ALSA soc part includes a bug that it's possible to 
unload codec or component modules when any ALSA character devices are 
opened. The framework has no codes to manage reference counting of 
character devices or loaded codecs, components.

Here, any of suggestions comes from my code reading. I apologize if 
they're wrong.


Regards

Takashi Sakamoto
